page 70004 "Web Order Header List"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Web Order Header List';
    EntitySetCaption = 'WebOrderHeaderListAPI';
    EntityName = 'WebOrderHeaderListAPI';
    EntitySetName = 'WebOrderHeaderListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Web Order Header";

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

                field("WebOrderNo"; Rec."Web Order No.")

                {
                    Caption = 'Web Order No.';
                    ApplicationArea = all;


                }
                field("WebOrderDate"; Rec."Web Order Date")
                {
                    Caption = 'Web Order Date';
                    ApplicationArea = all;

                }
                field("CustomerNo"; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = all;

                }
                field("CustomerName"; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                    ApplicationArea = all;

                }
                field("PurchaseOrderNo"; Rec."Purchase Order No.")
                {
                    Caption = 'Purchase Order No.';
                    ApplicationArea = all;

                }
                field("PurchaseOrderDate"; Rec."Purchase Order Date")
                {
                    Caption = 'Purchase Order Date';
                    ApplicationArea = all;

                }
                field("OrderValue"; Rec."Order Value")
                {
                    Caption = 'Order Value';
                    ApplicationArea = all;

                }
                field("BillingLocation"; Rec."Billing Location")
                {
                    Caption = 'Billing Location';
                    ApplicationArea = all;

                }
                field("Against_C_Form"; Rec."Against C Form")
                {
                    Caption = 'Against C Form';
                    ApplicationArea = all;

                }
                field("SpecialPrice"; Rec."Special Price")

                {
                    Caption = 'Special Price';
                    ApplicationArea = all;


                }
                field("ProjectName"; Rec."Project Name")
                {
                    Caption = 'Project Name';
                    ApplicationArea = all;

                }
                field(Salesperson; Rec.Salesperson)
                {
                    Caption = 'Salesperson';
                    ApplicationArea = all;

                }
                field("SalespersonName"; Rec."Salesperson Name")
                {
                    Caption = 'Salesperson Name';
                    ApplicationArea = all;

                }
                field("CreditDays"; Rec."Credit Days")
                {
                    Caption = 'Credit Days';
                    ApplicationArea = all;

                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = all;

                }
                field("AcceptTermsandConditions"; Rec."Accept Terms and Conditions")
                {
                    Caption = 'Accept Terms and Conditions';
                    ApplicationArea = all;

                }
                field("NameofPerson"; Rec."Name of Person")
                {
                    Caption = 'Name of Person';
                    ApplicationArea = all;

                }
                field("ConfirmOutstandingAmount"; Rec."Confirm Outstanding Amount")
                {
                    Caption = 'Confirm Outstanding Amount';
                    ApplicationArea = all;

                }
                field("DispatchLocation"; Rec."Dispatch Location")

                {
                    Caption = 'Dispatch Location';
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
                field(ConvertToBlanketOrder; Rec.ConvertToBlanketOrder)
                {
                    Caption = 'ConvertToBlanketOrder';
                    ApplicationArea = all;

                }
                field(ConvertedBy; Rec.ConvertedBy)
                {
                    Caption = 'ConvertedBy';
                    ApplicationArea = all;

                }
                field(Remarks; Rec.Remarks)
                {
                    Caption = 'Remarks';
                    ApplicationArea = all;

                }
                field(ReasonForRejection; Rec.ReasonForRejection)

                {
                    Caption = 'ReasonForRejection';
                    ApplicationArea = all;

                }
                field("ShiptoAddress"; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address';
                    ApplicationArea = all;

                }
                field("ShiptoAddress2"; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address 2';
                    ApplicationArea = all;
                }
                field("ShiptoPostCode"; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    ApplicationArea = all;
                }
                field("ShiptoCity"; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    ApplicationArea = all;
                }
                field(ShipToBillToSame; Rec.ShipToBillToSame)
                {
                    Caption = 'ShipToBillToSame';
                    ApplicationArea = all;
                }
                field("ProjectNumber"; Rec."Project Number")
                {
                    Caption = 'Project Number';
                    ApplicationArea = all;
                }
                field("OrderWeight"; Rec."Order Weight")
                {
                    Caption = 'Order Weight';
                    ApplicationArea = all;
                }
                field("OrderCubage"; Rec."Order Cubage")
                {
                    Caption = 'Order Cubage';
                    ApplicationArea = all;
                }
                field("ExtendDays"; Rec."Extend Days")

                {
                    Caption = 'Extend Days';
                    ApplicationArea = all;

                }


            }
        }
    }
}