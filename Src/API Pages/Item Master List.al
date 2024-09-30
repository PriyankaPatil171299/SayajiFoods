page 70006 "Item Master List"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Item Master List API';
    EntitySetCaption = 'ItemMasterListAPI';
    EntityName = 'ItemMasterListAPI';
    EntitySetName = 'ItemMasterListAPI';

    ODataKeyFields = SystemId;
    SourceTable = Item;

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

                field("No"; Rec."No.")

                {
                    Caption = 'No.';
                    ApplicationArea = all;


                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = all;

                }
                field("CreatedFromNonstockItem"; Rec."Created From Nonstock Item")
                {
                    Caption = 'Created From Nonstock Item';
                    ApplicationArea = all;

                }
                field("SubstitutesExist"; Rec."Substitutes Exist")
                {
                    Caption = 'Substitutes Exist';
                    ApplicationArea = all;

                }
                field("StockkeepingUnitExists"; Rec."Stockkeeping Unit Exists")
                {
                    Caption = 'Stockkeeping Unit Exists';
                    ApplicationArea = all;

                }
                field("AssemblyBOM"; Rec."Assembly BOM")
                {
                    Caption = 'Assembly BOM';
                    ApplicationArea = all;

                }
                field("ProductionBOMNo"; Rec."Production BOM No.")
                {
                    Caption = 'Production BOM No.';
                    ApplicationArea = all;

                }
                field("RoutingNo"; Rec."Routing No.")
                {
                    Caption = 'Routing No.';
                    ApplicationArea = all;

                }
                field("BaseUnitofMeasure"; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit of Measure';
                    ApplicationArea = all;

                }
                field("ShelfNo"; Rec."Shelf No.")

                {
                    Caption = 'Shelf No.';
                    ApplicationArea = all;


                }
                field("CostingMethod"; Rec."Costing Method")
                {
                    Caption = 'Costing Method';
                    ApplicationArea = all;

                }
                field("CostisAdjusted"; Rec."Cost is Adjusted")
                {
                    Caption = 'Cost is Adjusted';
                    ApplicationArea = all;

                }
                field("StandardCost"; Rec."Standard Cost")
                {
                    Caption = 'Standard Cost';
                    ApplicationArea = all;

                }
                field("UnitCost"; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    ApplicationArea = all;

                }
                field("LastDirectCost"; Rec."Last Direct Cost")
                {
                    Caption = 'Last Direct Cost';
                    ApplicationArea = all;

                }
                field("Price_ProfitCalculation"; Rec."Price/Profit Calculation")
                {
                    Caption = 'Price/Profit Calculation';
                    ApplicationArea = all;

                }
                field("Profit_Per"; Rec."Profit %")
                {
                    Caption = 'Profit %';
                    ApplicationArea = all;

                }
                field("UnitPrice"; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                    ApplicationArea = all;

                }
                field("InventoryPostingGroup"; Rec."Inventory Posting Group")

                {
                    Caption = 'Inventory Posting Group';
                    ApplicationArea = all;


                }
                field("GenProdPostingGroup"; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    ApplicationArea = all;

                }
                field("VATBusPostingGrPrice"; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Bus. Posting Gr. (Price)';
                    ApplicationArea = all;

                }
                field("ItemDiscGroup"; Rec."Item Disc. Group")
                {
                    Caption = 'Item Disc. Group';
                    ApplicationArea = all;

                }
                field("VendorNo"; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ApplicationArea = all;

                }
                field("VendorItemNo"; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    ApplicationArea = all;

                }
                field("TariffNo"; Rec."Tariff No.")
                {
                    Caption = 'Tariff No.';
                    ApplicationArea = all;

                }
                field("SearchDescription"; Rec."Search Description")
                {
                    Caption = 'Search Description';
                    ApplicationArea = all;

                }
                field("OverheadRate"; Rec."Overhead Rate")
                {
                    Caption = 'Overhead Rate';
                    ApplicationArea = all;

                }
                field("IndirectCost_Per"; Rec."Indirect Cost %")

                {
                    Caption = 'Indirect Cost %';
                    ApplicationArea = all;

                }
                field("ItemCategoryCode"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ApplicationArea = all;

                }
                // field("ProductGroupCode"; Rec."Product Group Code")
                // {
                //     Caption = 'Product Group Code';  //psp (removed)
                //     ApplicationArea = all;
                // }
                field(Blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ApplicationArea = all;
                }
                field("LastDateModified"; Rec."Last Date Modified")
                {
                    Caption = 'Last Date Modified';
                    ApplicationArea = all;
                }
                field("SalesUnitofMeasure"; Rec."Sales Unit of Measure")
                {
                    Caption = 'Sales Unit of Measure';
                    ApplicationArea = all;
                }
                field("ReplenishmentSystem"; Rec."Replenishment System")
                {
                    Caption = 'Replenishment System';
                    ApplicationArea = all;
                }
                field("PurchUnitofMeasure"; Rec."Purch. Unit of Measure")
                {
                    Caption = 'Purch. Unit of Measure';
                    ApplicationArea = all;
                }
                field("LeadTimeCalculation"; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';
                    ApplicationArea = all;
                }
                field("ManufacturingPolicy"; Rec."Manufacturing Policy")

                {
                    Caption = 'Manufacturing Policy';
                    ApplicationArea = all;

                }
                field("FlushingMethod"; Rec."Flushing Method")
                {
                    Caption = 'Flushing Method';
                    ApplicationArea = all;
                }
                field("AssemblyPolicy"; Rec."Assembly Policy")
                {
                    Caption = 'Assembly Policy';
                    ApplicationArea = all;
                }
                field("Item_CategoryCode"; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                    ApplicationArea = all;
                }
                field("GrossWeight"; Rec."Gross Weight")
                {
                    Caption = 'Gross Weight';
                    ApplicationArea = all;
                }
                field("GlobalDimension1Code"; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ApplicationArea = all;
                }
                field("QtyonPurchOrder"; Rec."Qty. on Purch. Order")
                {
                    Caption = 'Qty. on Purch. Order';
                    ApplicationArea = all;
                }
                field(Inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                    ApplicationArea = all;
                }
                field("MaximumInventory"; Rec."Maximum Inventory")
                {
                    Caption = 'Maximum Inventory';
                    ApplicationArea = all;
                }
                field("SafetyStockQuantity"; Rec."Safety Stock Quantity")
                {
                    Caption = 'Safety Stock Quantity';
                    ApplicationArea = all;
                }
                field("CountryRegionofOriginCode"; Rec."Country/Region of Origin Code")
                {
                    Caption = 'Country/Region of Origin Code';
                    ApplicationArea = all;
                }
                field("TaxGroupCode"; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                    ApplicationArea = all;
                }
            }
        }
    }
}