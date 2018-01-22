unit m_uspstrom_obj;
interface
type 
     Prvek = pointer;
     
     TypSrovnej = function (A, B: Prvek): shortint;
     TypZobraz = procedure (A: Prvek; var T: text);
     
     UkUzel = ^Uzel;
     Uzel = record
       data: Prvek;
       vlevo, vpravo: UkUzel
     end;  
     
     Strom = object
       Koren: UkUzel;
       Srov: TypSrovnej;
       constructor Start(S: TypSrovnej);
       procedure Vloz(X: Prvek); virtual;
       procedure Vypis(Jak: TypZobraz; var T: text); virtual;
       function Pocet: longword;
       function Hladin: longword;
     end;

     UnikStrom = object(Strom)
       constructor Start(S: TypSrovnej);
       procedure Vloz(X: Prvek); virtual;
     end;

     ObratStrom = object(UnikStrom)
       constructor Start(S: TypSrovnej);
       procedure Vypis(Jak: TypZobraz; var T: text); virtual;
     end;
     
implementation

constructor Strom.Start(S: TypSrovnej);
 begin Koren:=nil;
       Srov:=S
 end;
 
constructor UnikStrom.Start(S: TypSrovnej);
 begin inherited Start(S)
 end;
 
constructor ObratStrom.Start(S: TypSrovnej);
 begin inherited Start(S)
 end;
 
procedure Strom.Vloz(X: Prvek);
 procedure TInsert(var U: UkUzel);
  begin if U=nil then begin
           new(U);
           U^.data:=X;
           U^.vlevo:=nil;
           U^.vpravo:=nil
        end else 
           if Srov(X, U^.Data)<=0 then TInsert(U^.vlevo)
              else TInsert(U^.vpravo)
  end;
  
 begin TInsert(Koren)
 end;
 
procedure UnikStrom.Vloz(X: Prvek);
 function Nalezeno(P: Prvek): boolean;
  var Pom: UkUzel;
  begin Pom:=Koren;
        while (Pom<>nil) and (Srov(P, Pom^.Data)<>0) do
           if Srov(P, Pom^.Data)=-1 then Pom:=Pom^.Vlevo
              else Pom:=Pom^.Vpravo;
        Nalezeno:=Pom<>nil      
  end;
 begin if not Nalezeno(X) then inherited Vloz(X)
 end;
 
procedure Strom.Vypis(Jak: TypZobraz; var T: text);

 procedure Inorder(U: UkUzel);
  begin if U<>nil then begin
           Inorder(U^.vlevo);
           Jak(U^.Data, T);
           Inorder(U^.vpravo)
        end
  end;
  
 begin 
       inorder(Koren)
 end;
 
procedure ObratStrom.Vypis(Jak: TypZobraz; var T: text);

 procedure Inorder(U: UkUzel);
  begin if U<>nil then begin
           Inorder(U^.vpravo);
           Jak(U^.Data, T);
           Inorder(U^.vlevo)
        end
  end;
  
 begin 
       inorder(Koren)
 end;
 
function Strom.Pocet: longword;
 var P: longword;
 procedure Inorder(U: UkUzel);
  begin if U<>nil then begin
           Inorder(U^.vlevo);
           Inc(P);
           Inorder(U^.vpravo)
        end
  end;
 begin P:=0;
       Inorder(Koren);
       Pocet:=P
 end;
 
function Strom.Hladin: longword;
 var Max, Akt: longword;
 procedure Inorder(U: UkUzel);
  begin if U<>nil then begin
           Inc(Akt);
           if Akt>Max then Max:=Akt;
           Inorder(U^.vlevo);
           Inorder(U^.vpravo);
           Dec(Akt)
        end
  end;
 begin Max:=0; Akt:=0;
       Inorder(Koren);
       Hladin:=Max
 end;

end.