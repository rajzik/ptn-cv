{Na vstupu počítače je řada reálných čísel zakončená nulou. Opište na výstup
všechny vstupní hodnoty a za nimi všechny vstupní hodnoty vydělené maximální
hodnotou.

Příklad vstupu:
2.5 10 7.8 0
Očekávaný výstup:
2.5 10 7.8
0.25 1.00 0.78

Předpokládejte, že počet vstupních čísel nepřesahuje sto tisíc.}

const MaxCisel = 100000;
type Indexy = 1..MaxCisel;
     Indexy0 = 0..MaxCisel;
     Cisla = array [1..MaxCisel] of real;
var C: Cisla;
    R, Max: real;
    I, J: Indexy0;
begin I:=0;
      read(R); Max:=R;
      while R<>0 do begin
        inc(I);
        C[I]:=R; 
        if R>Max then Max:=R;
        read(R)
      end;  
      for J:=1 to I do 
         write(C[J]:7:2);
      writeln;
      for J:=1 to I do
         write(C[J]/Max:7:2);
      writeln
end.      