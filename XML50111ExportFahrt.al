
xmlport 50111 ExportFahrt
{

    Format = Xml;
    Direction = Export;
    schema
    {
        textelement(Fahrten)
        {
            tableelement(Fahrt; Fahrt)
            {
                fieldelement(Fahrer; Fahrt.Fahrer)
                {

                }
                fieldelement(Nummer; Fahrt.Nummer)
                {

                }
                fieldelement(Fahrzeug; Fahrt.Fahrzeug)
                {

                }

                fieldelement(Fahrtbeginn; Fahrt.Fahrtbeginn)
                {

                }
                fieldelement(Fahrtende; Fahrt.Fahrtende)
                {

                }
                fieldelement(ZweckDerFahrt; Fahrt.ZweckDerFahrt)
                {

                }
                fieldelement(KMFahrtbeginn; Fahrt.KMFahrtbeginn)
                {

                }
                fieldelement(KMFahrtende; Fahrt.KMFahrtende)
                {

                }
                fieldelement(GefahreneKM; Fahrt.GefahreneKM)
                {

                }
                fieldelement(Führerschein; Fahrt.Führerschein)
                {

                }

            }

        }
    }
}