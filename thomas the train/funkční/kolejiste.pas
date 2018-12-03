uses mptvlaky, mzjisti, mtypy;

var V: VarZaznam;
    H: UkPolozka;
    Id: word;
    ZadNazev, ZadHodnota, ZadVysl, PozadPar: string;
    
procedure PrectiPar(var ZadNazev, ZadHodnota, ZadVysl, PozadPar: string);
 begin ZadNazev:=ParamStr(1);
       ZadHodnota:=ParamStr(2);
       ZadVysl:=ParamStr(3);
       PozadPar:=ParamStr(4);
 end;

begin PrectiPar(ZadNazev, ZadHodnota, ZadVysl, PozadPar);
      ZiskejData('data.bin', 'bloky', 0);
      ZpracujSoubor('data.bin', H);
      Vyhledej(H, ZadNazev, ZadHodnota, ZadVysl, V);
      Id:=V.cele;
      ZiskejData('data.bin', 'blokStav', Id);
      ZpracujSoubor('data.bin', H);
      Vyhledej(H, ZadVysl, V.Retez, PozadPar, V);
      if V.retez='+' then V.retez:='-' else V.retez:='+';
      PosliData('blokStav', Id, PozadPar, V);
end.