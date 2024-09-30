page 70002 "Sales Purchaser List"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Sales Purchaser ListAPI';
    EntitySetCaption = 'SalesPurchaserListAPI';
    EntityName = 'SalesPurchaserListAPI';
    EntitySetName = 'SalesPurchaserListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Salesperson/Purchaser";

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
                field("CommissionPer"; Rec."Commission %")
                {
                    Caption = 'Commission %';
                    ApplicationArea = all;

                }
                field("PhoneNo"; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ApplicationArea = all;

                }
                field("E_Mail"; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                    ApplicationArea = all;

                }

            }
        }
    }
}