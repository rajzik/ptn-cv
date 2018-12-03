uses mptvlakyo, mzjisti, mtypy;

var V: VarZaznam;
    H: UkPolozka;
    Adresa: word;
    ZadNazev, ZadHodnota, ZadVysl, PozadPar: string;
    
procedure PrectiPar(var ZadNazev, ZadHodnota, ZadVysl, PozadPar: string);
 begin ZadNazev:=ParamStr(1);
       ZadHodnota:=ParamStr(2);
       ZadVysl:=ParamStr(3);
       PozadPar:=ParamStr(4);
 end;

begin PrectiPar(ZadNazev, ZadHodnota, ZadVysl, PozadPar);
      ZiskejData('data.bin', 'loks', 0);
      ZpracujSoubor('data.bin', H);
      Vyhledej(H, ZadNazev, ZadHodnota, ZadVysl, V);
      Adresa:=V.cele;
      writeln(adresa);
      ZiskejData('data.bin', 'lokStav', Adresa);
      ZpracujSoubor('data.bin', H);
      Vyhledej(H, ZadVysl, V.Retez, PozadPar, V);
      if V.cele=0 then V.cele:=14 else V.cele:=0;
      PosliData('lokStav', Adresa, PozadPar, V);
end.