tableextension 50140 Tab5200 extends Employee
{
    fields
    {
        field(50000; "Frührerschein"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Keinen","PKW","LKW";
        }
    }
    var
        myInt: Integer;
}