page 70007 "Web Order Line list API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Web Order Line list API';
    EntitySetCaption = 'WebOrderLinelistAPI';
    EntityName = 'WebOrderLinelistAPI';
    EntitySetName = 'WebOrderLinelistAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Web Order Line";

    Extensible = false;
    DelayedInsert = true;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;



    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                ShowCaption = false;

                field("WebOrderLineNo"; Rec."Web Order Line No.")

                {
                    Caption = 'Web Order Line No.';
                    ApplicationArea = all;


                }
                field("WebOrderHeaderNo"; Rec."Web Order Header No.")
                {
                    Caption = 'Web Order Header No.';
                    ApplicationArea = all;

                }
                field("ItemType"; Rec."Item Type")
                {
                    Caption = 'Item Type';
                    ApplicationArea = all;

                }
                field("VendorItemNo"; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ApplicationArea = all;

                }
                field("ItemNo"; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = all;

                }
                field("ItemDescription"; Rec."Item Description")
                {
                    Caption = 'Item Description';
                    ApplicationArea = all;

                }
                field("LocationCode"; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ApplicationArea = all;

                }
                field("AvailableQty"; Rec."Available Qty")
                {
                    Caption = 'Available Qty';
                    ApplicationArea = all;

                }
                field("OrderQty"; Rec."Order Qty")
                {
                    Caption = 'Order Qty';
                    ApplicationArea = all;

                }
                field("ConversionQty"; Rec."Conversion Qty")

                {
                    Caption = 'Conversion Qty';
                    ApplicationArea = all;


                }
                field(Rate; Rec.Rate)
                {
                    Caption = 'Rate';
                    ApplicationArea = all;

                }
                field("ItemValue"; Rec."Item Value")
                {
                    Caption = 'Item Value';
                    ApplicationArea = all;

                }
                field("RqstdDispatchDate"; Rec."Rqstd Dispatch Date")
                {
                    Caption = 'Rqstd Dispatch Date';
                    ApplicationArea = all;

                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = all;

                }
                field("AcceptedQty"; Rec."Accepted Qty")
                {
                    Caption = 'Accepted Qty';
                    ApplicationArea = all;

                }
                field("CreatedBy"; Rec."Created By")
                {
                    Caption = 'Created By';
                    ApplicationArea = all;

                }
                field("CreatedOn"; Rec."Created On")
                {
                    Caption = 'Created On';
                    ApplicationArea = all;

                }
                field("ModifiedBy"; Rec."Modified By")
                {
                    Caption = 'Modified By';
                    ApplicationArea = all;

                }
                field("ModifiedOn"; Rec."Modified On")

                {
                    Caption = 'Modified On';
                    ApplicationArea = all;


                }
                field(TempLineNo; Rec.TempLineNo)
                {
                    Caption = 'TempLineNo';
                    ApplicationArea = all;

                }
                field("BaseUOM"; Rec."Base UOM")
                {
                    Caption = 'Base UOM';
                    ApplicationArea = all;

                }
                field("SalesUOM"; Rec."Sales UOM")
                {
                    Caption = 'Sales UOM';
                    ApplicationArea = all;

                }
                field(CustCode; Rec.CustCode)
                {
                    Caption = 'CustCode';
                    ApplicationArea = all;

                }
                field(LoginCustID; Rec.LoginCustID)
                {
                    Caption = 'LoginCustID';
                    ApplicationArea = all;

                }
                field(UOMConversionFactor; Rec.UOMConversionFactor)
                {
                    Caption = 'UOMConversionFactor';
                    ApplicationArea = all;

                }
                field(Size; Rec.Size)
                {
                    Caption = 'Size';
                    ApplicationArea = all;

                }
                field(Thickness; Rec.Thickness)
                {
                    Caption = 'Thickness';
                    ApplicationArea = all;

                }
                field("BlanketOrderNo"; Rec."Blanket Order No.")

                {
                    Caption = 'Blanket Order No.';
                    ApplicationArea = all;

                }
            }
        }
    }
}