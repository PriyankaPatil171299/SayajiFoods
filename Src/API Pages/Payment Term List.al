page 70012 "Payment Term List API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Payment Term List API';
    EntitySetCaption = 'PaymentTermListAPI';
    EntityName = 'PaymentTermListAPI';
    EntitySetName = 'PaymentTermListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Payment Terms";

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
                field("DueDateCalculation"; Rec."Due Date Calculation")
                {
                    Caption = 'Due Date Calculation';
                    ApplicationArea = all;

                }
                field("DiscountDateCalculation"; Rec."Discount Date Calculation")
                {
                    Caption = 'Discount Date Calculation';
                    ApplicationArea = all;

                }
                field("DiscountPer"; Rec."Discount %")
                {
                    Caption = 'Discount %';
                    ApplicationArea = all;

                }
                field("CalcPmtDisconCrMemos"; Rec."Calc. Pmt. Disc. on Cr. Memos")
                {
                    Caption = 'Calc. Pmt. Disc. on Cr. Memos';
                    ApplicationArea = all;

                }
                field(Description; Rec.Description)

                {
                    Caption = 'Description';
                    ApplicationArea = all;


                }
                field("ShowinWebOrderlist"; Rec."Show in Web Order list")
                {
                    Caption = 'Show in Web Order list';
                    ApplicationArea = all;

                }

            }
        }
    }
}