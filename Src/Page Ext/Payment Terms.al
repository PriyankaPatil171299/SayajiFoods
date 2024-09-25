pageextension 60000 "Payment Terms" extends "Payment Terms"
{
    layout
    {
        addafter(Description)
        {
            field("Show in Web Order list"; Rec."Show in Web Order list")
            {
                ApplicationArea = all;
            }
        }
    }

}