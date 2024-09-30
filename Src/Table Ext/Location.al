tableextension 60003 "Location" extends Location
{
    fields
    {
        field(50000; "Show in Web Order list"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Incremental %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}