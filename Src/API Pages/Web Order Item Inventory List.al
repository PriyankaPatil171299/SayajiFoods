page 70009 "Web Order Item Inventory List"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Web Order Item Inventory List API';
    EntitySetCaption = 'WebOrderItemInventoryListAPI';
    EntityName = 'WebOrderItemInventoryListAPI';
    EntitySetName = 'WebOrderItemInventoryListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Web Inventory Buffer";

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

                field("LocationCode"; Rec."Location Code")

                {
                    Caption = 'Location Code';
                    ApplicationArea = all;


                }
                field("AvailableQty"; Rec."Available Qty.")
                {
                    Caption = 'Available Qty.';
                    ApplicationArea = all;

                }
                field("CustomerID"; Rec."Customer ID")
                {
                    Caption = 'Customer ID';
                    ApplicationArea = all;

                }
                field("VendorItemNo"; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ApplicationArea = all;

                }
                field("BaseUOM"; Rec."Base UOM")
                {
                    Caption = 'Base UOM';
                    ApplicationArea = all;

                }
                field("ItemNo"; Rec."Item No")
                {
                    Caption = 'Item No';
                    ApplicationArea = all;

                }
                field("ItemRate"; Rec."Item Rate")
                {
                    Caption = 'Item Rate';
                    ApplicationArea = all;

                }
                field("SalesUOM"; Rec."Sales UOM")
                {
                    Caption = 'Sales UOM';
                    ApplicationArea = all;

                }
                field("UOMConversionFactor"; Rec."UOM Conversion Factor")
                {
                    Caption = 'UOM Conversion Factor';
                    ApplicationArea = all;

                }
                field(UserID; Rec.UserID)

                {
                    Caption = 'UserID';
                    ApplicationArea = all;


                }
                field(LoginCustId; Rec.LoginCustId)
                {
                    Caption = 'LoginCustId';
                    ApplicationArea = all;

                }
                field("AllowDecimal"; Rec."Allow Decimal")
                {
                    Caption = 'Allow Decimal';
                    ApplicationArea = all;

                }
            }
        }
    }
}