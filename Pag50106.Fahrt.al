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
                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.Get(Fahrer);
                        "Führerschein" := Employee."Frührerschein";
                    end;

                }
                field(Nummer; Nummer)
                {
                    ApplicationArea = All;
                }
                field(Fahrzeug; Fahrzeug)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        KFZ: Record Fahrzeug;
                    begin
                        KFZ.Get(Fahrzeug);
                        KFZ.CalcFields(Kilometerstand);
                        KMFahrtbeginn := KFZ.Kilometerstand;
                    end;

                }
                field(Fahrtbeginn; Fahrtbeginn)
                {

                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        FahrtenKFZ: Record Fahrt;
                    begin
                        FahrtenKFZ.SetRange(Fahrzeug, Fahrzeug);
                        if FahrtenKFZ.Find('-') then
                            repeat
                                if Fahrtbeginn = FahrtenKFZ.Fahrtbeginn then
                                    Error('Die Fahrt wurde schon erfasst!');
                            until FahrtenKFZ.Next() = 0;

                    end;
                }
                field(Fahrtende; Fahrtende)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Fahrtbeginn > Fahrtende then
                            Error('Das Fahrtende liegt vor dem Fahrtbeginn!');
                    end;
                }
                field(ZweckDerFahrt; ZweckDerFahrt)
                {
                    ApplicationArea = All;
                }
                field(KMFahrtbeginn; KMFahrtbeginn)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(KMFahrtende; KMFahrtende)
                {
                    ApplicationArea = All;
                    trigger OnValidate()

                    begin
                        if "KMFahrtende" > "KMFahrtbeginn" then
                            "GefahreneKM" := "KMFahrtende" - "KMFahrtbeginn"
                        else
                            Error('Ungültige Eingabe');

                    end;
                }
                field(GefahrenKM; GefahreneKM)
                {
                    ApplicationArea = All;
                    Editable = false;
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