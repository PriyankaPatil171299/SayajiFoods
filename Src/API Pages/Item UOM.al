page 70003 "Item UOM"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'ItemUOM API';
    EntitySetCaption = 'ItemUOMAPI';
    EntityName = 'ItemUOMAPI';
    EntitySetName = 'ItemUOMAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Item Unit of Measure";

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

                field("ItemNo"; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    ApplicationArea = all;
                }
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = all;

                }
                field("QtyperUnitofMeasure"; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    ApplicationArea = all;

                }
                field(Height; Rec.Height)
                {
                    Caption = 'Height';
                    ApplicationArea = all;

                }
                field(Width; Rec.Width)
                {
                    Caption = 'Width';
                    ApplicationArea = all;

                }
                field(Length; Rec.Length)
                {
                    Caption = 'Length';
                    ApplicationArea = all;

                }
                field(Cubage; Rec.Cubage)
                {
                    Caption = 'Cubage';
                    ApplicationArea = all;

                }
                field(Weight; Rec.Weight)
                {
                    Caption = 'Weight';
                    ApplicationArea = all;

                }
            }
        }
    }
}