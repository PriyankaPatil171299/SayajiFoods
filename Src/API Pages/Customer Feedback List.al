page 70005 "Customer Feedback list API"
{
    PageType = API;

    APIVersion = 'v2.0';
    APIPublisher = 'LeapingFrogSolutionPvtLtd';
    APIGroup = 'LeapingFrogSolution';

    EntityCaption = 'Customer List API';
    EntitySetCaption = 'CustomerListAPI';
    EntityName = 'CustomerListAPI';
    EntitySetName = 'CustomerListAPI';

    ODataKeyFields = SystemId;
    SourceTable = Customer;

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
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ApplicationArea = all;

                }
                field("ResponsibilityCenter"; Rec."Responsibility Center")
                {
                    Caption = 'Responsibility Center';
                    ApplicationArea = all;

                }
                field("LocationCode"; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    ApplicationArea = all;

                }
                field("PostCode"; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ApplicationArea = all;

                }
                field("Country_RegionCode"; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ApplicationArea = all;

                }
                field("PhoneNo"; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ApplicationArea = all;

                }
                field("FaxNo"; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ApplicationArea = all;

                }
                field("ICPartnerCode"; Rec."IC Partner Code")
                {
                    Caption = 'IC Partner Code';
                    ApplicationArea = all;

                }
                field(Contact; Rec.Contact)

                {
                    Caption = 'Contact';
                    ApplicationArea = all;


                }
                field("SalespersonCode"; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                    ApplicationArea = all;

                }
                field("CustomerPostingGroup"; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    ApplicationArea = all;

                }
                field("GenBusPostingGroup"; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ApplicationArea = all;

                }
                field("VATBusPostingGroup"; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    ApplicationArea = all;

                }
                field("CustomerPriceGroup"; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';
                    ApplicationArea = all;

                }
                field("CustomerDiscGroup"; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Disc. Group';
                    ApplicationArea = all;

                }
                field("PaymentTermsCode"; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    ApplicationArea = all;

                }
                field("ReminderTermsCode"; Rec."Reminder Terms Code")
                {
                    Caption = 'Reminder Terms Code';
                    ApplicationArea = all;

                }
                field("FinChargeTermsCode"; Rec."Fin. Charge Terms Code")

                {
                    Caption = 'Fin. Charge Terms Code';
                    ApplicationArea = all;


                }
                field("CurrencyCode"; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ApplicationArea = all;

                }
                field("LanguageCode"; Rec."Language Code")
                {
                    Caption = 'Language Code';
                    ApplicationArea = all;

                }
                field("SearchName"; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ApplicationArea = all;

                }
                field("CreditLimit_LCY"; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                    ApplicationArea = all;

                }
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
                field("ApplicationMethod"; Rec."Application Method")
                {
                    Caption = 'Application Method';
                    ApplicationArea = all;

                }
                field("CombineShipments"; Rec."Combine Shipments")
                {
                    Caption = 'Combine Shipments';
                    ApplicationArea = all;

                }
                field(Reserve; Rec.Reserve)

                {
                    Caption = 'Reserve';
                    ApplicationArea = all;

                }
                field("ShippingAdvice"; Rec."Shipping Advice")
                {
                    Caption = 'Shipping Advice';
                    ApplicationArea = all;

                }
                field("ShippingAgentCode"; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                    ApplicationArea = all;
                }
                field("BaseCalendarCode"; Rec."Base Calendar Code")
                {
                    Caption = 'Base Calendar Code';
                    ApplicationArea = all;
                }
                field(custgrpcode; Rec.custgrpcode)
                {
                    Caption = 'custgrpcode';
                    ApplicationArea = all;
                }
                field("E_Mail"; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                    ApplicationArea = all;
                }
                field("Address2"; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ApplicationArea = all;
                }
                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                    ApplicationArea = all;
                }
                field("TerritoryCode"; Rec."Territory Code")
                {
                    Caption = 'Territory Code';
                    ApplicationArea = all;
                }
                field("BalanceLCY"; Rec."Balance (LCY)")

                {
                    Caption = 'Balance (LCY)';
                    ApplicationArea = all;

                }
                field(Balance; Rec.Balance)
                {
                    Caption = 'Balance';
                    ApplicationArea = all;
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                    ApplicationArea = all;
                }
                field("CustomerUserName"; Rec."Customer User Name")
                {
                    Caption = 'Customer User Name';
                    ApplicationArea = all;
                }
                field(LastLogOut; Rec.LastLogOut)
                {
                    Caption = 'LastLogOut';
                    ApplicationArea = all;
                }
                field("CustomerPassword"; Rec."Customer Password")
                {
                    Caption = 'Customer Password';
                    ApplicationArea = all;
                }
                field("ChangePassword"; Rec."Change Password")
                {
                    Caption = 'Change Password';
                    ApplicationArea = all;
                }
                field("Showinweborder"; Rec."Show in web order")
                {
                    Caption = 'Show in web order';
                    ApplicationArea = all;
                }
                field("SalesPersonEmailID"; Rec."Sales Person Email ID")
                {
                    Caption = 'Sales Person Email ID';
                    ApplicationArea = all;
                }

            }
        }
    }
}