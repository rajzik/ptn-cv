{Implementujte binární strom s obecnými položkami. Uspořádání:
levý < rodič <= pravý.

Varianta:
Do stromu se ukládají pouze unikátní hodnoty.
}


unit mod_strom;
interface
type Prvek = pointer;
     UkUzel= ^Uzel;
     uzel= record
       data: Prvek;
       vlevo, vpravo: UkUzel
     end;
     
     TypVetsi = function (A, B: Prvek): boolean;
     TypRovno = function (A, B: Prvek): boolean;
     TypZobraz = function (A: Prvek): string;
          
     Strom=ukuzel;
     
procedure Start(var S: strom);
procedure Vloz(var S: strom; X: Prvek; A: TypVetsi; R: TypRovno);
procedure Inorder(S: Strom; var T: text; Jak: TypZobraz);
function Prazdny(S: Strom): boolean;
function Hloubka(S: Strom): longword;
function Vyhledej(S: Strom; X: Prvek; Je: TypRovno; Vetsi: TypVetsi): boolean;

implementation

procedure Start(var S: strom);
 begin S:=nil
 end;
 
function Vyhledej(S: Strom; X: Prvek; Je: TypRovno; Vetsi: TypVetsi): boolean;
 var Pom: UkUzel;
 begin Pom:=S;
       while (Pom<>nil) and not Je(Pom^.Data, X) do
         if Vetsi(Pom^.Data, X) then Pom:=Pom^.Vlevo
            else Pom:=Pom^.vpravo;
       Vyhledej:=Pom<>nil     
 end;
 
procedure Vloz(var S: strom; X: Prvek; A: TypVetsi; R: TypRovno);
 begin 
       if not Vyhledej(S, X, R, A) then begin
         if S=nil then begin
          new(S);
          S^.Data:=X;
          S^.vlevo:=nil;
          S^.vpravo:=nil
         end else 
          if A(S^.Data, X) then Vloz(S^.vlevo, X, A, R)
             else Vloz(S^.vpravo, X, A, R)
       end       
 end;
 
procedure Inorder(S: Strom; var T: text; Jak: TypZobraz);
 begin if S<>nil then begin
          Inorder(S^.vlevo, T, Jak);
          writeln(Jak(S^.Data));
          Inorder(S^.vpravo, T, Jak)
       end
 end;
 
function Prazdny(S: Strom): boolean;
 begin Prazdny := S=nil
 end;
 
function Hloubka(S: Strom): longword;
 var Max, Akt: longword;

 procedure Projdi(X: Strom);
  begin if X<>nil then begin
           Inc(Akt);
           if Akt>Max then Max:=Akt;
           Projdi(X^.vlevo);
           Projdi(X^.vpravo);
           Dec(Akt)
        end;
  end;
  
 begin Max:=0; Akt:=0;
       Projdi(S);
       Hloubka:=Max
 end; 
 
end.