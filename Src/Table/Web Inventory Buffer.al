table 60003 "Web Inventory Buffer"
{

    fields
    {
        field(1; "Customer ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Vendor Item No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Location Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Available Qty."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Base UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Item Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Sales UOM"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "UOM Conversion Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; UserID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; LoginCustId; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Allow Decimal"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Customer ID", "Vendor Item No.", "Location Code", UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

