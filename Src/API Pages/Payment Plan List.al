page 70011 "Payment Plan List API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Payment Plan List API';
    EntitySetCaption = 'PaymentPlanListAPI';
    EntityName = 'PaymentPlanListAPI';
    EntitySetName = 'PaymentPlanListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Payment Plan";

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

                field("EntryNo"; Rec."Entry No")

                {
                    Caption = 'Entry No';
                    ApplicationArea = all;


                }
                field("CustomerCode"; Rec."Customer Code")
                {
                    Caption = 'Customer Code';
                    ApplicationArea = all;

                }
                field("WebOrderNo"; Rec."Web Order No")
                {
                    Caption = 'Web Order No';
                    ApplicationArea = all;

                }
                field("ModeOfPayment"; Rec."Mode Of Payment")
                {
                    Caption = 'Mode Of Payment';
                    ApplicationArea = all;

                }
                field("ExpectedPaymentDate"; Rec."Expected Payment Date")
                {
                    Caption = 'Expected Payment Date';
                    ApplicationArea = all;

                }
                field("ExpectedPaymentAmount"; Rec."Expected Payment Amount")

                {
                    Caption = 'Expected Payment Amount';
                    ApplicationArea = all;


                }
                field(Remarks; Rec.Remarks)
                {
                    Caption = 'Remarks';
                    ApplicationArea = all;

                }
                field(TempLineNo; Rec.TempLineNo)
                {
                    Caption = 'TempLineNo';
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
                field("CustomeGRPCode"; Rec."Customer GRP Code")
                {
                    Caption = 'Customer GRP Code';
                    ApplicationArea = all;

                }
                field("ChequeNo"; Rec."Cheque No.")
                {
                    Caption = 'Cheque No.';
                    ApplicationArea = all;

                }


            }
        }
    }
}