unit m_strom_obj;
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

     Strom = object
       Koren: UkUzel;
       Porov: TypRelace;
       Kolik: longword;
       constructor Start(R: TypRelace);
       procedure Vloz(P: Prvek); virtual;
       procedure Vypis(Z: TypZobraz; var F: text);
       function Vyhledej(P: Prvek): Umisteni;
       function Pocet: longword;
       function Hladin: longword;
       function Prazdny: boolean;
     end;  

     UnikStrom = object(Strom)
       constructor Start(R: TypRelace);
       procedure Vloz(P: Prvek); virtual;
     end;
     
     
     
implementation

constructor Strom.Start(R: TypRelace);
 begin Koren:=nil;
       Porov:=R;
       Kolik:=0
 end;
 
constructor UnikStrom.Start(R: TypRelace);
 begin inherited Start(R)
 end;

procedure Strom.Vloz(P: Prvek);
 procedure IntVloz(var U: UkUzel);
  begin if U=nil then begin
           Inc(Kolik);
           new(U);
           U^.Data:=P;
           U^.Vlevo:=nil;
           U^.Vpravo:=nil
        end else
           if Porov(P, U^.Data)=-1 then 
              IntVloz(U^.Vlevo)
           else IntVloz(U^.Vpravo)
  end;
 begin IntVloz(Koren)
 end;

procedure UnikStrom.Vloz(P: Prvek);
 var U: Umisteni;
 begin U:=Vyhledej(P);
       // možnost pracovat s U^
       if U=nil then inherited Vloz(P)
 end;
 
procedure Strom.Vypis(Z: TypZobraz; var F: text);
 procedure Inorder(X: UkUzel);
  begin if X<>nil then begin
           Inorder(X^.vlevo);
           writeln(F, Z(X^.Data));
           Inorder(X^.vpravo);
        end
  end;
 begin Inorder(Koren)
 end;
 
function Strom.Vyhledej(P: Prvek): Umisteni;
 var Pom: UkUzel;
 begin Pom:=Koren;
       while (Pom<>nil) and (Porov(P, Pom^.Data)<>0) do
         if Porov(P, Pom^.Data)=-1 then Pom:=Pom^.Vlevo
            else Pom:=Pom^.Vpravo;
       Vyhledej:=Pom        
 end;
 
function Strom.Pocet: longword;
 begin Pocet:=Kolik
 end;
 
function Strom.Hladin: longword;
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
       Inorder(Koren);
       Hladin:=Max
 end;
 
function Strom.Prazdny: boolean;
 begin Prazdny:=Koren=nil
 end;
 

end.