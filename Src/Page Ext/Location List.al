pageextension 60001 "Location" extends "Location List"
{
    layout
    {
        addafter(Name)
        {
            field("Use As In-Transit"; Rec."Use As In-Transit")
            {
                ApplicationArea = all;
            }
            field("Show in Web Order list"; Rec."Show in Web Order list")
            {
                ApplicationArea = all;
            }
            field(City; Rec.City)
            {
                ApplicationArea = all;
                Visible = false;
            }
            field("Incremental %"; Rec."Incremental %")
            {
                ApplicationArea = all;
            }
        }
    }

}