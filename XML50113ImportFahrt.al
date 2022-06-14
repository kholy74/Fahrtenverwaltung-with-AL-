xmlport 50113 "Import Fahrt"
{
    Format = Xml;
    Direction = Import;

    schema
    {
        textelement(Fahrten)
        {
            tableelement(Fahrt; Fahrt)
            {
                fieldelement(Fahrer; Fahrt.Fahrer)
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
            }
        }
    }



    var
        myInt: Integer;
}