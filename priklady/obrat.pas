uses Modul_zasobnik;

type Osoba=record
       oscislo: string[5];
       plat: longint
     end;
     
     UkOsoba = ^Osoba;

var H: hodnota;
    Z: Zasobnik;
    Clovek: UkOsoba;

function Zjisti(X, Y: Hodnota): boolean;
 begin Zjisti:=UkOsoba(X)^.oscislo<>UkOsoba(Y)^.oscislo
 end;

begin Z_Init(Z, @Zjisti); {konstruktor zásobníku}
      while not eof do begin
        {přečtení hodnoty H:}
        new(Clovek);
        readln(Clovek^.oscislo, Clovek^.plat);
        H:=Hodnota(Clovek);
        Z_Push(Z, H); {vložení do zásobníku}
      end;
      while not Z_Empty(Z) {neprázdný zásobník} do begin
        Z_Pop(Z, H);{výběr vrcholu zásobníku do H}
        {výpis H na standardní výstup:}
        with UkOsoba(H)^ do
             writeln(oscislo, plat:7)
      end  
end.