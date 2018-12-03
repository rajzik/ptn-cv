unit mtypy;
interface
type
     UkPolozka = ^Polozka;
     UkHodnota = ^Hodnota;

     TypUdaj=(typretez, typcele, typrealne, typlogik, typpole, typobjekt);

     VarZaznam = record
       case Udaj: TypUdaj of
        typretez:  (retez: string);
        typcele:   (cele: word);
        typrealne: (realne: single);
        typlogik:  (logik: boolean);
        typpole:   (pole: UkHodnota);
        typobjekt: (objekt: UkPolozka);
     end;
     
     Polozka = record
       Nazev: string;
       Hodn:  VarZaznam;
       Dalsi: UkPolozka
     end;  

     Hodnota = record
        Hodn:  VarZaznam;
        Dalsi: UkHodnota
     end;
                                                                      
implementation
end.