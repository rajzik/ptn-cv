{ Vstup: řada čísel. Vypočtěte průměrnou hodnotu vstupních čísel. }

var C, Soucet: real;
    Pocet: word;

begin Soucet:=0;
      Pocet:=0;
      while not eof do begin
         read(C);
         Soucet:=Soucet+C;
         Inc(Pocet)
      end;
      writeln('Průměr je: ', Soucet/Pocet:7:2)
end.      