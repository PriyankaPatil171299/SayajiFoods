table 60006 "Customer Feedback"
{

    fields
    {
        field(1; "Feedback No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Feedback Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Customer Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Nature of Feedback"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Suggestion,Complaint,Request';
            OptionMembers = Suggestion,Complaint,Request;
        }
        field(6; References; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General,Order,Invoice,Outstanding';
            OptionMembers = General,"Order",Invoice,Outstanding;
        }
        field(7; "Reference No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Feedback; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Actioned On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Actioned By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Created By"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;
        }
    }

    keys
    {
        key(Key1; "Feedback No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Feedback Date" := TODAY;
    end;
}

