page 70010 "Location Master API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Location Master API';
    EntitySetCaption = 'LocationMasterAPI';
    EntityName = 'LocationMasterAPI';
    EntitySetName = 'LocationMasterAPI';

    ODataKeyFields = SystemId;
    SourceTable = Location;

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
                field("UseAsInTransit"; Rec."Use As In-Transit")
                {
                    Caption = 'Use As In-Transit';
                    ApplicationArea = all;

                }
                field("ShowinWebOrderlist"; Rec."Show in Web Order list")
                {
                    Caption = 'Show in Web Order list';
                    ApplicationArea = all;

                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                    ApplicationArea = all;

                }

            }
        }
    }
}