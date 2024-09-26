page 60005 "Web Order Inventory"
{
    PageType = List;
    SourceTable = "Web Inventory Buffer";
    Caption = 'Web Order Inventory';
    ApplicationArea = all;
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field("Available Qty."; Rec."Available Qty.")
                {
                    ApplicationArea = all;
                }
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = all;
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                }
                field("Base UOM"; Rec."Base UOM")
                {
                    ApplicationArea = all;
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = all;
                }
                field("Item Rate"; Rec."Item Rate")
                {
                    ApplicationArea = all;
                }
                field("Sales UOM"; Rec."Sales UOM")
                {
                    ApplicationArea = all;
                }
                field("UOM Conversion Factor"; Rec."UOM Conversion Factor")
                {
                    ApplicationArea = all;
                }
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = all;
                }
                field(LoginCustId; Rec.LoginCustId)
                {
                    ApplicationArea = all;
                }
                field("Allow Decimal"; Rec."Allow Decimal")
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

