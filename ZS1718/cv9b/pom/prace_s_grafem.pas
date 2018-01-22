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

function RovnyUzly(A, B: Uzel): boolean;
 begin RovnyUzly:=InfOUzlu(A^).Id = InfOUzlu(B^).Id
 end;
 
function IntToStr(X: longint): string;
 var Pom: String;
 begin Str(X, Pom);
       IntToStr:=Pom
 end;

function VykUzel(A: Uzel): string;
 var IU: InfOUzlu;
 begin IU:=InfOUzlu(A^);
       VykUzel:='\circle{'+IntToStr(IU.X)+','+IntToStr(IU.Y)+','+IntToStr(IU.Id)+'} ';
 end; 

function VykHrana(A, B: Uzel; E: Evaluace): string;
 var IU1, IU2: InfOUzlu;
 begin IU1:=InfOUzlu(A^); IU2:=InfOUzlu(B^);
       VykHrana:='\vector{'+IntToStr(IU1.X)+','+IntToStr(IU1.Y)+
                  ','+IntToStr(IU2.X)+','+IntToStr(IU2.Y)+'} \put{'
                  +string(E^)+'}';
 end;

procedure BUzel(var F: file; U: Uzel);
 const X: byte = 0; // informace o uzlu: identifikační byte = 0
 begin blockwrite(F, X, 1);
       blockwrite(F, U^, sizeof(infOUzlu));
 end;
 
procedure BHrana(var F: file; A, B: Uzel; E: Evaluace);
 const X: byte = 1; // informace o uzlu: identifikační byte = 1
 begin blockwrite(F, X, 1);
       blockwrite(F, A^, sizeof(longword));
       blockwrite(F, B^, sizeof(longword));
       blockwrite(F, E^, Length(string(E^))+1);
 end;

begin G.Init(@RovnyUzly);
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
      if NazevSouboru='' then NazevSouboru:='graf.dta';
      Assign(Soubor, NazevSouboru);
      rewrite(Soubor, 1);
      G.VypisBUT(Soubor, @BUzel, @BHrana);
      Close(Soubor);
      
      G.Vykresli(output, @VykUzel, @VykHrana);
end.