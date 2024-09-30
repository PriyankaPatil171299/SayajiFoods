tableextension 60002 "Sales Header" extends "Sales Header"
{
    fields
    {
        field(50000; TrasnporterName; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; MotorVehicleNo; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; ShortClose; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;

            trigger OnValidate()


            begin
                //     IF ShortClose = ShortClose::Yes THEN    //psp
                //         IF CONFIRM('Do You want to Shortclose this Order ?') THEN BEGIN
                //             // Status:=Status::Open;
                //             SaleslINE_rEC.RESET;
                //             SaleslINE_rEC.SETRANGE(SaleslINE_rEC."Document Type", "Document Type");
                //             SaleslINE_rEC.SETRANGE(SaleslINE_rEC."Document No.", "No.");
                //             IF SaleslINE_rEC.FINDFIRST THEN BEGIN
                //                 IF SalesLinerec."Quantity Shipped" <> SalesLinerec."Quantity Invoiced" THEN
                //                     ERROR('Order cannot be short closed because there has been a partial shipment done')
                //                 ELSE BEGIN
                //                     //INC-2018-000806
                //                     SalesLine.RESET;
                //                     SalesLine.SETRANGE("Document No.", "No.");
                //                     // IF SalesLine.FINDFIRST THEN
                //                     //     REPEAT
                //                     //         IndentTrack.RESET;
                //                     //         IndentTrack.SETRANGE(IndentTrack."Indent No.", SalesLine."Indent No.");
                //                     //         IndentTrack.SETRANGE(IndentTrack."Item No.", SalesLine."No.");
                //                     //         IndentTrack.SETRANGE(IndentTrack."Reference Document No.", SalesLine."Document No.");
                //                     //         IndentTrack.SETRANGE(IndentTrack."Entry Type", IndentTrack."Entry Type"::"Sales Order");
                //                     //         IF IndentTrack.FINDFIRST THEN
                //                     //             IndentTrack.DELETE;

                //                     //         IndentTrack.RESET;
                //                     //         IndentTrack.SETRANGE(IndentTrack."Indent No.", SalesLine."Indent No.");
                //                     //         IndentTrack.SETRANGE(IndentTrack."Item No.", SalesLine."No.");
                //                     //         IndentTrack.SETRANGE(IndentTrack."Reference Document No.", SalesLine."Document No.");
                //                     //         IndentTrack.SETRANGE(IndentTrack."Entry Type", IndentTrack."Entry Type"::Indent);
                //                     //         IF IndentTrack.FINDFIRST THEN BEGIN
                //                     //             IndentTrack.Closed := FALSE;
                //                     //             IndentTrack.MODIFY;
                //                     //         END;
                //                     //         SalesLine."Indent No." := '';
                //                     //         SalesLine.MODIFY;
                //                     //     UNTIL SalesLine.NEXT = 0;
                //                     // //INC-2018-000806

                //                     ShortCloseUserId := USERID;
                //                     MODIFY;
                //                     ArchiveManagement.ArchiveSalesDocument(Rec);
                //                     SaleslINE_rEC.DELETEALL;
                //                     DELETE;
                //                     MESSAGE('Order has been deleted.');
                //                 END;
                //             END;
                //         END;
            end;
        }
        field(50003; "Customer Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionMembers = ARIC,Dealer,Distributor,Direct,Stockist,"Project Distributor","Not Active","Sole Distributor",CP,DP,DC,RP;
        }
        field(50004; "Price Code"; Code[20])
        {
            Description = 'New added By SUDIP DSS';
            Editable = false;
            // TableRelation = "Customer Price Group" WHERE("Despatch Location" = FIELD("Location Code"),
            //                                               Status = CONST(ACTIVE)); //psp
        }
        field(50005; InvoiceOfCustomer; Code[20])
        {
            TableRelation = Customer."No.";
            DataClassification = ToBeClassified;
        }
        field(50006; CustInvNo; Code[190])
        {
            Description = 'Reduced from 250 to 240 DSS-VM-25793';

            trigger OnLookup()
            begin
                salesHeader1.RESET;
                salesHeader1.SETFILTER(salesHeader1."Sell-to Customer No.", InvoiceOfCustomer);
                CLEAR(SalesList1);
                SalesList1.SETTABLEVIEW(salesHeader1);
                SalesList1.LOOKUPMODE(TRUE);
                IF SalesList1.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    SalesList1.GETRECORD(salesHeader1);
                    CustInvNo := salesHeader1."No.";
                END;
            end;
        }
        field(50007; ShortCloseUserId; Code[20])
        {
            Description = 'Reduced from 30 to 20 DSS-VM-25793';
        }
        field(50008; "User ID"; Code[50])
        {
            Description = 'DSS-VM-25793, LFS';
            TableRelation = User;
        }
        field(50009; "Web Order"; Boolean)
        {
            Description = 'DSS-VM-WebService';
        }
        field(50010; "Reservation Order"; Boolean)
        {
            Description = 'DSS-VM-27188';
        }
        field(50011; "Reservation Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Vertical Segment"; Code[10])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Vertical Segments"; //psp
        }
        field(50013; ShipToBillToSame; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Web Order Header".ShipToBillToSame WHERE("Web Order No." = FIELD("External Document No.")));

            Editable = false;

        }
        field(50014; "PP No"; Text[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Backward Working"."P.P. No."; //psp
        }
        field(50015; "Price Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,List Price,Special Price ';
            OptionMembers = " ","List Price","Special Price ";

            trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                IF xRec."Price Type" <> "Price Type" THEN BEGIN
                    SalesLine.RESET;
                    SalesLine.SETRANGE(SalesLine."Document Type", "Document Type");
                    SalesLine.SETRANGE(SalesLine."Document No.", "No.");
                    IF SalesLine.FINDSET THEN
                        REPEAT
                            // SalesLine."PP Header No." := '';
                            // SalesLine."PP Special Price" := FALSE;  //psp
                            // SalesLine."PP Line No." := 0;
                            SalesLine.VALIDATE(SalesLine."Unit Price", 0);
                            SalesLine.MODIFY;
                        UNTIL SalesLine.NEXT = 0;
                END;
            end;
        }
        field(50016; "Flooring Customer Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'ARIC,Dealer,Distributor,Direct,Stockist,Project Distributor,Not Active,Sole Distributor,CP,DP,LFCP,LFDP,DC';
            OptionMembers = ARIC,Dealer,Distributor,Direct,Stockist,"Project Distributor","Not Active","Sole Distributor",CP,DP,LFCP,LFDP,DC;
        }
        field(50017; "Total Order Cubage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50018; "Total Order Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50019; Link; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Enabled = true;
            //TableRelation = "Vehicle Master"; //psp
        }
        field(50020; "Transit Document"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        // field(50021; "Location State Code"; Code[10])
        // {
        //     Caption = 'Location State Code';
        //     Editable = false;
        //     //TableRelation = State; //psp
        // }
    }
    procedure CalcInvDiscForHeader()
    var
        SalesInvDisc: Codeunit "60";
    begin
        SalesSetup.GET;
        IF SalesSetup."Calc. Inv. Discount" THEN
            SalesInvDisc.CalculateIncDiscForHeader(Rec);
    end;




    var
        SaleslINE_rEC: Record "Sales Line";
        SalesLinerec: Record "Sales Line";
        salesHeader1: Record "Sales Header";
        SalesList1: Page "Posted Sales Invoices";
}