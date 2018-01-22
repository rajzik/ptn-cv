var C, Soucet: integer;
    Pocet: word;
    a, b, x: integer;
    

begin Pocet:=0; Soucet:=0;
      read(a,b);
      x:=a div b;
      while not seekeof do begin
         read(C);
         inc(Pocet);
         Soucet:=Soucet+C
      end;
      writeln(Soucet/Pocet:10:4)
end.