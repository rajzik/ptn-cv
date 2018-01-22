{Implementujte abstraktní datový typ Vyhledávací tabulka pomocí stromového
hledání a pomocí tabulky s rozptýlenými hesly.  Obě implementace vytvořte
pro práci s libovolnými daty.  Vložte do struktury slova získaná ze
vstupního textu, u slov zaznamenejte počet jejich výskytů.  Analyzujte
chování obou implementací se stejnými daty a porovnejte je.
}

uses m_vyhl_tab, slova;

type 
     TypData = record
       Slovo: string;
       Vyskytu: longword;
     end;

var R: string;
    VT: VyhlTab;
    P: Prvek;
    Kde: Umisteni;
    
function Usporadej(A, B: Prvek): shortint;    
 begin if Typdata(A^).Slovo<TypData(B^).Slovo then 
          Usporadej:=-1
       else if TypData(A^).Slovo=TypData(B^).Slovo then
          Usporadej:=0
       else Usporadej:=1
 end;
 
function Rozptyl(P: Prvek): Indexy;
 var R: string; Soucet: longword; I: byte;
 begin R:=Typdata(P^).Slovo;
       if R='' then Rozptyl:=1
       else begin
         Soucet:=1;
         for I:=1 to Length(R) do Soucet:=Soucet+I*ord(R[I]);
         Rozptyl:=Soucet mod Max + 1
       end
 end;
 
begin
      VT.Zacni(@Usporadej, @Rozptyl);
      while not eof do begin
        R:=DejSlovo(input);
        // Výroba prvku do tabulky
        getmem(P, SizeOf(TypData));
        TypData(P^).Slovo:=R;
        TypData(P^).Vyskytu:=1;
        Kde:=VT.Hledej(P);
        if Kde=nil then VT.Vloz(P)
        else begin // úprava počtu výskytů
           FreeMem(P, SizeOf(TypData));
           inc(TypData(Kde^).Vyskytu)
        end
      end;
      VT.Analyza(output)
end.