{Implementujte abstraktní datový typ Vyhledávací tabulka pomocí stromového
hledání a pomocí tabulky s rozptýlenými hesly.  Obě implementace vytvořte
pro práci s libovolnými daty.  Vložte do struktury slova získaná ze
vstupního textu, u slov zaznamenejte počet jejich výskytů.  Analyzujte
chování obou implementací se stejnými daty a porovnejte je.
}

uses m_vyhl_tab, slova;

type TypData = record
       Slovo: string;
       Vyskytu: longword;
     end;

var R: string;
    VT: VyhlTab;
    Kde: Umisteni;
    P: Prvek;

function Usporadani(A, B: Prvek): shortint;
 begin if TypData(A^).Slovo<Typdata(B^).Slovo then
          Usporadani:=-1
          else if TypData(A^).Slovo=TypData(B^).Slovo then
             Usporadani:=0
             else Usporadani:=1
 end;

function MujHash(X: Prvek): Indexy;
 var R: string; I: byte; S: LongWord;
 begin R:=TypData(X^).Slovo;
       if R='' then MujHash:=1
       else begin
         S:=0;
         for I:=1 to Length(R) do S:=S+ord(R[I]);
         MujHash:=S mod Max + 1
       end;
 end;

begin VT.Zacni(@Usporadani, @MujHash);
      while not eof do begin
        R:=DejSlovo(input);
        // vytvoření dat P
        getmem(P, SizeOf(Typdata));
        TypData(P^).Slovo:=R;
        TypData(P^).Vyskytu:=1;
        Kde:=VT.Hledej(P);
        if Kde=nil then VT.Vloz(P)
        else begin // zvýšení počtu výskytů
                Freemem(P, SizeOf(TypData));
                Inc(TypData(Kde^).vyskytu)
        end
      end;
      VT.Analyza(output)
end.