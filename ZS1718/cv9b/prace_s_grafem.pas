{Implementujte obecný graf. Ze standardního vstupu přidejte uzly a hrany
s potřebnými informacemi. Graf uložte do souboru bez udání typu. Jméno
výstupního souboru přečtěte z prvního parametru příkazového řádku.
Graf vykreslete do zvoleného vektorového formátu.
}

uses m_graf;

type InfOUzlu = record
       Id: longword;
       X, Y: longint
     end;  
     
     InfOHrane = record
       U1, U2: longword;
       Hodnota: string;
     end;

var Co: char;
    UI: InfOUzlu;
    HI: InfOHrane;
    U, V: Uzel;
    E: Evaluace;
    Soubor: file;
    NazevSouboru: string;
    
    G: Graf;

procedure CtiUzel(var X: InfOUzlu);
 begin readln(X.Id, X.X, X.Y)
 end;
 
procedure CtiHranu(var X: InfOHrane);
 begin readln(X.U1, X.U2, X.Hodnota[1], X.Hodnota)
 end; 

begin G.Init;
      while not eof do begin
        read(Co);
        if Co='u' then begin
           CtiUzel(UI);
           GetMem(U, SizeOf(UI));
           InfOUzlu(U^):=UI;
           G.PridejUzel(U)
        end;
        if Co='h' then begin
           CtiHranu(HI);
           GetMem(U, sizeof(longword));
           longword(U^):=HI.U1;
           GetMem(V, sizeof(longword));
           longword(V^):=HI.U2;
           getMem(E, sizeof(string));
           string(E^):=Hi.hodnota;
           G.PridejHranu(U, V, E);
        end
      end;
      NazevSouboru:=ParamStr(1);
      if NazevSouboru='' then NazevSouboru:='graf.dta');
      Assign(Soubor, NazevSouboru);
      rewrite(Soubor, 1);
      G.VypisBUT(Soubor);
      Close(Soubor);
      
      G.Vykresli(output);
end.