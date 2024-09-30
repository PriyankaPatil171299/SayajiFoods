page 70008 "Sales Setup List"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Sales Setup List API';
    EntitySetCaption = 'SalesSetupListAPI';
    EntityName = 'SalesSetupListAPI';
    EntitySetName = 'SalesSetupListAPI';

    ODataKeyFields = SystemId;
    SourceTable = "Sales & Receivables Setup";

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

                field("DiscountPosting"; Rec."Discount Posting")

                {
                    Caption = 'Discount Posting';
                    ApplicationArea = all;


                }
                field("CreditWarnings"; Rec."Credit Warnings")
                {
                    Caption = 'Credit Warnings';
                    ApplicationArea = all;

                }
                field("StockoutWarning"; Rec."Stockout Warning")
                {
                    Caption = 'Stockout Warning';
                    ApplicationArea = all;

                }
                field("ShipmentonInvoice"; Rec."Shipment on Invoice")
                {
                    Caption = 'Shipment on Invoice';
                    ApplicationArea = all;

                }
                field("ReturnReceiptonCreditMemo"; Rec."Return Receipt on Credit Memo")
                {
                    Caption = 'Return Receipt on Credit Memo';
                    ApplicationArea = all;

                }
                field("InvoiceRounding"; Rec."Invoice Rounding")
                {
                    Caption = 'Invoice Rounding';
                    ApplicationArea = all;

                }
                field("ExtDocNoMandatory"; Rec."Ext. Doc. No. Mandatory")
                {
                    Caption = 'Ext. Doc. No. Mandatory';
                    ApplicationArea = all;

                }
                field("ApplnbetweenCurrencies"; Rec."Appln. between Currencies")
                {
                    Caption = 'Appln. between Currencies';
                    ApplicationArea = all;

                }
                field("LogoPositiononDocuments"; Rec."Logo Position on Documents")
                {
                    Caption = 'Logo Position on Documents';
                    ApplicationArea = all;

                }
                field("DefaultPostingDate"; Rec."Default Posting Date")

                {
                    Caption = 'Default Posting Date';
                    ApplicationArea = all;


                }
                field("DefaultQuantitytoShip"; Rec."Default Quantity to Ship")
                {
                    Caption = 'Default Quantity to Ship';
                    ApplicationArea = all;

                }
                field("CopyCommentsBlankettoOrder"; Rec."Copy Comments Blanket to Order")
                {
                    Caption = 'Copy Comments Blanket to Order';
                    ApplicationArea = all;

                }
                field("CopyCommentsOrdertoInvoice"; Rec."Copy Comments Order to Invoice")
                {
                    Caption = 'Copy Comments Order to Invoice';
                    ApplicationArea = all;

                }
                field("CopyCommentsOrdertoShpt"; Rec."Copy Comments Order to Shpt.")
                {
                    Caption = 'Copy Comments Order to Shpt.';
                    ApplicationArea = all;

                }
                field("CopyCmtsRetOrdtoCrMemo"; Rec."Copy Cmts Ret.Ord. to Cr. Memo")
                {
                    Caption = 'Copy Cmts Ret.Ord. to Cr. Memo';
                    ApplicationArea = all;

                }
                field("CopyCmtsRetOrdtoRetRcpt"; Rec."Copy Cmts Ret.Ord. to Ret.Rcpt")
                {
                    Caption = 'Copy Cmts Ret.Ord. to Ret.Rcpt';
                    ApplicationArea = all;

                }
                field("AllowVATDifference"; Rec."Allow VAT Difference")
                {
                    Caption = 'Allow VAT Difference';
                    ApplicationArea = all;

                }
                field("CalcInvDiscount"; Rec."Calc. Inv. Discount")
                {
                    Caption = 'Calc. Inv. Discount';
                    ApplicationArea = all;

                }
                field("CalcInvDiscperVATID"; Rec."Calc. Inv. Disc. per VAT ID")

                {
                    Caption = 'Calc. Inv. Disc. per VAT ID';
                    ApplicationArea = all;


                }
                field("VATBusPostingGrPrice"; Rec."VAT Bus. Posting Gr. (Price)")
                {
                    Caption = 'VAT Bus. Posting Gr. (Price)';
                    ApplicationArea = all;

                }
                field("ExactCostReversingMandatory"; Rec."Exact Cost Reversing Mandatory")
                {
                    Caption = 'Exact Cost Reversing Mandatory';
                    ApplicationArea = all;

                }
                field("CheckPrepmtwhenPosting"; Rec."Check Prepmt. when Posting")
                {
                    Caption = 'Check Prepmt. when Posting';
                    ApplicationArea = all;

                }
                // field("ArchiveQuotesandOrders";Rec."Archive Quotes and Orders")
                // {
                //     Caption = 'Archive Quotes and Orders';  //psp field remove
                //     ApplicationArea = all;

                // }
                field("CustomerGroupDimensionCode"; Rec."Customer Group Dimension Code")
                {
                    Caption = 'Customer Group Dimension Code';
                    ApplicationArea = all;

                }
                field("SalespersonDimensionCode"; Rec."Salesperson Dimension Code")
                {
                    Caption = 'Salesperson Dimension Code';
                    ApplicationArea = all;

                }
                field("CustomerNos"; Rec."Customer Nos.")
                {
                    Caption = 'Customer Nos.';
                    ApplicationArea = all;

                }
                field("QuoteNos"; Rec."Quote Nos.")
                {
                    Caption = 'Quote Nos.';
                    ApplicationArea = all;

                }
                field("BlanketOrderNos"; Rec."Blanket Order Nos.")

                {
                    Caption = 'Blanket Order Nos.';
                    ApplicationArea = all;

                }
                field("OrderNos"; Rec."Order Nos.")
                {
                    Caption = 'Order Nos.';
                    ApplicationArea = all;

                }
                field("InvoiceNos"; Rec."Invoice Nos.")
                {
                    Caption = 'Invoice Nos.';
                    ApplicationArea = all;

                }
                field("PostedInvoiceNos"; Rec."Posted Invoice Nos.")
                {
                    Caption = 'Posted Invoice Nos.';
                    ApplicationArea = all;

                }
                field("CreditMemoNos"; Rec."Credit Memo Nos.")
                {
                    Caption = 'Credit Memo Nos.';
                    ApplicationArea = all;

                }
                field("PostedCreditMemoNos"; Rec."Posted Credit Memo Nos.")
                {
                    Caption = 'Posted Credit Memo Nos.';
                    ApplicationArea = all;

                }
                field("PostedShipmentNos"; Rec."Posted Shipment Nos.")
                {
                    Caption = 'Posted Shipment Nos.';
                    ApplicationArea = all;

                }
                field("PostedReturnReceiptNos"; Rec."Posted Return Receipt Nos.")

                {
                    Caption = 'Posted Return Receipt Nos.';
                    ApplicationArea = all;


                }
                field("ReminderNos"; Rec."Reminder Nos.")
                {
                    Caption = 'Reminder Nos.';
                    ApplicationArea = all;

                }
                field("IssuedReminderNos"; Rec."Issued Reminder Nos.")
                {
                    Caption = 'Issued Reminder Nos.';
                    ApplicationArea = all;

                }
                field("FinChrgMemoNos"; Rec."Fin. Chrg. Memo Nos.")
                {
                    Caption = 'Fin. Chrg. Memo Nos.';
                    ApplicationArea = all;

                }
                field("PostedPrepmtInvNos"; Rec."Posted Prepmt. Inv. Nos.")
                {
                    Caption = 'Posted Prepmt. Inv. Nos.';
                    ApplicationArea = all;

                }
                field("PostedPrepmtCrMemoNos"; Rec."Posted Prepmt. Cr. Memo Nos.")
                {
                    Caption = 'Posted Prepmt. Cr. Memo Nos.';
                    ApplicationArea = all;

                }
                field("DirectDebitMandateNos"; Rec."Direct Debit Mandate Nos.")
                {
                    Caption = 'Direct Debit Mandate Nos.';
                    ApplicationArea = all;

                }
                field("PostwithJobQueue"; Rec."Post with Job Queue")
                {
                    Caption = 'Post with Job Queue';
                    ApplicationArea = all;

                }
                field("JobQueuePriorityforPost"; Rec."Job Queue Priority for Post")
                {
                    Caption = 'Job Queue Priority for Post';
                    ApplicationArea = all;

                }
                field("Post_PrintwithJobQueue"; Rec."Post & Print with Job Queue")

                {
                    Caption = 'Post & Print with Job Queue';
                    ApplicationArea = all;


                }
                field("JobQPrioforPost_Print"; Rec."Job Q. Prio. for Post & Print")
                {
                    Caption = 'Job Q. Prio. for Post & Print';
                    ApplicationArea = all;

                }
                field("JobQueueCategoryCode"; Rec."Job Queue Category Code")
                {
                    Caption = 'Job Queue Category Code';
                    ApplicationArea = all;

                }
                field("NotifyOnSuccess"; Rec."Notify On Success")
                {
                    Caption = 'Notify On Success';
                    ApplicationArea = all;

                }
            }
        }
    }
}