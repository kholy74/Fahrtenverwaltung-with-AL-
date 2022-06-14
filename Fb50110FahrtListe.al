page 50110 "Fahrt List Factbox"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Fahrtbeginn; Fahrtbeginn)
                {
                    ApplicationArea = All;

                }
                field(ZweckDerFahrt; ZweckDerFahrt)
                {
                    ApplicationArea = All;

                }
                field(GefahreneKM; GefahreneKM)
                {
                    ApplicationArea = All;

                }
            }
        }

    }


}