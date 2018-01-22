var Pocet: longword;
    cislo, soucet: real;
    
begin Pocet:=0; Soucet:=0;
      while not seekeof do begin
        read(cislo); Inc(Pocet);
        Soucet+=Cislo
      end;
      writeln('Průměr je: ', soucet/pocet:0:4)
end.    