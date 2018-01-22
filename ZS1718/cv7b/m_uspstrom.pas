unit m_uspstrom;
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
     
     Strom = record
       Koren: UkUzel;
       Srov: TypSrovnej;
     end;
     
procedure Start(var S: strom; Srov: TypSrovnej);
procedure Vloz(var S: Strom; X: Prvek);
procedure Vypis(S: Strom; Jak: TypZobraz; var T: text);
function Pocet(S: Strom): longword;
function Hladin(S: Strom): longword;


implementation

procedure Start(var S: strom; Srov: TypSrovnej);
 begin S.Koren:=nil;
       S.Srov:=Srov
 end;
 
procedure Vloz(var S: Strom; X: Prvek);
 procedure TInsert(var U: UkUzel);
  begin if U=nil then begin
           new(U);
           U^.data:=X;
           U^.vlevo:=nil;
           U^.vpravo:=nil
        end else 
           if S.Srov(X, U^.Data)<=0 then TInsert(U^.vlevo)
              else TInsert(U^.vpravo)
  end;
  
 begin TInsert(S.Koren)
 end;
 
procedure Vypis(S: Strom; Jak: TypZobraz; var T: text);

 procedure Inorder(U: UkUzel);
  begin if U<>nil then begin
           Inorder(U^.vlevo);
           Jak(U^.Data, T);
           Inorder(U^.vpravo)
        end
  end;
  
 begin 
       inorder(S.Koren)
 end;
 
function Pocet(S: Strom): longword;
 var P: longword;
 procedure Inorder(U: UkUzel);
  begin if U<>nil then begin
           Inorder(U^.vlevo);
           Inc(P);
           Inorder(U^.vpravo)
        end
  end;
 begin P:=0;
       Inorder(S.Koren);
       Pocet:=P
 end;
 
function Hladin(S: Strom): longword;
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
       Inorder(S.Koren);
       Hladin:=Max
 end;

end.