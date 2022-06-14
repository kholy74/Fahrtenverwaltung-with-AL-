table 50102 "Fahrt"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Fahrer; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where("Frührerschein" = filter(PKW | LKW));

        }
        field(2; Nummer; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(3; Fahrzeug; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Fahrzeug.Kennzeichen;
        }
        field(4; Fahrtbeginn; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Fahrtende; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; ZweckDerFahrt; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; KMFahrtbeginn; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; KMFahrtende; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; GefahreneKM; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Führerschein; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Keinen","PKW","LKW";
            TableRelation = IF (Führerschein = CONST(PKW)) Fahrzeug.Kennzeichen WHERE(Typ = FILTER(Kombi | Transporter)) ELSE
            Fahrzeug.Kennzeichen;
        }

    }

    keys
    {
        key(PK; Fahrer, Nummer)
        {
            Clustered = true;
            SumIndexFields = GefahreneKM;
        }
        key(SK; Fahrtbeginn)
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}