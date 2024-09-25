page 60002 "Web Order Line List"
{
    Caption = 'Web Order Line list';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Web Order Line";
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            group(repeater)
            {
                field("Web Order Line No."; Rec."Web Order Line No.")
                {
                    ApplicationArea = all;
                }
                field("Web Order Header No."; Rec."Web Order Header No.")
                {
                    ApplicationArea = all;
                }
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = all;
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = all;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field("Available Qty"; Rec."Available Qty")
                {
                    ApplicationArea = all;
                }
                field("Order Qty"; Rec."Order Qty")
                {
                    ApplicationArea = all;
                }
                field("Conversion Qty"; Rec."Conversion Qty")
                {
                    ApplicationArea = all;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = all;
                }
                field("Item Value"; Rec."Item Value")
                {
                    ApplicationArea = all;
                }
                field("Rqstd Dispatch Date"; Rec."Rqstd Dispatch Date")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Accepted Qty"; Rec."Accepted Qty")
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
                field(TempLineNo; Rec.TempLineNo)
                {
                    ApplicationArea = all;
                }
                field("Base UOM"; Rec."Base UOM")
                {
                    ApplicationArea = all;
                }
                field("Sales UOM"; Rec."Sales UOM")
                {
                    ApplicationArea = all;
                }
                field(CustCode; Rec.CustCode)
                {
                    ApplicationArea = all;
                }
                field(LoginCustID; Rec.LoginCustID)
                {
                    ApplicationArea = all;
                }
                field(UOMConversionFactor; Rec.UOMConversionFactor)
                {
                    ApplicationArea = all;
                }
                field(Size; Rec.Size)
                {
                    ApplicationArea = all;
                }
                field(Thickness; Rec.Thickness)
                {
                    ApplicationArea = all;
                }
                field("Blanket Order No."; Rec."Blanket Order No.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

}