table 60001 "Price Code Selection"
{
    // DSS-VM-27188 : Extra Type added in Document Type {Reserv. Order}

    // DrillDownPageID = 50180; //psp
    // LookupPageID = 50180; //psp

    fields
    {
        field(1; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(2; "Location Code"; Code[20])
        {
            TableRelation = Location;
        }
        field(3; "ARIC Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(4; "Project Distributor Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(5; "Stocklist Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(6; "Dealer Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(7; "Direct Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(8; "Sole Distributor Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(9; "Distributor Price Code"; Code[20])
        {
            TableRelation = "Customer Price Group";
        }
        field(10; Type; Option)
        {
            OptionCaption = 'Cieling,Flooring';
            OptionMembers = Cieling,Flooring;
        }
        field(11; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,,,,,,,Reserv. Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",,,,,,,"Reserv. Order";
        }
    }

    keys
    {
        key(Key1; "No. Series", "Location Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

