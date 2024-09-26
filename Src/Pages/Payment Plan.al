page 60004 "Payment Plan"
{
    PageType = List;
    Caption = 'Payment Plan';
    SourceTable = "Payment Plan";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = All;
                }
                field("Web Order No"; Rec."Web Order No")
                {
                    ApplicationArea = All;
                }
                field("Mode Of Payment"; Rec."Mode Of Payment")
                {
                    ApplicationArea = All;
                }
                field("Expected Payment Date"; Rec."Expected Payment Date")
                {
                    ApplicationArea = All;
                }
                field("Expected Payment Amount"; Rec."Expected Payment Amount")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                }
                field(TempLineNo; Rec.TempLineNo)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = All;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified On"; Rec."Modified On")
                {
                    ApplicationArea = All;
                }
                field("Customer GRP Code"; Rec."Customer GRP Code")
                {
                    ApplicationArea = All;
                }
                field("Cheque No."; Rec."Cheque No.")
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

