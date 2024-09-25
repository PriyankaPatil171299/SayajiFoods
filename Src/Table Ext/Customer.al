tableextension 60001 "Customer" extends Customer
{
    fields
    {
        field(50000; "TOD Customer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Customer User Name"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Customer Password"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Show Inventory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Expected Payment Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Payment Plan"."Expected Payment Amount" WHERE("Customer Code" = FIELD("No."),
                                                                                  "Expected Payment Date" = FIELD("Web Order Date Filter"),
                                                                                 "Mode Of Payment" = FILTER(<> "Credit Note")));
        }
        field(50005; "Web Order Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50006; "Ageing Bucket 1 Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50007; "Ageing Bucket 2 Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50008; "Ageing Bucket 3 Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50009; "Ageing Bucket 4 Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50010; "Ageing Bucket 1 Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Posting Date" = FIELD(UPPERLIMIT("Ageing Bucket 1 Date Filter")),
                                                                                 "Initial Entry Due Date" = FIELD("Ageing Bucket 1 Date Filter")));
        }
        field(50011; "Ageing Bucket 2 Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Posting Date" = FIELD(UPPERLIMIT("Ageing Bucket 2 Date Filter")),
                                                                                 "Initial Entry Due Date" = FIELD("Ageing Bucket 2 Date Filter")));
        }
        field(50012; "Ageing Bucket 3 Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Posting Date" = FIELD(UPPERLIMIT("Ageing Bucket 3 Date Filter")),
                                                                                 "Initial Entry Due Date" = FIELD("Ageing Bucket 3 Date Filter")));

        }
        field(50013; "Ageing Bucket 4 Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("No."),
                                                                                 "Posting Date" = FIELD(UPPERLIMIT("Ageing Bucket 4 Date Filter")),
                                                                                 "Initial Entry Due Date" = FIELD("Ageing Bucket 4 Date Filter")));
        }
        field(50014; "LastLogIn"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "LastLogOut"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(50016; "Change Password"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50017; "Sales Person Email ID"; Text[80])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Salesperson/Purchaser"."E-Mail" WHERE(Code = FIELD("Salesperson Code")));
        }
        field(50018; "Show in web order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; "custgrpcode"; code[10])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key50000; custgrpcode)
        {

        }
    }
    trigger OnModify()
    var
        TempCustomerRec: Record Customer;

    begin
        IF "Customer User Name" <> xRec."Customer User Name" THEN BEGIN
            TempCustomerRec.RESET;
            TempCustomerRec.SETRANGE(TempCustomerRec."Customer User Name", "Customer User Name");
            TempCustomerRec.SETFILTER(TempCustomerRec."No.", '<>%1', "No.");
            // DO NOT CHANGE THE ERROR DESCRIPTION AS IT IS TRACED IN WEB ORDER.
            IF TempCustomerRec.FINDFIRST THEN
                ERROR('DUPLICATE CUSTOMER USER NAME');
        end;
    end;



}
