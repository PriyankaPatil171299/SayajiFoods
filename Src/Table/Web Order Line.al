table 60005 "Web Order Line"
{

    fields
    {
        field(1; "Web Order Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Web Order Header No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Ceiling,Flooring';
            OptionMembers = Ceiling,Flooring;
        }
        field(4; "Vendor Item No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Item Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(8; "Available Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Order Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Conversion Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Rate; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Item Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Rqstd Dispatch Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Status; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
            OptionCaption = 'Under process,Pending dispatch, Dispatched';
            OptionMembers = "Under process","Pending dispatch"," Dispatched";
        }
        field(15; "Accepted Qty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Modified By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Modified On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(20; TempLineNo; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Sales UOM"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Base UOM"; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(23; CustCode; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; LoginCustID; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; UOMConversionFactor; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; Size; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(27; Thickness; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Blanket Order No."; Code[30])
        {
            // FieldClass = FlowField;
            // CalcFormula = Lookup("Sales Line"."Document No." WHERE("Web Order No" = FIELD("Web Order Header No."),
            //                                                         "Web Order Line No." = FIELD("Web Order Line No."))); //psp
            Editable = false;

        }
    }

    keys
    {
        key(Key1; "Web Order Line No.", "Web Order Header No.")
        {
            Clustered = true;
        }
        key(Key2; CustCode)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        TempWebOrderLine: Record "Web Order Line";
    begin
        TempWebOrderLine.RESET;
        TempWebOrderLine.SETRANGE(TempWebOrderLine."Web Order Header No.", "Web Order Header No.");
        IF TempWebOrderLine.FINDLAST THEN
            "Web Order Line No." := TempWebOrderLine."Web Order Line No." + 10000
        ELSE
            "Web Order Line No." := 10000;

        "Created On" := CURRENTDATETIME;
    end;

    trigger OnModify()
    begin
        "Modified On" := CURRENTDATETIME;
    end;
}

