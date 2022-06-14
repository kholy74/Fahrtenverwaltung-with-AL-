page 50108 "Fahrt Liste"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Fahrt;
    Editable = false;
    SourceTableView = sorting(Fahrtbeginn) order(ascending);
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Fahrer; Fahrer)
                {
                    ApplicationArea = All;

                }
                field(Nummer; Nummer)
                {
                    ApplicationArea = All;

                }
                field(Fahrzeug; Fahrzeug)
                {
                    ApplicationArea = All;

                }
                field(Fahrtbeginn; Fahrtbeginn)
                {
                    ApplicationArea = All;

                }
                field(Fahrtende; Fahrtende)
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
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(Karte)
            {
                ApplicationArea = All;
                RunObject = page Fahrt;
                RunPageLink = Nummer = field(Nummer);
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = AnalysisView;
                trigger OnAction();
                begin

                end;
            }
        }
    }
}