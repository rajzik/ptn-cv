type UkPrvek = ^Prvek;
     Prvek = record
       data: pointer;
       nasl: UkPrvek
     end;
     
procedure Init(var V: UkPrvek);
 begin V:=nil
 end;
 
procedure Push(var V: UkPrvek; D: pointer);
 var Pom: UkPrvek;
 begin new(Pom);
       Pom^.data:=D;
       Pom^.nasl:=V;
       V:=Pom
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
 
var Vrchol: UkPrvek;
    R: string;
    Z: char;
    P: pointer;

{ vstup: souvislý text po řádcích; výstup: řádky v obráceném pořadí. 
   var. 2: znaky v obráceném pořadí...}

begin Init(Vrchol);
      while not eof do begin
         read(Z);
         getmem(P, 1);
         char(P^):=Z;
         Push(Vrchol, P);
      end;
      while not empty(vrchol) do begin
         P:=Pop(Vrchol);
         write(char(P^))
      end
end.         
 
 
 
 
 
 
 