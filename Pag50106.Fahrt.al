page 50106 Fahrt
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrt;

    layout
    {
        area(Content)
        {
            group(Standard)
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
                field(KMFahrtbeginn; KMFahrtbeginn)
                {
                    ApplicationArea = All;
                }
                field(KMFahrtende; KMFahrtende)
                {
                    ApplicationArea = All;
                }
                field(GefahrenKM; GefahreneKM)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Exportieren als XML")
            {
                Promoted = true;
                PromotedCategory = New;



                trigger OnAction()
                begin
                    Xmlport.Run(50111, false, false);
                end;
            }
            action("XML importieren")
            {
                Promoted = true;
                PromotedCategory = new;

                trigger OnAction()
                begin
                    Xmlport.Run(50113, false, true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}