unit m_strom_obj;
interface

type
     Prvek = pointer;
     
     UkUzel = ^Uzel;
     Uzel = record
       Data: Prvek;
       Vlevo, Vpravo: UkUzel
     end;  

     TypRelace = function (A, B: Prvek): shortint;
     TypZobraz = function (P: Prvek): string;

     Strom = object
       Koren: UkUzel;
       Relace: TypRelace;
       
       constructor Start(R: TypRelace);
       procedure Vloz(P: Prvek); virtual;
       procedure Inorder(var T: text; Z: TypZobraz);
       function Vyhledej(P: Prvek): boolean;
       function Prazdny: boolean;
       function Hloubka: longword;     
     end;


implementation

constructor Strom.Start(R: TypRelace);
 begin Koren:=nil;
       Relace:=R;
 end;
 
procedure Strom.Vloz(P: Prvek);
 procedure Vnitrek(var U: UkUzel);
  begin if U=nil then begin
           new(U);
           U^.Data:=P;
           U^.Vlevo:=nil;
           U^.Vpravo:=nil
        end else 
           if Relace(P, U^.Data)=-1 
              then Vnitrek(U^.Vlevo)
              else Vnitrek(U^.Vpravo)
  end;
 begin Vnitrek(Koren)
 end;
 
procedure Strom.Inorder(var T: text; Z: TypZobraz);
 procedure Vnitrek(U: UkUzel);
  begin if U<>nil then begin
          Vnitrek(U^.Vlevo);
          writeln(T, Z(U^.Data));
          Vnitrek(U^.Vpravo)
        end
  end;
 begin Vnitrek(Koren)
 end;
 
function Strom.Vyhledej(P: Prvek): boolean;
 var Pom: UkUzel;
 begin Pom:=Koren;
       while (Pom<>nil) and (Relace(P, Pom^.Data)<>0) do
          if Relace(P, Pom^.Data)=-1 then
             Pom:=Pom^.Vlevo
             else Pom:=Pom^.Vpravo;
       Vyhledej:=Pom<>nil;             
 end;
 
function Strom.Prazdny: boolean;
 begin Prazdny:=Koren=nil
 end;
 
function Strom.Hloubka: longword;     
 var Max, Akt: longword;

 procedure Projdi(X: UkUzel);
  begin if X<>nil then begin
           Inc(Akt);
           if Akt>Max then Max:=Akt;
           Projdi(X^.vlevo);
           Projdi(X^.vpravo);
           Dec(Akt)
        end;
  end;
  
 begin Max:=0; Akt:=0;
       Projdi(Koren);
       Hloubka:=Max
 end; 
 
end.