pageextension 60002 "Blanket_Sales Order" extends "Blanket Sales Order"
{
    layout
    {
        modify("Sell-to Customer No.")
        {
            Editable = true;
        }
        modify("Sell-to Customer Name")
        {
            Editable = false;
        }
        modify("Sell-to Address")
        {
            Editable = false;
        }
        modify("Sell-to Address 2")
        {
            Editable = false;
        }
        modify("Sell-to Post Code")
        {
            Editable = false;
        }
        modify("Sell-to City")
        {
            Editable = false;
        }
        modify("Bill-to Name")
        {
            Editable = false;
        }
        modify("Bill-to Address")
        {
            Editable = false;
        }
        modify("Bill-to Address 2")
        {
            Editable = false;
        }
        modify("Bill-to Post Code")
        {
            Editable = false;
        }
        modify("Bill-to City")
        {
            Editable = false;
        }
        modify("Bill-to Contact")
        {
            Editable = false;
        }
        modify("Ship-to Code")
        {
            Editable = SetEditable2;
        }
        modify("Ship-to Name")
        {
            Editable = false;
        }
        modify("Ship-to Address")
        {
            Editable = false;
        }
        modify("Ship-to Address 2")
        {
            Editable = false;
        }
        modify("Ship-to Post Code")
        {
            Editable = false;
        }
        modify("Ship-to City")
        {
            Editable = false;
        }
        modify("Ship-to Contact")
        {
            Editable = false;
        }
        modify("Location Code")
        {
            Editable = false;
        }
        modify("Shipment Method Code")
        {
            Editable = false;
        }
        modify("GST Bill-to State Code")
        {
            Editable = false;
        }
        modify("GST Ship-to State Code")
        {
            Editable = false;
        }



        addafter(Status)
        {
            field("User ID"; Rec."User ID")
            {
                Editable = false;
            }
            field("Flooring Customer Type"; Rec."Flooring Customer Type")
            {
                Editable = false;
            }
            field("Price Type"; Rec."Price Type")
            {
            }
            field("PP No"; Rec."PP No")
            {
            }
            field("Price Code"; Rec."Price Code")
            {
                Editable = false;
            }
            field("Posting Date"; Rec."Posting Date")
            {
            }

            field("Total Order Cubage"; Rec."Total Order Cubage")
            {
                Editable = false;
            }
            field("Total Order Weight"; Rec."Total Order Weight")
            {
                Editable = false;
            }
            field(Link; Rec.Link)
            {
            }
            field("Amount Including VAT"; Rec."Amount Including VAT")
            {
            }
            field("Vertical Segment"; Rec."Vertical Segment")
            {
                ApplicationArea = all;
            }
            field("Transit Document"; Rec."Transit Document")
            {
                ApplicationArea = all;
                Editable = false;
            }
            // field("Location State Code"; Rec."Location State Code")
            // {
            //     ApplicationArea = all;
            //     Editable = false;
            // }
        }

    }
    actions
    {
        modify(Statistics)
        {
            trigger OnBeforeAction()
            var
                SalesHeader: Record "Sales Header";
                SalesSetup: Record "Sales & Receivables Setup";
                SalesLine: Record "Sales Line";
            begin
                SalesHeader.CalcInvDiscForHeader;
                SalesSetup.GET;
                //CALCFIELDS("Price Inclusive of Taxes");
                //IF SalesSetup."Calc. Inv. Discount" AND (NOT "Price Inclusive of Taxes") THEN BEGIN
                SalesHeader.CalcInvDiscForHeader;
                COMMIT;
                //END;
                // IF "Price Inclusive of Taxes" THEN BEGIN
                SalesLine.InitStrOrdDetail(Rec);
                SalesLine.GetSalesPriceExclusiveTaxes(Rec);
                //SalesLine.UpdateSalesLinesPIT(Rec);
                COMMIT;
                //END;

                // IF Structure <> '' THEN BEGIN
                SalesLine.CalculateStructures(Rec);
                // SalesLine.AdjustStructureAmounts(Rec);
                // SalesLine.UpdateSalesLines(Rec);
                SalesLine.CalculateTCS(Rec);
                //END ELSE 
                BEGIN
                    SalesLine.CalculateTCS(Rec);
                END;
                COMMIT;
                PAGE.RUNMODAL(PAGE::"Sales Order Statistics", Rec);
            end;
        }

    }  //psp (pending solving error)








    trigger OnOpenPage()
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            Rec.FILTERGROUP(2); //psp(using rec have a doubt)
            Rec.SETRANGE(Rec."Responsibility Center", UserMgt.GetSalesFilter); //psp(using rec have a doubt)
            Rec.FILTERGROUP(0); //psp(using rec have a doubt)
        END;

        //LFS +
        UserSetUp_Rec.GET(USERID);
        //ShortCloseEdit := UserSetUp_Rec."ShortClose Authorisation"; //psp (not found in user setup)
        //LFS -

        //DSS08thMar07------------------
        IF UserSetup.GET(USERID) THEN
            // IF UserSetup.Auditor = TRUE THEN  //psp(not found)
            CurrPage.EDITABLE(FALSE);
        //-----------------------------
    end;

    trigger OnAfterGetRecord()
    begin

        //DSS-SM-WEBORDER-If web order, make Sell-to-Customer No. ineditable
        IF Rec."Web Order" THEN
            SetEditable := FALSE
        ELSE
            SetEditable := FALSE;
        //DSS-SM-WEBORDER-If web order, make Sell-to-Customer No. ineditable

        IF Rec."Web Order" THEN
            SetEditable := FALSE
        ELSE
            SetEditable := FALSE;
        //DSS-SM-WEBORDER-If web order, make Sell-to-Customer No. ineditable

        //DSS-SM-WEBORDER-If web order and ShipToBillToSame, make SHIP-to-Code ineditable
        IF Rec."Web Order" AND Rec.ShipToBillToSame THEN
            SetEditable2 := FALSE
        ELSE
            SetEditable2 := TRUE;
        //DSS-SM-WEBORDER-If web order and ShipToBillToSame, make SHIP-to-Code ineditable
    end;

    procedure OrderLineFound(SalesHeader: Record "Sales Header"): Boolean
    var
        SalesLine: Record "Sales Line";
    begin
        //DSS-VM-25833 Start
        WITH SalesHeader DO BEGIN
            SalesLine.RESET;
            SalesLine.SETRANGE(SalesLine."Document Type", SalesHeader."Document Type");
            SalesLine.SETRANGE(SalesLine."Document No.", SalesHeader."No.");
            SalesLine.SETFILTER(SalesLine.
            "Qty. to Ship", '<>%1', 0);
            EXIT(SalesLine.FINDFIRST);
        END;
        //DSS-VM-25833 
    End;

    procedure ValidateQtyToShip(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        //DSS-VM-25833 Start
        WITH SalesHeader DO BEGIN
            SalesLine.RESET;
            SalesLine.SETRANGE(SalesLine."Document Type", SalesHeader."Document Type");
            SalesLine.SETRANGE(SalesLine."Document No.", SalesHeader."No.");
            IF SalesLine.FINDSET THEN
                REPEAT
                    SalesLine.VALIDATE(SalesLine."Qty. to Ship", SalesLine."Qty. to Ship");
                    SalesLine.MODIFY;
                UNTIL SalesLine.NEXT = 0;
        END;
        //DSS-VM-25833 End
    end;

    procedure MakeHeaderAmount(SalesHeader: Record "Sales Header"; Type: Option Make,Clear)
    var
        SalesLine: Record "Sales Line";
        TmpAmt: Decimal;
    begin
        //DSS-VM-25833 Start
        CASE Type OF
            Type::Make:
                BEGIN
                    WITH SalesHeader DO BEGIN
                        SalesLine.RESET;
                        SalesLine.SETRANGE(SalesLine."Document Type", SalesHeader."Document Type");
                        SalesLine.SETRANGE(SalesLine."Document No.", SalesHeader."No.");
                        IF SalesLine.FINDSET THEN
                            REPEAT
                                SalesLine."Amount Including VAT" := SalesLine."Unit Price" * SalesLine."Qty. to Ship";
                                SalesLine.MODIFY;
                            UNTIL SalesLine.NEXT = 0;
                    END;
                END;
            Type::Clear:
                BEGIN
                    WITH SalesHeader DO BEGIN
                        SalesLine.RESET;
                        SalesLine.SETRANGE(SalesLine."Document Type", SalesHeader."Document Type");
                        SalesLine.SETRANGE(SalesLine."Document No.", SalesHeader."No.");
                        IF SalesLine.FINDSET THEN
                            REPEAT
                                SalesLine."Amount Including VAT" := 0;
                                SalesLine.MODIFY;
                            UNTIL SalesLine.NEXT = 0;
                    END;
                END;
        END;
        //DSS-VM-25833 End
    end;



    var
        UserMgt: Codeunit "User Setup Management";
        UserSetup: Record "User Setup";
        UserSetUp_Rec: Record "User Setup";
        SetEditable: Boolean;
        SetEditable2: Boolean;
        SalesHeader: Record "Sales Header";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesLine: Record "Sales Line";



}


