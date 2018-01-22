unit modul_zas;
interface
{ varianta zásobníku: vkládají se pouze unikátní hodnoty. }

type UkPrvek = ^Prvek;
     Prvek = record
       data: pointer;
       nasl: UkPrvek
     end;
     
     TypPorovnani = function (A, B: pointer): boolean;

procedure Init(var V: UkPrvek);
procedure Push(var V: UkPrvek; D: pointer; Jak: TypPorovnani);
function Empty(V: UkPrvek): boolean;
function Pop(var V: UkPrvek): pointer;
     
     
implementation
     
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
 
end.