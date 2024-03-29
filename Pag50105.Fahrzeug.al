page 50105 Fahrzeug
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Fahrzeug;
    SourceTableView = sorting(Kennzeichen) order(ascending);

    layout
    {
        area(Content)
        {
            group(Allgemein)
            {
                //  field(Name; NameSource)
                // {
                //     ApplicationArea = All;

                //  }
                field("Kennzeichen"; Kennzeichen)
                {
                    ApplicationArea = All;
                }
                field("Typ"; Typ)
                {
                    ApplicationArea = All;
                }
                field("Hersteller"; Hersteller)
                {
                    ApplicationArea = All;
                }
                field("Modell"; Modell)
                {
                    ApplicationArea = All;
                }
                field("Kraftstoff"; Kraftstoff)
                {
                    ApplicationArea = All;
                }
                field("Kilometerstand"; Kilometerstand)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Fahrt Liste";
                    Editable = false;
                }
                field("Anhängerkupplung"; Anhängerkupplung)
                {
                    ApplicationArea = All;
                }
            }
            group(Abschreibung)
            {

                field("Kaufpreis"; Kaufpreis)
                {
                    ApplicationArea = All;
                }
                field("Kaufdatum"; Kaufdatum)
                {
                    ApplicationArea = All;
                }
                field("Afa-Methode"; "Afa-Methode")
                {
                    ApplicationArea = All;
                }
                field("Restbuchwert"; Restbuchwert)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Abschreibung Liste";
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Fahrzeuge Importieren")
            {
                Promoted = true;
                PromotedCategory = New;


                trigger OnAction()
                begin
                    Xmlport.Run(50112, false, true);
                end;
            }
            action("Restbuchwert berechnen")
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CashReceiptJournal;
                trigger OnAction()

                begin

                    case "Afa-Methode" of
                        "Afa-Methode"::linear:
                            AFA.Linear(Kennzeichen);
                        "Afa-Methode"::degressiv:
                            AFA.Degressiv(Kennzeichen);
                        "Afa-Methode"::kombiniert:
                            AFA.Kombiniert(Kennzeichen);
                        "Afa-Methode"::leistungsabh:
                            AFA."Leistungsabhängig"(Kennzeichen);
                    end;

                end;
            }
        }
    }

    var
        "AFa-Methode": Option linear,degressiv,kombiniert,leistungsabh;
        AFA: Codeunit Afa;

}