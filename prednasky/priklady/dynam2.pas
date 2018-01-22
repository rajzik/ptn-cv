{ varianta zásobníku: vkládají se pouze unikátní hodnoty. }

type UkPrvek = ^Prvek;
     Prvek = record
       data: pointer;
       nasl: UkPrvek
     end;
     
     TypPorovnani = function (A, B: pointer): boolean;
     
procedure Init(var V: UkPrvek);
 begin V:=nil
 end;
 
function Found(V: UkPrvek; D: pointer; Nerovno: TypPorovnani): boolean;
 begin while (V<>nil) and Nerovno(V^.data,D) do 
          V:=V^.nasl;
       Found:=V<>nil   
 end; 
 
procedure Push(var V: UkPrvek; D: pointer; Jak: TypPorovnani);
 var Pom: UkPrvek;
 begin if not Found(V, D, Jak) then begin 
          new(Pom);
          Pom^.data:=D;
          Pom^.nasl:=V;
          V:=Pom
       end   
 end;
 
function Empty(V: UkPrvek): boolean;
 begin Empty:=V=nil
 end;

function Pop(var V: UkPrvek): pointer;
 var Pom: UkPrvek;
 begin if not Empty(V) then begin
         Pop:=V^.data;
         Pom:=V;
         V:=V^.nasl;
         dispose(Pom)
       end else Pop:=nil
 end;
 
{====================================================================}

var Vrchol: UkPrvek;
    R: string;
    Z: char;
    P: pointer;

{ vstup: souvislý text po řádcích; výstup: znaky v obráceném pořadí...}

function MojePorovnani(X, Y: pointer): boolean;
 begin MojePorovnani:= char(X^)<>char(Y^)
 end;

begin Init(Vrchol);
      while not eof do begin
         read(Z);
         getmem(P, 1);
         char(P^):=Z;
         Push(Vrchol, P, @MojePorovnani);
      end;
      writeln;
      while not empty(vrchol) do begin
         P:=Pop(Vrchol);
         write(char(P^))
      end;
      writeln
      
end.         
 
 
 
 
 
 
 