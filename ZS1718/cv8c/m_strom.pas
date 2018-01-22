unit m_strom;
interface
type 
     Prvek = pointer;
     
     TypRelace = function (A, B: Prvek): shortint;
     TypZobraz = function (A: Prvek): string;

     UkUzel = ^Uzel;
     Umisteni=UkUzel;
     Uzel = record
       data: prvek;
       vlevo, vpravo: UkUzel
     end;  

     Strom = record
       Koren: UkUzel;
       Porov: TypRelace;
       Kolik: longword;
     end;  

procedure Start(var S: Strom; R: TypRelace);
procedure Vloz(var S: Strom; P: Prvek);
procedure Vypis(S: Strom; Z: TypZobraz; var F: text);
function Vyhledej(S: Strom; P: Prvek): Umisteni;
function Pocet(S: Strom): longword;
function Hladin(S: Strom): longword;
function Prazdny(S: Strom): boolean;

implementation

procedure Start(var S: Strom; R: TypRelace);
 begin S.Koren:=nil;
       S.Porov:=R;
       S.Kolik:=0
 end;
 
procedure Vloz(var S: Strom; P: Prvek);
 procedure IntVloz(var U: UkUzel);
  begin if U=nil then begin
           Inc(S.Kolik);
           new(U);
           U^.Data:=P;
           U^.Vlevo:=nil;
           U^.Vpravo:=nil
        end else
           if S.Porov(P, U^.Data)=-1 then 
              IntVloz(U^.Vlevo)
           else IntVloz(U^.Vpravo)
  end;
 begin IntVloz(S.Koren)
 end;
 
procedure Vypis(S: Strom; Z: TypZobraz; var F: text);
 procedure Inorder(X: UkUzel);
  begin if X<>nil then begin
           Inorder(X^.vlevo);
           writeln(F, Z(X^.Data));
           Inorder(X^.vpravo);
        end
  end;
 begin Inorder(S.Koren)
 end;
 
function Vyhledej(S: Strom; P: Prvek): Umisteni;
 var Pom: UkUzel;
 begin Pom:=S.Koren;
       while (Pom<>nil) and (S.Porov(P, Pom^.Data)<>0) do
         if S.Porov(P, Pom^.Data)=-1 then Pom:=Pom^.Vlevo
            else Pom:=Pom^.Vpravo;
       Vyhledej:=Pom        
 end;
 
function Pocet(S: Strom): longword;
 begin Pocet:=S.Kolik
 end;
 
function Hladin(S: Strom): longword;
 var Hladina, Max: longword;
 procedure Inorder(X: UkUzel);
  begin if X<>nil then begin
           Inc(Hladina);
           If Hladina>Max then Max:=Hladina;
           Inorder(X^.vlevo);
           Inorder(X^.vpravo);
           Dec(Hladina)
        end
  end;
 begin Hladina:=0; Max:=0;
       Inorder(S.Koren);
       Hladin:=Max
 end;
 
function Prazdny(S: Strom): boolean;
 begin Prazdny:=S.Koren=nil
 end;
 

end.