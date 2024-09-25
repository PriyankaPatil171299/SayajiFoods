page 60000 "WebOrderHeader List"
{
    PageType = List;
    Caption = 'Web Order Header List';
    SourceTable = "Web Order Header";
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Web Order No."; Rec."Web Order No.")
                {
                    ApplicationArea = all;
                }
                field("Web Order Date"; Rec."Web Order Date")
                {
                    ApplicationArea = all;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = all;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = all;
                }
                field("Purchase Order Date"; Rec."Purchase Order Date")
                {
                    ApplicationArea = all;
                }
                field("Order Value"; Rec."Order Value")
                {
                    ApplicationArea = all;
                }
                field("Billing Location"; Rec."Billing Location")
                {
                    ApplicationArea = all;
                }
                field("Against C Form"; Rec."Against C Form")
                {
                    ApplicationArea = all;
                }
                field("Special Price"; Rec."Special Price")
                {
                    ApplicationArea = all;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = all;
                }
                field(Salesperson; Rec.Salesperson)
                {
                    ApplicationArea = all;
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = all;
                }
                field("Credit Days"; Rec."Credit Days")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Accept Terms and Conditions"; Rec."Accept Terms and Conditions")
                {
                    ApplicationArea = all;
                }
                field("Name of Person"; Rec."Name of Person")
                {
                    ApplicationArea = all;
                }
                field("Confirm Outstanding Amount"; Rec."Confirm Outstanding Amount")
                {
                    ApplicationArea = all;
                }
                field("Dispatch Location"; Rec."Dispatch Location")
                {
                    ApplicationArea = all;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = all;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = all;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = all;
                }
                field("Modified On"; Rec."Modified On")
                {
                    ApplicationArea = all;
                }
                field(ConvertToBlanketOrder; Rec.ConvertToBlanketOrder)
                {
                    ApplicationArea = all;
                }
                field(ConvertedBy; Rec.ConvertedBy)
                {
                    ApplicationArea = all;
                }
                field(ConvertedOn; Rec.ConvertedOn)
                {
                    ApplicationArea = all;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = all;
                }
                field(ReasonForRejection; Rec.ReasonForRejection)
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = all;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = all;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = all;
                }
                field(ShipToBillToSame; Rec.ShipToBillToSame)
                {
                    ApplicationArea = all;
                }
                field("Project Number"; Rec."Project Number")
                {
                    ApplicationArea = all;
                }
                field("Order Weight"; Rec."Order Weight")
                {
                    ApplicationArea = all;
                }
                field("Order Cubage"; Rec."Order Cubage")
                {
                    ApplicationArea = all;
                }
                field("Extend Days"; Rec."Extend Days")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
    }
}

