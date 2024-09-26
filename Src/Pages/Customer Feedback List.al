page 60003 "Customer Feedback List"
{
    PageType = List;
    SourceTable = "Customer Feedback";
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Feedback No."; Rec."Feedback No.")
                {
                    ApplicationArea = All;
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = All;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Nature of Feedback"; Rec."Nature of Feedback")
                {
                    ApplicationArea = All;
                }
                field(References; Rec.References)
                {
                    ApplicationArea = All;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                }
                field(Feedback; Rec.Feedback)
                {
                    ApplicationArea = All;
                }
                field("Actioned On"; Rec."Actioned On")
                {
                    ApplicationArea = All;
                }
                field("Actioned By"; Rec."Actioned By")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

