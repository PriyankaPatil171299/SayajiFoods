table 60004 "Web Order Header"
{
    // LFS 28.10.2014  Order weight and cubage added.


    fields
    {
        field(1; "Web Order No."; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Web Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(4; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Purchase Order No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Purchase Order Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Order Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Billing Location"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(9; "Against C Form"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Special Price"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Salesperson; Code[10])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Salesperson/Purchaser; //psp
        }
        field(13; "Salesperson Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Credit Days"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Rejected,Pending Acceptance';
            OptionMembers = Open,Rejected,"Pending Acceptance";
        }
        field(16; "Accept Terms and Conditions"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Name of Person"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Confirm Outstanding Amount"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Modified By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Modified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Dispatch Location"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(24; ConvertToBlanketOrder; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25; ConvertedBy; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; ConvertedOn; DateTime)
        {
        }
        field(27; Remarks; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(28; ReasonForRejection; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Ship-to Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Ship-to Address 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Ship-to Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Ship-to City"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(33; ShipToBillToSame; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Project Number"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Order Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Order Cubage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Extend Days"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Web Order No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created On" := CURRENTDATETIME;
    end;

    trigger OnModify()
    var
        WebOrderHeaderTemp: Record "Web Order Header";
    begin
        "Modified On" := CURRENTDATETIME;

        WebOrderHeaderTemp.RESET;
        WebOrderHeaderTemp.SETRANGE(WebOrderHeaderTemp."Customer No.", "Customer No.");
        WebOrderHeaderTemp.SETRANGE(WebOrderHeaderTemp."Purchase Order No.", "Purchase Order No.");
        WebOrderHeaderTemp.SETFILTER(WebOrderHeaderTemp."Web Order No.", '<>%1', "Web Order No.");
        IF WebOrderHeaderTemp.FINDFIRST THEN
            ERROR('DUPLICATE ORDER NO');  // DO NOT CHANGE THE WORDINGS OF THIS ERROR MESSAGE AS IT IS TRACED IN THE DOTNET WEB ORDER SYSTEM.
    end;
}

