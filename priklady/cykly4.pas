var Prvni, cislo: integer; 

begin read(prvni);
      read(cislo);
      while cislo<>-999 do begin
        if odd(cislo) and odd(prvni) then write(Cislo);
        if not odd(cislo) and not odd(prvni) then write(Cislo);
        read(cislo)
      end  
end.