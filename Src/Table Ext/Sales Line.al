tableextension 60004 "Sales_Line" extends "Sales Line"
{
    fields
    {

    }

    LOCAL procedure CheckStructureOnLineWise(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";


    begin
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        SalesLine.SETRANGE(Type, SalesLine.Type::Item);
        SalesLine.SETRANGE("Price Inclusive of Tax", TRUE);
        IF SalesLine.FINDSET THEN
            REPEAT
            // IF SalesHeader.Structure <> SalesLine."PIT Structure" THEN
            //     ERROR(GSTStructureErr, SalesHeader.Structure, SalesLine."PIT Structure");
            UNTIL SalesLine.NEXT = 0;
    end;


    procedure CheckHeaderAndLineLocation(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        // IF NOT GSTManagement.IsGSTApplicable(SalesHeader.Structure) THEN //psp codeunit not found also field 
        EXIT;
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        SalesLine.SETFILTER(Type, '<>%1', SalesLine.Type::" ");
        SalesLine.SETFILTER("Location Code", '<>%1', SalesHeader."Location Code");
        IF SalesLine.FINDFIRST THEN
            SalesLine.TESTFIELD("Location Code", SalesHeader."Location Code");
    end;


    procedure InitStrOrdDetail(SalesHeader: Record "Sales Header")
    var

        //StrOrderDetails: Record Structure Order Details;
        SaleLines: Record "Sales Line";
    // StrDetails: Record Structure Details;
    begin
        WITH SalesHeader DO BEGIN
            SaleLines.SETRANGE("Document Type", "Document Type");
            SaleLines.SETRANGE("Document No.", "No.");
            SaleLines.SETFILTER(Type, '<>%1', SaleLines.Type::" ");
            SaleLines.SETRANGE("Price Inclusive of Tax", TRUE);
            IF SaleLines.FINDSET THEN
                REPEAT
                    // StrOrderDetails.SETCURRENTKEY("Document Type", "Document No.", Type);
                    // StrOrderDetails.SETRANGE(Type, StrOrderDetails.Type::Sale);
                    // StrOrderDetails.SETRANGE("Document Type", "Document Type");
                    // StrOrderDetails.SETRANGE("Document No.", "No.");
                    // StrOrderDetails.SETRANGE("Document Line No.", SaleLines."Line No.");
                    // StrOrderDetails.SETRANGE("Price Inclusive of Tax", TRUE);
                    // IF NOT StrOrderDetails.FINDFIRST THEN BEGIN
                    //     SaleLines."Amount Added to Excise Base" := 0;
                    //     SaleLines."Amount Added to Tax Base" := 0;
                    //     SaleLines."Excise Amount" := 0;
                    SaleLines."VAT Base Amount" := 0;
                    SaleLines.VALIDATE("Tax Liable", FALSE);
                    SaleLines.UpdateAmounts;
                    SaleLines.MODIFY;

                //         StrDetails.RESET;
                //         StrDetails.SETRANGE(Code, SaleLines."PIT Structure");
                //         IF StrDetails.FINDSET THEN
                //             REPEAT
                //                 IF StrDetails."Include PIT Calculation" AND StrDetails."Payable to Third Party" THEN
                //                     StrDetails.TESTFIELD("Payable to Third Party", FALSE);
                //                 StrOrderDetails.Type := StrOrderDetails.Type::Sale;
                //                 StrOrderDetails."Document Type" := "Document Type";
                //                 StrOrderDetails."Document No." := "No.";
                //                 StrOrderDetails."Document Line No." := SaleLines."Line No.";
                //                 StrOrderDetails."Structure Code" := SaleLines."PIT Structure";
                //                 StrOrderDetails."Calculation Order" := StrDetails."Calculation Order";
                //                 StrOrderDetails."Tax/Charge Type" := StrDetails.Type;
                //                 StrOrderDetails."Tax/Charge Group" := StrDetails."Tax/Charge Group";
                //                 StrOrderDetails."Tax/Charge Code" := StrDetails."Tax/Charge Code";
                //                 StrOrderDetails."Calculation Type" := StrDetails."Calculation Type";
                //                 StrOrderDetails."Calculation Value" := StrDetails."Calculation Value";
                //                 StrOrderDetails."Quantity Per" := StrDetails."Quantity Per";
                //                 StrOrderDetails."Loading on Inventory" := StrDetails."Loading on Inventory";
                //                 StrOrderDetails."% Loading on Inventory" := StrDetails."% Loading on Inventory";
                //                 StrOrderDetails."Payable to Third Party" := StrDetails."Payable to Third Party";
                //                 StrOrderDetails."Account No." := StrDetails."Account No.";
                //                 StrOrderDetails."Base Formula" := StrDetails."Base Formula";
                //                 StrOrderDetails."Include Base" := StrDetails."Include Base";
                //                 StrOrderDetails."Include Line Discount" := StrDetails."Include Line Discount";
                //                 StrOrderDetails."Include Invoice Discount" := StrDetails."Include Invoice Discount";
                //                 StrOrderDetails."Charge Basis" := StrDetails."Charge Basis";
                //                 StrOrderDetails."Header/Line" := StrDetails."Header/Line";
                //                 StrOrderDetails."Available for VAT Input" := StrDetails."Available for VAT Input";
                //                 StrOrderDetails.CVD := StrDetails.CVD;
                //                 StrOrderDetails."Price Inclusive of Tax" := SaleLines."Price Inclusive of Tax";
                //                 StrOrderDetails."Include PIT Calculation" := StrDetails."Include PIT Calculation";
                //                 StrOrderDetails.INSERT;
                //             UNTIL StrDetails.NEXT = 0;
                //     END;
                UNTIL SaleLines.NEXT = 0;
        END;
    end;

    procedure GetSalesPriceExclusiveTaxes(VAR SalesHeader: Record "Sales Header")
    var

        SalesLine: Record "Sales Line";
        // StructureDetails	Record	Structure Details	
        // StrOrderDetails	Record	Structure Order Details	
        // StrOrderLineDetails	Record	Structure Order Line Details	
        // StrOrderLines	Record	Structure Order Line Details	
        BaseAmount: Decimal;
        CFactor: Decimal;
        BaseAmountFixed: Decimal;
        BaseAmountVariable: Decimal;
        //SalesLineBuffer:Record	Sale Line Detail Buffer	
        FixedAmt: Decimal;
        VariableAmt: Decimal;
        CalcInvDis: Codeunit "Sales-Calc. Discount";
        I: Integer;
    begin
        WITH SalesHeader DO BEGIN
            // StrOrderLines.LOCKTABLE;
            // StrOrderLineDetails.LOCKTABLE;
            // CALCFIELDS("Price Inclusive of Taxes");
            // FOR I := 1 TO 2 DO BEGIN
            //     StrOrderLines.RESET;
            //     StrOrderLines.SETCURRENTKEY("Document Type", "Document No.", Type);
            //     StrOrderLines.SETRANGE(Type, StrOrderLines.Type::Sale);
            //     StrOrderLines.SETRANGE("Document Type", "Document Type");
            //     StrOrderLines.SETRANGE("Document No.", "No.");
            //     StrOrderLines.SETRANGE("Price Inclusive of Tax", TRUE);
            //     IF NOT Trading THEN
            //         StrOrderLines.SETRANGE("Manually Changed", FALSE);
            //     IF StrOrderLines.FINDFIRST THEN
            //         StrOrderLines.DELETEALL(TRUE);

            SalesLine.RESET;
            SalesLine.SETRANGE("Document Type", "Document Type");
            SalesLine.SETRANGE("Document No.", "No.");
            SalesLine.SETRANGE("Price Inclusive of Tax", TRUE);
            IF SalesLine.FIND('-') THEN BEGIN
                //IF "Calc. Inv. Discount (%)" AND (I = 2) THEN BEGIN
                CalcInvDis.CalculateWithSalesHeaderPIT(SalesHeader, SalesLine);
                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                SalesLine.SETRANGE("Price Inclusive of Tax", TRUE);
                IF SalesLine.FIND('-') THEN;
                //END;
                REPEAT
                    SalesLine.TESTFIELD("PIT Structure");
                    // StructureDetails.RESET;
                    // StructureDetails.SETRANGE(Code, SalesLine."PIT Structure");
                    // StructureDetails.SETRANGE("Include PIT Calculation", TRUE);
                    // IF NOT StructureDetails.FINDFIRST THEN
                    ERROR(Text16504, SalesLine."Document Type", SalesLine."Document No.", SalesLine."Line No.");
                    IF SalesLine.Quantity <> 0 THEN
                        WITH SalesLine DO BEGIN
                            SalesHeader.TESTFIELD("Free Supply", FALSE);
                            SalesHeader.TESTFIELD(Trading, FALSE);
                            "Amount Added to Excise Base" := 0;
                            "Amount Added to Tax Base" := 0;
                            "VAT Base Amount" := 0;
                            "Excise Base Variable" := 0;
                            "Tax Base Variable" := 0;
                            IF (NOT SalesHeader."Calc. Inv. Discount (%)") OR (I = 1) THEN BEGIN
                                "Inv Discount Fixed" := 0;
                                "Inv Discount Variable" := 0;
                            END;
                            TESTFIELD(CVD, FALSE);
                            TESTFIELD("Unit Price Incl. of Tax");
                            "Total UPIT Amount" := "Unit Price Incl. of Tax" * Quantity;
                            GetStandardDeduction(SalesHeader);
                            StrOrderDetails.RESET;
                            StrOrderDetails.SETCURRENTKEY("Document Type", "Document No.", Type);
                            StrOrderDetails.SETRANGE(Type, StrOrderDetails.Type::Sale);
                            StrOrderDetails.SETRANGE("Document Type", "Document Type");
                            StrOrderDetails.SETRANGE("Document No.", "Document No.");
                            StrOrderDetails.SETRANGE("Document Line No.", "Line No.");
                            StrOrderDetails.SETRANGE("Include PIT Calculation", TRUE);
                            IF StrOrderDetails.FINDSET THEN
                                REPEAT
                                    IF SalesHeader."Price Inclusive of Taxes" THEN
                                        StructureDetails.TESTFIELD(CVD, FALSE);
                                    BaseAmountFixed := 0;
                                    BaseAmountVariable := 0;
                                    BaseAmount := 0;
                                    StrOrderLineDetails.RESET;
                                    StrOrderLineDetails.SETRANGE(Type, StrOrderLineDetails.Type::Sale);
                                    StrOrderLineDetails.SETRANGE("Calculation Order", StrOrderDetails."Calculation Order");
                                    StrOrderLineDetails.SETRANGE("Document Type", "Document Type");
                                    StrOrderLineDetails.SETRANGE("Document No.", "Document No.");
                                    StrOrderLineDetails.SETRANGE("Structure Code", Structure);
                                    StrOrderLineDetails.SETRANGE("Item No.", "No.");
                                    StrOrderLineDetails.SETRANGE("Line No.", "Line No.");
                                    StrOrderLineDetails.SETRANGE("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
                                    StrOrderLineDetails.SETRANGE("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
                                    StrOrderLineDetails.SETRANGE("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
                                    IF NOT StrOrderLineDetails.FINDFIRST THEN BEGIN
                                        StrOrderLineDetails.INIT;
                                        StrOrderLineDetails.Type := StrOrderDetails.Type;
                                        StrOrderLineDetails."Document Type" := StrOrderDetails."Document Type";
                                        StrOrderLineDetails."Document No." := StrOrderDetails."Document No.";
                                        StrOrderLineDetails."Structure Code" := StrOrderDetails."Structure Code";
                                        StrOrderLineDetails."Item No." := "No.";
                                        StrOrderLineDetails."Line No." := "Line No.";
                                        StrOrderLineDetails."Calculation Order" := StrOrderDetails."Calculation Order";
                                        StrOrderLineDetails."Tax/Charge Type" := StrOrderDetails."Tax/Charge Type";
                                        StrOrderLineDetails."Tax/Charge Group" := StrOrderDetails."Tax/Charge Group";
                                        StrOrderLineDetails."Tax/Charge Code" := StrOrderDetails."Tax/Charge Code";
                                        StrOrderLineDetails."Calculation Type" := StrOrderDetails."Calculation Type";
                                        StrOrderLineDetails."Calculation Value" := StrOrderDetails."Calculation Value";
                                        StrOrderLineDetails."Quantity Per" := StrOrderDetails."Quantity Per";
                                        StrOrderLineDetails."Loading on Inventory" := StrOrderDetails."Loading on Inventory";
                                        StrOrderLineDetails."% Loading on Inventory" := StrOrderDetails."% Loading on Inventory";
                                        StrOrderLineDetails."Header/Line" := StrOrderDetails."Header/Line";
                                        StrOrderLineDetails."Include Base" := StrOrderDetails."Include Base";
                                        StrOrderLineDetails."Include Line Discount" := StrOrderDetails."Include Line Discount";
                                        StrOrderLineDetails."Include Invoice Discount" := StrOrderDetails."Include Invoice Discount";
                                        StrOrderLineDetails."Payable to Third Party" := StrOrderDetails."Payable to Third Party";
                                        StrOrderLineDetails.LCY := StrOrderDetails.LCY;
                                        StrOrderLineDetails."Available for VAT input" := StrOrderDetails."Available for VAT Input";
                                        StrOrderLineDetails.CVD := StrOrderDetails.CVD;
                                        StrOrderLineDetails."Price Inclusive of Tax" := StrOrderDetails."Price Inclusive of Tax";
                                        StrOrderLineDetails."Include PIT Calculation" := StrOrderDetails."Include PIT Calculation";
                                        IF StrOrderDetails."Payable to Third Party" THEN
                                            StrOrderDetails.TESTFIELD("Third Party Code");
                                        StrOrderLineDetails."Third Party Code" := StrOrderDetails."Third Party Code";
                                        IF ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) OR
                                            (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
                                        THEN
                                            StrOrderDetails.TESTFIELD("Account No.");
                                        StrOrderLineDetails."Account No." := StrOrderDetails."Account No.";
                                        StrOrderLineDetails."Base Formula" := StrOrderDetails."Base Formula";
                                        IF StrOrderLineDetails."Base Formula" <> '' THEN BEGIN
                                            EvaluateExpressionPIT(TRUE, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails,
                                              BaseAmountFixed);
                                            EvaluateExpressionPITVariable(TRUE, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails,
                                              BaseAmountVariable);
                                        END ELSE BEGIN
                                            BaseAmountFixed := 0;
                                            BaseAmountVariable := 0;
                                        END;

                                        IF StrOrderDetails."Include Base" THEN
                                            BaseAmountVariable := BaseAmountVariable + Quantity;
                                        IF StrOrderDetails."Include Line Discount" THEN
                                            BaseAmountFixed := BaseAmountFixed - "Line Discount Amount";
                                        IF StrOrderDetails."Include Invoice Discount" THEN BEGIN
                                            BaseAmountFixed := BaseAmountFixed + "Inv Discount Fixed";
                                            BaseAmountVariable := BaseAmountVariable - "Inv Discount Variable";
                                        END;

                                        IF SalesHeader."Currency Factor" <> 0 THEN
                                            CFactor := SalesHeader."Currency Factor"
                                        ELSE
                                            CFactor := 1;

                                        IF NOT StrOrderDetails.LCY THEN
                                            CFactor := 1;

                                        IF Type = Type::Item THEN
                                            IF ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) OR
                                                (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
                                            THEN BEGIN
                                                IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" THEN BEGIN
                                                    StrOrderLineDetails."Fixed Base Amount" := 0;
                                                    StrOrderLineDetails."Fixed Amount" := (StrOrderDetails."Calculation Value" * CFactor);
                                                END;
                                                IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage THEN BEGIN
                                                    StrOrderLineDetails."Fixed Base Amount" := BaseAmountFixed;
                                                    StrOrderLineDetails."Variable Base Amount" := BaseAmountVariable;
                                                    StrOrderLineDetails."Variable Amount" := (StrOrderDetails."Calculation Value" * CFactor) *
                                                      BaseAmountVariable / 100;
                                                    StrOrderLineDetails."Fixed Amount" := (StrOrderDetails."Calculation Value" * CFactor) *
                                                      BaseAmountFixed / 100;
                                                END;
                                                IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" THEN BEGIN
                                                    StrOrderLineDetails."Fixed Base Amount" := 0;
                                                    StrOrderLineDetails."Fixed Amount" :=
                                                      (StrOrderDetails."Calculation Value" * CFactor) * Quantity / StrOrderDetails."Quantity Per";
                                                END;
                                            END;

                                        IF Type IN [Type::Item] THEN
                                            IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise THEN BEGIN
                                                IF Trading THEN BEGIN
                                                    IF ExecuteDetailRg23D THEN BEGIN
                                                        CVD := GetBaseAmount(BaseAmountFixed, SalesLine);
                                                        IF NOT MRP THEN
                                                            "Amount Added to Excise Base" := BaseAmountFixed
                                                        ELSE
                                                            "Amount Added to Excise Base" := CalcAmountAddedToExciseBase(SalesLine);
                                                        "Excise Base Variable" := BaseAmountVariable;
                                                        IF "Amount Added to Excise Base" <> 0 THEN
                                                            "Excise Base Amount" := "Amount Added to Excise Base";
                                                        UpdateTaxAmountsPIT(SalesLine, StrOrderLineDetails);
                                                        StrOrderLineDetails."Fixed Base Amount" := "Amount Added to Excise Base";
                                                        StrOrderLineDetails."Variable Base Amount" := BaseAmountVariable;
                                                    END;
                                                END ELSE BEGIN
                                                    IF NOT MRP THEN
                                                        "Amount Added to Excise Base" := BaseAmountFixed
                                                    ELSE
                                                        "Amount Added to Excise Base" := CalcAmountAddedToExciseBase(SalesLine);
                                                    "Excise Base Variable" := BaseAmountVariable;
                                                    CVD := StrOrderDetails.CVD;
                                                    IF CVD AND ("CIF Amount" + "BCD Amount" <> 0) THEN BEGIN
                                                        "Amount Added to Excise Base" := "CIF Amount" + "BCD Amount";
                                                        BaseAmountFixed := "CIF Amount" + "BCD Amount";
                                                    END;
                                                    IF "Amount Added to Excise Base" <> 0 THEN
                                                        "Excise Base Amount" := "Amount Added to Excise Base";
                                                    UpdateTaxAmountsPIT(SalesLine, StrOrderLineDetails);
                                                    StrOrderLineDetails."Fixed Base Amount" := BaseAmountFixed;
                                                    StrOrderLineDetails."Variable Base Amount" := BaseAmountVariable;
                                                END;
                                                StrOrderLineDetails."Fixed Amount" := 0;
                                                StrOrderLineDetails."Variable Amount" := 0;
                                                SalesLineBuffer.RESET;
                                                SalesLineBuffer.SETRANGE("Document Type", "Document Type");
                                                SalesLineBuffer.SETRANGE("Document No.", "Document No.");
                                                SalesLineBuffer.SETRANGE("Document Line No.", "Line No.");
                                                SalesLineBuffer.SETRANGE(Type, StrOrderLineDetails."Tax/Charge Type");
                                                IF SalesLineBuffer.FINDSET THEN
                                                    REPEAT
                                                        StrOrderLineDetails."Fixed Amount" := StrOrderLineDetails."Fixed Amount" +
                                                          SalesLineBuffer."Fixed Amount";
                                                        StrOrderLineDetails."Variable Amount" := StrOrderLineDetails."Variable Amount" +
                                                          SalesLineBuffer."Variable Amount";
                                                    UNTIL SalesLineBuffer.NEXT = 0;
                                            END;

                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" THEN BEGIN
                                            "Amount Added to Tax Base" := ROUND(BaseAmountFixed, Currency."Amount Rounding Precision");
                                            "Tax Base Variable" := BaseAmountVariable;
                                            UpdateTaxAmountsPIT(SalesLine, StrOrderLineDetails);
                                            StrOrderLineDetails."Base Amount" := "Tax Base Amount";
                                            StrOrderLineDetails.Amount := "Amount Including Tax" - "Tax Base Amount";

                                            StrOrderLineDetails."Fixed Amount" := 0;
                                            StrOrderLineDetails."Variable Amount" := 0;
                                            SalesLineBuffer.RESET;
                                            SalesLineBuffer.SETRANGE("Document Type", "Document Type");
                                            SalesLineBuffer.SETRANGE("Document No.", "Document No.");
                                            SalesLineBuffer.SETRANGE("Document Line No.", "Line No.");
                                            SalesLineBuffer.SETRANGE(Type, StrOrderLineDetails."Tax/Charge Type");
                                            IF SalesLineBuffer.FINDSET THEN
                                                REPEAT
                                                    StrOrderLineDetails."Fixed Amount" := StrOrderLineDetails."Fixed Amount" +
                                                      SalesLineBuffer."Fixed Amount";
                                                    StrOrderLineDetails."Variable Amount" := StrOrderLineDetails."Variable Amount" +
                                                      SalesLineBuffer."Variable Amount";
                                                UNTIL SalesLineBuffer.NEXT = 0;
                                        END;

                                        IF "Currency Factor" <> 0 THEN
                                            CFactor := "Currency Factor"
                                        ELSE
                                            CFactor := 1;

                                        IF "Currency Code" <> '' THEN
                                            Currency.GET("Currency Code");

                                        StrOrderLineDetails.INSERT;
                                    END;
                                UNTIL StrOrderDetails.NEXT = 0;

                            FixedAmt := 0;
                            VariableAmt := 0;
                            FixedAmt := "Unit Price Incl. of Tax" * Quantity;
                            VariableAmt := Quantity;
                            StrOrderLineDetails.RESET;
                            StrOrderLineDetails.SETCURRENTKEY(Type, "Document Type", "Document No.", "Structure Code", "Item No.", "Line No.");
                            StrOrderLineDetails.SETRANGE(Type, StrOrderLineDetails.Type::Sale);
                            StrOrderLineDetails.SETRANGE("Document Type", "Document Type");
                            StrOrderLineDetails.SETRANGE("Document No.", "Document No.");
                            StrOrderLineDetails.SETRANGE("Structure Code", "PIT Structure");
                            StrOrderLineDetails.SETRANGE("Item No.", "No.");
                            StrOrderLineDetails.SETRANGE("Line No.", "Line No.");
                            StrOrderLineDetails.CALCSUMS("Fixed Amount", "Variable Amount");
                            FixedAmt -= StrOrderLineDetails."Fixed Amount";
                            VariableAmt += StrOrderLineDetails."Variable Amount";
                            "Unit Price" := 0;
                            IF VariableAmt <> 0 THEN BEGIN
                                "Unit Price" := ROUND(FixedAmt / VariableAmt, GetRoundingPrecisionUnitPrice);
                                IF "Unit Price" < 0 THEN
                                    FIELDERROR("Unit Price");
                                ValidateUnitPrice;
                                ChkQtyUpdatioAfterDDPLA;
                            END;
                        END;
                    SalesLine.MODIFY;
                UNTIL SalesLine.NEXT = 0;
                IF I = 2 THEN BEGIN
                    IF "Calc. Inv. Discount (%)" THEN
                        CalcInvDis.CalculateWithSalesHeader(SalesHeader, SalesLine);
                    CalculateStructuresPIT(SalesHeader);
                END;
            END;
        END;
    END;
    end;

    procedure CalculateStructures(VAR SalesHeader: Record "Sales Header")
    var

        SalesLine: Record "Sales Line";
        //StrOrderDetails : Record   //psp table not found
        // StrOrderLineDetails : Record //psp table not found
        //StrOrderLines  : Record  Structure Order Line Details //psp table not found
        TotalAmount: Decimal;
        TotalLines: Decimal;
        BaseAmount: Decimal;
        OriginalCurrencyFactor: Decimal;
    begin
        CheckHeaderAndLineLocation(SalesHeader);
        WITH SalesHeader DO BEGIN
            CheckStructureOnLineWise(SalesHeader);
            Currency.Initialize("Currency Code");
            CheckShipToCode;
            IF "Currency Code" <> '' THEN BEGIN
                TESTFIELD("Currency Factor");
                Currency.TESTFIELD("Amount Rounding Precision");
            END;

            IF "Currency Factor" <> 0 THEN
                CFactor := "Currency Factor"
            ELSE
                CFactor := 1;
            OriginalCurrencyFactor := CFactor;
            TempRG23DRemainder.DELETEALL;
            TempRG23DConsumedInCurrDoc.DELETEALL;
            ExecuteDetailRg23D := ((NOT Ship) AND (NOT Invoice)) OR Invoice;
            StrOrderLines.LOCKTABLE;
            StrOrderLineDetails.LOCKTABLE;
            StrOrderLines.RESET;
            StrOrderLines.SETCURRENTKEY("Document Type", "Document No.", Type);
            StrOrderLines.SETRANGE(Type, StrOrderLines.Type::Sale);
            StrOrderLines.SETRANGE("Document Type", "Document Type");
            StrOrderLines.SETRANGE("Document No.", "No.");
            StrOrderLines.SETRANGE("Price Inclusive of Tax", FALSE);
            IF NOT Trading THEN
                StrOrderLines.SETRANGE("Manually Changed", FALSE);
            IF StrOrderLines.FINDFIRST THEN
                StrOrderLines.DELETEALL(TRUE);

            IF GSTManagement.IsGSTApplicable(Structure) THEN
                GSTManagement.SalesPostValidations(SalesHeader);

            SalesLine.SETRANGE("Document Type", "Document Type");
            SalesLine.SETRANGE("Document No.", "No.");
            SalesLine.SETFILTER(Type, '%1|%2|%3', SalesLine.Type::Item, SalesLine.Type::"Fixed Asset", SalesLine.Type::Resource);
            SalesLine.SETRANGE("Price Inclusive of Tax", FALSE);
            IF SalesLine.FIND('-') THEN
                REPEAT
                    TotalAmount := TotalAmount + (SalesLine.Quantity * SalesLine."Unit Price");
                UNTIL SalesLine.NEXT = 0;

            SalesLine.RESET;
            SalesLine.SETRANGE("Document Type", "Document Type");
            SalesLine.SETRANGE("Document No.", "No.");
            SalesLine.SETRANGE("Price Inclusive of Tax", FALSE);
            IF SalesLine.FIND('-') THEN BEGIN
                TotalLines := SalesLine.COUNT;
                REPEAT
                    IF (SalesLine.Quantity <> 0) AND (SalesLine."Unit Price" <> 0) THEN BEGIN
                        WITH SalesLine DO BEGIN
                            Rec."Amount Added to Excise Base" := 0;
                            "Amount Added to Tax Base" := 0;
                            "VAT Base Amount" := 0;
                            AssessableValueCalc := CheckAssessableValue(SalesHeader);
                            CVD := FALSE;
                            StrOrderDetails.RESET;
                            StrOrderDetails.SETCURRENTKEY("Document Type", "Document No.", Type);
                            StrOrderDetails.SETRANGE(Type, StrOrderDetails.Type::Sale);
                            StrOrderDetails.SETRANGE("Document Type", "Document Type");
                            StrOrderDetails.SETRANGE("Document No.", "Document No.");
                            StrOrderDetails.SETRANGE("Document Line No.", 0);
                            IF StrOrderDetails.FIND('-') THEN
                                REPEAT
                                    IF NOT StrOrderDetails.LCY THEN
                                        CFactor := 1;
                                    StrOrderLineDetails.RESET;
                                    StrOrderLineDetails.SETRANGE(Type, StrOrderLineDetails.Type::Sale);
                                    StrOrderLineDetails.SETRANGE("Calculation Order", StrOrderDetails."Calculation Order");
                                    StrOrderLineDetails.SETRANGE("Document Type", "Document Type");
                                    StrOrderLineDetails.SETRANGE("Document No.", "Document No.");
                                    StrOrderLineDetails.SETRANGE("Structure Code", Structure);
                                    StrOrderLineDetails.SETRANGE("Item No.", "No.");
                                    StrOrderLineDetails.SETRANGE("Line No.", "Line No.");
                                    StrOrderLineDetails.SETRANGE("Tax/Charge Type", StrOrderDetails."Tax/Charge Type");
                                    StrOrderLineDetails.SETRANGE("Tax/Charge Group", StrOrderDetails."Tax/Charge Group");
                                    StrOrderLineDetails.SETRANGE("Tax/Charge Code", StrOrderDetails."Tax/Charge Code");
                                    IF NOT StrOrderLineDetails.FINDFIRST THEN BEGIN
                                        StrOrderLineDetails.INIT;
                                        StrOrderLineDetails.Type := StrOrderDetails.Type;
                                        StrOrderLineDetails."Document Type" := StrOrderDetails."Document Type";
                                        StrOrderLineDetails."Document No." := StrOrderDetails."Document No.";
                                        StrOrderLineDetails."Structure Code" := StrOrderDetails."Structure Code";
                                        StrOrderLineDetails."Item No." := "No.";
                                        StrOrderLineDetails."Line No." := "Line No.";
                                        StrOrderLineDetails."Calculation Order" := StrOrderDetails."Calculation Order";
                                        StrOrderLineDetails."Tax/Charge Type" := StrOrderDetails."Tax/Charge Type";
                                        StrOrderLineDetails."Tax/Charge Group" := StrOrderDetails."Tax/Charge Group";
                                        StrOrderLineDetails."Tax/Charge Code" := StrOrderDetails."Tax/Charge Code";
                                        StrOrderLineDetails."Calculation Type" := StrOrderDetails."Calculation Type";
                                        StrOrderLineDetails."Calculation Value" := StrOrderDetails."Calculation Value";
                                        StrOrderLineDetails."Quantity Per" := StrOrderDetails."Quantity Per";
                                        StrOrderLineDetails."Loading on Inventory" := StrOrderDetails."Loading on Inventory";
                                        StrOrderLineDetails."% Loading on Inventory" := StrOrderDetails."% Loading on Inventory";
                                        StrOrderLineDetails."Header/Line" := StrOrderDetails."Header/Line";
                                        StrOrderLineDetails."Include Base" := StrOrderDetails."Include Base";
                                        StrOrderLineDetails."Include Line Discount" := StrOrderDetails."Include Line Discount";
                                        StrOrderLineDetails."Include Invoice Discount" := StrOrderDetails."Include Invoice Discount";
                                        StrOrderLineDetails."Payable to Third Party" := StrOrderDetails."Payable to Third Party";
                                        StrOrderLineDetails.LCY := StrOrderDetails.LCY;
                                        StrOrderLineDetails."Available for VAT input" := StrOrderDetails."Available for VAT Input";
                                        StrOrderLineDetails."Exclude GST in TCS Base" := StrOrderDetails."Exclude GST in TCS Base";
                                        StrOrderLineDetails.CVD := StrOrderDetails.CVD;
                                        IF StrOrderDetails."Payable to Third Party" THEN
                                            StrOrderDetails.TESTFIELD("Third Party Code");
                                        StrOrderLineDetails."Third Party Code" := StrOrderDetails."Third Party Code";
                                        IF ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) OR
                                            (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
                                        THEN
                                            StrOrderDetails.TESTFIELD("Account No.");
                                        StrOrderLineDetails."Account No." := StrOrderDetails."Account No.";
                                        StrOrderLineDetails."Base Formula" := StrOrderDetails."Base Formula";
                                        IF StrOrderLineDetails."Base Formula" <> '' THEN
                                            BaseAmount := EvaluateExpressioninStructures(TRUE, StrOrderLineDetails."Base Formula", SalesLine, StrOrderDetails)
                                        ELSE
                                            BaseAmount := 0;

                                        IF StrOrderDetails."Include Base" THEN
                                            BaseAmount := BaseAmount + Quantity * "Unit Price";
                                        IF StrOrderDetails."Include Line Discount" THEN
                                            BaseAmount := BaseAmount - "Line Discount Amount";
                                        IF StrOrderDetails."Include Invoice Discount" THEN
                                            BaseAmount := BaseAmount - "Inv. Discount Amount";


                                        IF (Type <> Type::"Charge (Item)") AND (Type <> Type::"G/L Account") THEN
                                            IF ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) OR
                                                (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
                                            THEN BEGIN
                                                IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" THEN BEGIN
                                                    IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges THEN
                                                        StrOrderDetails.TESTFIELD("Charge Basis");
                                                    IF StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Amount THEN BEGIN
                                                        StrOrderLineDetails."Base Amount" := Quantity * "Unit Price";
                                                        StrOrderLineDetails.Amount :=
                                                          (StrOrderDetails."Calculation Value" * CFactor) * (Quantity * "Unit Price") / TotalAmount;
                                                    END;
                                                    IF StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Equally THEN BEGIN
                                                        StrOrderLineDetails."Base Amount" := 0;
                                                        StrOrderLineDetails.Amount := (StrOrderDetails."Calculation Value" * CFactor) / TotalLines;
                                                    END;
                                                END;
                                                IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage THEN BEGIN
                                                    StrOrderLineDetails."Base Amount" := BaseAmount;
                                                    StrOrderLineDetails.Amount := StrOrderDetails."Calculation Value" * BaseAmount / 100;
                                                END;
                                                IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" THEN BEGIN
                                                    StrOrderLineDetails."Base Amount" := 0;
                                                    StrOrderLineDetails.Amount :=
                                                      (StrOrderDetails."Calculation Value" * CFactor) * Quantity / StrOrderDetails."Quantity Per";
                                                END;
                                            END;
                                        IF Type IN [Type::"Charge (Item)", Type::"G/L Account"] THEN
                                            IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise THEN
                                                IF Trading THEN BEGIN
                                                    IF ExecuteDetailRg23D THEN BEGIN
                                                        CVD := GetBaseAmount(BaseAmount, SalesLine);
                                                        "Amount Added to Excise Base" := BaseAmount;
                                                        UpdateTaxAmounts;
                                                        StrOrderLineDetails."Base Amount" := "Excise Base Amount";
                                                        StrOrderLineDetails.Amount := "Excise Amount";
                                                    END;
                                                END ELSE BEGIN
                                                    "Amount Added to Excise Base" := BaseAmount;
                                                    CVD := StrOrderDetails.CVD;
                                                    IF CVD AND ("CIF Amount" + "BCD Amount" <> 0) THEN
                                                        "Amount Added to Excise Base" := ("CIF Amount" + "BCD Amount") * Quantity;
                                                    IF AssessableValueCalc AND (NOT CVD) THEN BEGIN
                                                        "Amount Added to Excise Base" := "Assessable Value" * Quantity;
                                                        "Excise Base Amount" := "Assessable Value" * Quantity;
                                                    END;
                                                    UpdateTaxAmounts;
                                                    StrOrderLineDetails."Base Amount" := "Excise Base Amount";
                                                    StrOrderLineDetails.Amount := "Excise Amount";
                                                END;
                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::GST THEN BEGIN
                                            UpdateGSTBase(SalesLine, BaseAmount);
                                            ValidateGSTRegistration;
                                            UpdateGSTAmounts("GST Base Amount");
                                            StrOrderLineDetails."Base Amount" := "GST Base Amount";
                                            StrOrderLineDetails.Amount := "Total GST Amount";
                                        END ELSE
                                            UpdateGSTAmounts("GST Base Amount");
                                        IF Type IN [Type::Item, Type::"Fixed Asset"] THEN
                                            IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Excise THEN
                                                IF Trading THEN BEGIN
                                                    IF ExecuteDetailRg23D THEN BEGIN
                                                        CVD := GetBaseAmount(BaseAmount, SalesLine);
                                                        IF NOT MRP THEN
                                                            "Amount Added to Excise Base" := BaseAmount
                                                        ELSE
                                                            TESTFIELD(MRP, FALSE);
                                                        UpdateTaxAmounts;
                                                        StrOrderLineDetails."Base Amount" := "Excise Base Amount";
                                                        StrOrderLineDetails.Amount := "Excise Amount";
                                                    END;
                                                END ELSE BEGIN
                                                    IF NOT MRP THEN
                                                        "Amount Added to Excise Base" := BaseAmount
                                                    ELSE BEGIN
                                                        IF StrOrderDetails.CVD THEN
                                                            TESTFIELD(MRP, FALSE);
                                                        "Amount Added to Excise Base" := CalcAmountAddedToExciseBase(SalesLine);
                                                    END;
                                                    CVD := StrOrderDetails.CVD;
                                                    IF CVD AND ("CIF Amount" + "BCD Amount" <> 0) THEN
                                                        "Amount Added to Excise Base" := ("CIF Amount" + "BCD Amount") * Quantity;
                                                    IF AssessableValueCalc AND (NOT CVD) AND (NOT MRP) THEN BEGIN
                                                        "Amount Added to Excise Base" := "Assessable Value" * Quantity;
                                                        "Excise Base Amount" := "Assessable Value" * Quantity;
                                                    END;
                                                    UpdateTaxAmounts;
                                                    StrOrderLineDetails."Base Amount" := "Excise Base Amount";
                                                    StrOrderLineDetails.Amount := "Excise Amount";
                                                END;
                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" THEN BEGIN
                                            "Amount Added to Tax Base" := ROUND(BaseAmount, Currency."Amount Rounding Precision");
                                            UpdateTaxAmounts;
                                            StrOrderLineDetails."Base Amount" := "Tax Base Amount";
                                            StrOrderLineDetails.Amount := "Amount Including Tax" - "Tax Base Amount";
                                        END;
                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Service Tax" THEN BEGIN
                                            IF "Transaction No. Serv. Tax" <> 0 THEN
                                                "Service Tax Base" := ROUND(BaseAmount)
                                            ELSE
                                                "Service Tax Base" := ROUND(BaseAmount, Currency."Amount Rounding Precision");
                                            UpdateTaxAmounts;
                                            StrOrderLineDetails."Base Amount" := "Service Tax Base";
                                            StrOrderLineDetails.Amount := ROUND("Service Tax Amount" + "Service Tax eCess Amount" +
                                                "Service Tax SHE Cess Amount" + "Service Tax SBC Amount" + "KK Cess Amount");
                                        END;
                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::GST THEN BEGIN
                                            UpdateGSTBase(SalesLine, BaseAmount);
                                            ValidateGSTRegistration;
                                            UpdateGSTAmounts("GST Base Amount");
                                            StrOrderLineDetails."Base Amount" := "GST Base Amount";
                                            StrOrderLineDetails.Amount := "Total GST Amount";
                                        END;
                                        IF "Free Supply" THEN BEGIN
                                            IF ((StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) OR
                                                (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes"))
                                            THEN
                                                StrOrderDetails.TESTFIELD("Third Party Code")
                                        END;
                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Sales Tax" THEN
                                            TESTFIELD("Free Supply", FALSE);

                                        CFactor := OriginalCurrencyFactor;

                                        IF "Currency Code" <> '' THEN
                                            Currency.GET("Currency Code");

                                        StrOrderLineDetails."Amount (LCY)" := StrOrderLineDetails.Amount / CFactor;
                                        StrOrderLineDetails.INSERT;
                                    END ELSE
                                        IF StrOrderLineDetails."Manually Changed" THEN BEGIN
                                            IF ((Type <> Type::"Charge (Item)") AND
                                                (Type <> Type::"G/L Account"))
                                            THEN
                                                IF (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges) OR
                                                   (StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::"Other Taxes")
                                                THEN BEGIN
                                                    IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Fixed Value" THEN BEGIN
                                                        IF StrOrderDetails."Tax/Charge Type" = StrOrderDetails."Tax/Charge Type"::Charges THEN
                                                            StrOrderDetails.TESTFIELD("Charge Basis");
                                                        IF StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Amount THEN
                                                            StrOrderLineDetails.Amount := StrOrderLineDetails."Calculation Value" * CFactor;
                                                        IF StrOrderDetails."Charge Basis" = StrOrderDetails."Charge Basis"::Equally THEN BEGIN
                                                            StrOrderLineDetails."Base Amount" := 0;
                                                            StrOrderLineDetails.Amount := StrOrderLineDetails."Calculation Value" * CFactor;
                                                        END;
                                                    END;
                                                    IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::Percentage THEN BEGIN
                                                        StrOrderLineDetails."Base Amount" := BaseAmount;
                                                        StrOrderLineDetails.Amount := StrOrderDetails."Calculation Value" * BaseAmount / 100;
                                                    END;
                                                    IF StrOrderDetails."Calculation Type" = StrOrderDetails."Calculation Type"::"Amount Per Qty" THEN BEGIN
                                                        StrOrderLineDetails."Base Amount" := 0;
                                                        StrOrderLineDetails.Amount := (StrOrderDetails."Calculation Value" * CFactor) * Quantity /
                                                          StrOrderDetails."Quantity Per";
                                                    END;

                                                    CFactor := OriginalCurrencyFactor;

                                                    StrOrderLineDetails."Amount (LCY)" := StrOrderLineDetails.Amount / CFactor;
                                                    StrOrderLineDetails.MODIFY;
                                                END;
                                        END;
                                UNTIL StrOrderDetails.NEXT = 0;
                        END;
                    END ELSE BEGIN
                        SalesLine."Amount Added to Tax Base" := 0;
                        SalesLine."Tax Base Amount" := 0;
                        SalesLine."Tax Amount" := 0;
                        SalesLine."GST Base Amount" := 0;
                        SalesLine."Total GST Amount" := 0;
                        SalesLine."GST %" := 0;
                    END;
                    SalesLine.MODIFY;
                UNTIL SalesLine.NEXT = 0;
                StrOrderLineDetails.RoundAmounts(
                  SalesHeader."Document Type", SalesHeader."No.", CFactor, Currency."Amount Rounding Precision");
            END;
        END;
    end;

    LOCAL procedure UpdateGSTBase(VAR SalesLine: Record "Sales Line"; BaseAmt: Decimal)
    begin
        IF NOT SalesLine."Non-GST Line" THEN BEGIN
            IF SalesLine."GST Assessable Value (LCY)" <> 0 THEN
                SalesLine."GST Base Amount" := SalesLine."GST Assessable Value (LCY)"
            ELSE
                SalesLine."GST Base Amount" := BaseAmt;
        END ELSE
            SalesLine."GST Base Amount" := 0;
    end;

    procedure CalculateTCS(SalesHeader: Record "Sales Header")
    begin
        IF SalesHeader."Assessee Code" = '' THEN
            EXIT;
        "Per Contract" := FALSE;
        Customer.GET(SalesHeader."Bill-to Customer No.");
        WITH SalesLine DO BEGIN
            SETRANGE("Document Type", SalesHeader."Document Type");
            SETRANGE("Document No.", SalesHeader."No.");
            SETFILTER(Type, '%1|%2|%3', Type::"G/L Account", Type::Item, Type::"Charge (Item)");
            IF FIND('-') THEN
                REPEAT
                    IF ("TCS Nature of Collection" <> '') AND (AccPeriodFilter = '') THEN
                        DateFilterCalc.CreateTCSAccountingDateFilter(AccPeriodFilter, FiscalYear, SalesHeader."Posting Date", 0);
                    InitTCS(SalesLine);
                    TCSBuffer[1].DELETEALL;
                    "Per Contract" := FALSE;
                    TCSAmount := 0;
                    SurchargeAmount := 0;
                    OrderAmount := 0;
                    OrderTCSAmount := 0;
                    AppliedAmount := 0;
                    CLEAR(CustLedgEntry);
                    NOCLine.RESET;
                    NOCLine.SETRANGE(Type, NOCLine.Type::Customer);
                    NOCLine.SETRANGE("No.", "Bill-to Customer No.");
                    NOCLine.SETRANGE("NOD/NOC", "TCS Nature of Collection");
                    IF NOCLine.FINDFIRST THEN BEGIN
                        "Concessional Code" := NOCLine."Concessional Code";
                        TCSSetup.RESET;
                        TCSSetup.SETRANGE("TCS Nature of Collection", "TCS Nature of Collection");
                        TCSSetup.SETRANGE("Assessee Code", "Assessee Code");
                        TCSSetup.SETRANGE("TCS Type", "TCS Type");
                        TCSSetup.SETRANGE("Effective Date", 0D, SalesHeader."Posting Date");
                        TCSSetup.SETRANGE("Concessional Code", NOCLine."Concessional Code");

                        IF TCSSetup.FINDLAST THEN BEGIN
                            StructOrderLine.RESET;
                            StructOrderLine.SETCURRENTKEY(Type, "Document Type", "Document No.", "Item No.", "Line No.");
                            StructOrderLine.SETRANGE(Type, StructOrderLine.Type::Sale);
                            StructOrderLine.SETRANGE("Document Type", "Document Type");
                            StructOrderLine.SETRANGE("Document No.", "Document No.");
                            StructOrderLine.SETRANGE("Item No.", "No.");
                            StructOrderLine.SETRANGE("Line No.", "Line No.");
                            StructOrderLine.CALCSUMS("Amount (LCY)", Amount);
                            UpdateTCSBaseLCY(SalesHeader, SalesLine, StructOrderLine);
                            CalculateTCSPreviousAmounts(SalesLine, AccPeriodFilter, InvoiceAmount, PrevTCSAmount, PrevSurchargeAmount);
                            PrevInvoiceAmount := InvoiceAmount;
                            PrevContractAmount := CalculateTCSPreviousContractAmt(SalesLine, AccPeriodFilter);
                            OrderTCSCalc := FALSE;
                            SalesLine2.RESET;
                            SalesLine2.SETRANGE("Document Type", "Document Type");
                            SalesLine2.SETRANGE("Document No.", "Document No.");
                            SalesLine2.SETRANGE("TCS Type", "TCS Type");
                            SalesLine2.SETRANGE("TCS Nature of Collection", "TCS Nature of Collection");
                            SalesLine2.SETRANGE("Assessee Code", "Assessee Code");
                            SalesLine2.SETFILTER("Line No.", '<%1', "Line No.");
                            SalesLine2.SETFILTER(
                              Type, '%1|%2|%3', SalesLine2.Type::"G/L Account", SalesLine2.Type::Item, SalesLine2.Type::"Charge (Item)");
                            SetQtyTypeFilter(SalesLine2);
                            IF SalesLine2.FIND('-') THEN
                                REPEAT
                                    TotalGSTAmount := 0;
                                    IF GSTManagement.IsGSTApplicable(SalesHeader.Structure) AND NOT StructOrderLine.DoesTCSBaseExcludeGST(SalesHeader)
                                    THEN
                                        TotalGSTAmount := SalesLine2."Total GST Amount";
                                    OrderAmount := CalculateOrderAmount(SalesLine2, TotalGSTAmount, Currency."Amount Rounding Precision");
                                    OrderTCSAmount := OrderTCSAmount + SalesLine2."Total TDS/TCS Incl. SHE CESS";
                                    IF NOT OrderTCSCalc THEN
                                        IF ((SalesLine2."TDS/TCS Base Amount" <> 0) AND (SalesLine2."TDS/TCS %" <> 0)) OR (OrderTCSAmount <> 0) THEN
                                            OrderTCSCalc := TRUE;
                                    IF "Per Contract" THEN BEGIN
                                        ContractAmount := ContractAmount + SalesLine2."TDS/TCS Base Amount";
                                        ContractTCSAmount := ContractTCSAmount + SalesLine2."Total TDS/TCS Incl. SHE CESS";
                                    END;
                                UNTIL SalesLine2.NEXT = 0;
                            IF "Currency Code" <> '' THEN
                                OrderAmount := ROUND(
                                    CurrExchRate.ExchangeAmtFCYToLCY(
                                      SalesHeader."Posting Date", "Currency Code",
                                      OrderAmount, SalesHeader."Currency Factor"));

                            InsertBuffer := FALSE;
                            CalcTCS := FALSE;

                            "Surcharge Base Amount" := TCSBaseLCY;
                            "TDS/TCS %" := SetTDSTCSPernt(TCSSetup, Customer);
                            "Surcharge %" := TCSSetup."Surcharge %";
                            "eCESS % on TDS/TCS" := TCSSetup."eCESS %";
                            "SHE Cess % on TDS/TCS" := TCSSetup."SHE Cess %";
                            "Sales Amount" := TCSBaseLCY;
                            IF (SalesHeader."Applies-to Doc. No." = '') AND (SalesHeader."Applies-to ID" = '') THEN
                                IF NOCLine."Threshold Overlook" THEN BEGIN
                                    "TDS/TCS Base Amount" := TCSBaseLCY;
                                    CalcSurchargeOnTCS(SalesLine, TCSSetup."Surcharge Threshold Amount", PrevInvoiceAmount, OrderAmount,
                                      PrevSurchargeAmount, NOCLine."Surcharge Overlook", InsertBuffer);
                                END ELSE
                                    IF (PrevInvoiceAmount + OrderAmount) > TCSSetup."TCS Threshold Amount" THEN BEGIN
                                        "TDS/TCS Base Amount" := TCSBaseLCY - ContractAmount;
                                        CalcSurchargeOnTCS(SalesLine, TCSSetup."Surcharge Threshold Amount", PrevInvoiceAmount, OrderAmount,
                                          PrevSurchargeAmount, NOCLine."Surcharge Overlook", InsertBuffer);
                                    END ELSE
                                        IF ((PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."TCS Threshold Amount") AND
                                           (TCSSetup."Contract Amount" <> 0)
                                        THEN BEGIN
                                            IF TCSSetup."Calc. Over & Above Threshold" THEN
                                                "TDS/TCS Base Amount" := (PrevInvoiceAmount + TCSBaseLCY) - PrevContractAmount +
                                                  OrderAmount - ContractAmount - TCSSetup."TCS Threshold Amount"
                                            ELSE
                                                "TDS/TCS Base Amount" := PrevInvoiceAmount + TCSBaseLCY - PrevContractAmount + OrderAmount - ContractAmount;

                                            "Sales Amount" := TCSBaseLCY + OrderAmount;
                                            ClearPrevSaleTDSBaseLines(SalesLine);
                                            IF NOCLine."Surcharge Overlook" THEN
                                                "Surcharge Base Amount" += (PrevInvoiceAmount - PrevContractAmount + OrderAmount - ContractAmount)
                                            ELSE
                                                IF (PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."Surcharge Threshold Amount" THEN
                                                    "Surcharge Base Amount" += PrevInvoiceAmount - PrevContractAmount + OrderAmount
                                                ELSE
                                                    IF NOT ((PrevInvoiceAmount + OrderAmount) > TCSSetup."Surcharge Threshold Amount") THEN
                                                        "Surcharge %" := 0;

                                            InsertBuffer := TRUE;
                                            CalcTCS := TRUE;
                                        END ELSE
                                            IF ((TCSBaseLCY + OrderAmount) > TCSSetup."Contract Amount") AND
                                               (TCSSetup."Contract Amount" <> 0)
                                            THEN BEGIN
                                                "Per Contract" := TRUE;
                                                IF OrderTCSAmount = 0 THEN
                                                    "TDS/TCS Base Amount" := TCSBaseLCY + OrderAmount - ContractAmount
                                                ELSE
                                                    "TDS/TCS Base Amount" := TCSBaseLCY;
                                                IF NOCLine."Surcharge Overlook" THEN
                                                    "Surcharge Base Amount" := ABS("Surcharge Base Amount" + OrderAmount - ContractAmount)
                                                ELSE
                                                    IF NOT (TCSBaseLCY > TCSSetup."Surcharge Threshold Amount") THEN
                                                        "Surcharge %" := 0;
                                            END ELSE
                                                IF (PrevInvoiceAmount + OrderAmount + TCSBaseLCY) > TCSSetup."TCS Threshold Amount" THEN BEGIN
                                                    CalcTCSOverAboveThreshold(SalesLine, TCSSetup, PrevInvoiceAmount, OrderAmount);
                                                    ClearPrevSaleTDSBaseLines(SalesLine);
                                                    CalcSurchargeOnTCS(SalesLine, TCSSetup."Surcharge Threshold Amount", PrevInvoiceAmount, OrderAmount,
                                                      PrevSurchargeAmount, NOCLine."Surcharge Overlook", InsertBuffer);
                                                    InsertBuffer := TRUE;
                                                    CalcTCS := TRUE;
                                                END ELSE BEGIN
                                                    "TDS/TCS Base Amount" := TCSBaseLCY;
                                                    "TDS/TCS %" := 0;
                                                    "eCESS % on TDS/TCS" := 0;
                                                    "SHE Cess % on TDS/TCS" := 0;
                                                    "Surcharge %" := 0;
                                                    "Surcharge Amount" := 0;
                                                    "TDS/TCS Amount" := 0;
                                                END
                            ELSE
                                IF "Document Type" IN ["Document Type"::"Credit Memo", "Document Type"::"Return Order"] THEN BEGIN
                                    TCSEntry.RESET;
                                    TCSEntry.SETCURRENTKEY("Document No.", "Posting Date");
                                    IF SalesHeader."Applies-to Doc. No." <> '' THEN
                                        TCSEntry.SETRANGE("Document No.", SalesHeader."Applies-to Doc. No.")
                                    ELSE BEGIN
                                        CustLedgEntry.RESET;
                                        CustLedgEntry.SETRANGE("Applies-to ID", SalesHeader."Applies-to ID");
                                        CustLedgEntry.SETRANGE("TCS Nature of Collection", "TCS Nature of Collection");
                                        CustLedgEntry.SETRANGE("TCS Type", "TCS Type");
                                        IF CustLedgEntry.FINDFIRST THEN
                                            TCSEntry.SETRANGE("Document No.", CustLedgEntry."Document No.")
                                    END;
                                    IF TCSEntry.FIND('+') THEN
                                        IF NOT TCSEntry."TCS Paid" THEN BEGIN
                                            "TDS/TCS Base Amount" := TCSBaseLCY;
                                            "TDS/TCS %" := TCSEntry."TCS %";
                                            "eCESS % on TDS/TCS" := TCSEntry."eCESS %";
                                            "SHE Cess % on TDS/TCS" := TCSEntry."SHE Cess %";
                                            "Surcharge %" := TCSEntry."Surcharge %";
                                            "Surcharge Amount" := TCSEntry."Surcharge Amount";
                                            "TDS/TCS Amount" := TCSEntry."TCS Amount";
                                        END ELSE BEGIN
                                            "TDS/TCS Base Amount" := TCSBaseLCY;
                                            "TDS/TCS %" := 0;
                                            "eCESS % on TDS/TCS" := 0;
                                            "SHE Cess % on TDS/TCS" := 0;
                                            "Surcharge %" := 0;
                                            "Surcharge Amount" := 0;
                                            "TDS/TCS Amount" := 0;
                                        END;
                                END ELSE BEGIN
                                    CalculateTCSAppliedAmt(SalesHeader, SalesLine, AppliedAmount);
                                    IF AppliedAmount <> 0 THEN BEGIN
                                        IF (TCSBaseLCY + OrderAmount) >= ABS(AppliedAmount) THEN BEGIN
                                            CompareAppliedAmtWithThershold(SalesLine, TCSSetup, NOCLine, ABS(AppliedAmount), OrderAmount, OrderTCSAmount,
                                              PrevInvoiceAmount, PrevSurchargeAmount,
                                              InsertBuffer, ContractAmount, PrevContractAmount, CalcTCS, OrderTCSCalc);
                                            "Temp TDS/TCS Base" := TCSBaseLCY - ABS(AppliedAmount);
                                        END ELSE BEGIN
                                            "TDS/TCS Base Amount" := 0;
                                            "Sales Amount" := 0;
                                            "TDS/TCS %" := 0;
                                            "eCESS % on TDS/TCS" := 0;
                                            "SHE Cess % on TDS/TCS" := 0;
                                            "Surcharge %" := 0;
                                        END;
                                    END ELSE
                                        CalcBlankTCSAppliedAmt(SalesLine, NOCLine, TCSSetup, PrevInvoiceAmount, OrderAmount, OrderTCSAmount,
                                          PrevSurchargeAmount, ContractAmount, PrevContractAmount, InsertBuffer, CalcTCS);
                                END;
                            IF InsertBuffer THEN BEGIN
                                Rec := SalesLine;
                                InsertGenTCSBuffer(FALSE);
                                TCSEntry.RESET;
                                TCSEntry.SETCURRENTKEY("Party Type", "Party Code", "Posting Date", "TCS Type", "Assessee Code", Applied);
                                TCSEntry.SETRANGE("Party Type", TCSEntry."Party Type"::Customer);
                                IF (Customer."P.A.N. No." = '') AND (Customer."P.A.N. Status" <> Customer."P.A.N. Status"::" ") THEN
                                    TCSEntry.SETRANGE("Party Code", "Bill-to Customer No.")
                                ELSE
                                    TCSEntry.SETRANGE("Party P.A.N. No.", Customer."P.A.N. No.");
                                TCSEntry.SETFILTER("Posting Date", AccPeriodFilter);
                                TCSEntry.SETRANGE("TCS Type", "TCS Type");
                                TCSEntry.SETRANGE("Assessee Code", "Assessee Code");
                                TCSEntry.SETRANGE(Applied, FALSE);
                                IF TCSEntry.FIND('-') THEN
                                    REPEAT
                                        InsertTCSBuffer(TCSEntry, SalesHeader."Posting Date", "Surcharge %" <> 0, FALSE);
                                    UNTIL TCSEntry.NEXT = 0;
                            END;

                            IF TCSBaseLCY <> 0 THEN BEGIN
                                IF TCSBuffer[1].FIND('+') THEN BEGIN
                                    REPEAT
                                        TCSAmount :=
                                          TCSAmount + (TCSBuffer[1]."TCS Base Amount" - TCSBuffer[1]."Contract TCS Ded. Base Amount") *
                                          TCSBuffer[1]."TCS %" / 100;

                                    UNTIL TCSBuffer[1].NEXT(-1) = 0;
                                    IF TCSBaseLCY < 0 THEN
                                        "TDS/TCS Amount" := -RoundTCSAmount(TCSAmount)
                                    ELSE
                                        "TDS/TCS Amount" := RoundTCSAmount(TCSAmount);

                                    IF "TDS/TCS Base Amount" <> 0 THEN
                                        "TDS/TCS %" := ABS(ROUND(TCSAmount * 100 / "TDS/TCS Base Amount", 0.001));
                                END ELSE
                                    "TDS/TCS Amount" := RoundTCSAmount("TDS/TCS %" * "TDS/TCS Base Amount" / 100);

                                "eCESS on TDS/TCS Amount" := RoundTCSAmount("TDS/TCS Amount" * "eCESS % on TDS/TCS" / 100);
                                "SHE Cess on TDS/TCS Amount" := RoundTCSAmount("TDS/TCS Amount" * "SHE Cess % on TDS/TCS" / 100);
                                SurchargeAmount := "TDS/TCS Amount" + "eCESS on TDS/TCS Amount" + "SHE Cess on TDS/TCS Amount";
                                "Surcharge Amount" := RoundTCSAmount(SurchargeAmount * "Surcharge %" / 100);
                                IF TCSBaseLCY < 0 THEN
                                    "Surcharge Amount" := -RoundTCSAmount("Surcharge Amount")
                                ELSE
                                    "Surcharge Amount" := RoundTCSAmount("Surcharge Amount");
                                "Total TDS/TCS Incl. SHE CESS" := "TDS/TCS Amount" + "Surcharge Amount" + "eCESS on TDS/TCS Amount" +
                                  "SHE Cess on TDS/TCS Amount";
                                "Bal. TDS/TCS Including SHECESS" := "Total TDS/TCS Incl. SHE CESS";
                                IF "Currency Code" <> '' THEN
                                    UpdateAmountBasedOnCurrency(SalesLine, SalesHeader."Currency Factor");
                            END;
                        END;
                    END;
                    MODIFY;
                UNTIL NEXT = 0;
        END;
    end;

    var
        GSTStructureErr: Label 'Structure on Header %1 and PIT Structure %2 on Line must be same.';

        Text16504: Label 'One of the Structure detail should have Include PIT Calculation = Yes for Document Type = %1,  Document No. = %2,  Line No. = %3 for Price Inclusive of Tax = Yes.';
        Currency: Record Currency;
        CFactor: Decimal;
        CVD: Boolean;
        AssessableValueCalc: Boolean;
        salesHeader: Record "Sales Header";
    //TempRG23DRemainder : Record RG 23

}
