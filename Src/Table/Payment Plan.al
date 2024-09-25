table 60000 "Payment Plan"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Customer Code"; Code[20])
        {

            trigger OnValidate()
            begin
                IF Customer.GET("Customer Code") THEN
                    "Customer GRP Code" := Customer.custgrpcode;
            end;
        }
        field(3; "Web Order No"; Code[20])
        {
        }
        field(4; "Mode Of Payment"; Option)
        {
            OptionCaption = ' ,Cheque,LC,RTGS,Credit Note';
            OptionMembers = " ",Cheque,LC,RTGS,"Credit Note";
        }
        field(5; "Expected Payment Date"; Date)
        {
        }
        field(6; "Expected Payment Amount"; Decimal)
        {
        }
        field(7; Remarks; Text[250])
        {
        }
        field(9; TempLineNo; Text[100])
        {
        }
        field(50000; "Created By"; Code[20])
        {
        }
        field(50001; "Created On"; DateTime)
        {
        }
        field(50002; "Modified By"; Code[20])
        {
        }
        field(50003; "Modified On"; DateTime)
        {
        }
        field(50004; "Customer GRP Code"; Code[20])
        {
        }
        field(50005; "Cheque No."; Text[30])
        {
            Description = 'DSS-AK "09-12-13"';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
        key(Key2; "Customer Code", "Expected Payment Date", "Mode Of Payment")
        {
            SumIndexFields = "Expected Payment Amount";
        }
    }

    fieldgroups
    {
    }

    var
        Customer: Record Customer;
}

