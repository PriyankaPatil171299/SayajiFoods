page 70001 "Dimension Value_List"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Dimension Value List API';
    EntitySetCaption = 'DimensionValueListAPI';
    EntityName = 'DimensionValueListAPI';
    EntitySetName = 'DimensionValueListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Dimension Value";

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

                field(Code; Rec.Code)

                {
                    Caption = 'Code';
                    ApplicationArea = all;


                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = all;

                }
                field("DimensionValueType"; Rec."Dimension Value Type")
                {
                    Caption = 'Dimension Value Type';
                    ApplicationArea = all;

                }
                field(Totaling; Rec.Totaling)
                {
                    Caption = 'Totaling';
                    ApplicationArea = all;

                }
                field("GlobalDimensionNo"; Rec."Global Dimension No.")
                {
                    Caption = 'Global Dimension No.';
                    ApplicationArea = all;

                }
                field("MaptoICDimensionCode"; Rec."Map-to IC Dimension Code")
                {
                    Caption = 'Map-to IC Dimension Code';
                    ApplicationArea = all;

                }
                field(Blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                    ApplicationArea = all;

                }
                field("ConsolidationCode"; Rec."Consolidation Code")
                {
                    Caption = 'Consolidation Code';
                    ApplicationArea = all;

                }
            }
        }
    }
}