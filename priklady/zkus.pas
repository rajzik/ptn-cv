var J, I, X: byte; sudy: boolean; 
true: shortint;
begin
for X:=0 to 16 do begin
J:=0; for I:=0 to 7 do J:=J+ord(odd(X shr I)); sudy:=not odd(J); writeln(sudy)
end
end.
const znamky = ['A', 'B', 'C', 'D'];
var X, Y: word; Z: char; Q: double;
begin readln(x, y, z); q:=-maxreal;
      x+=7;
      writeln('Známka ',x,' je: ', 'B' in Znamky)
end.

type Mnozina = set of 0..31;
var M: Mnozina; X: char; I: byte;
begin M:=[];
      I:=0; while not eoln do begin
          read(X); Inc(I);
          if X<>'0' then M:=M+[32-I]      
      end;
      writeln(longint(M))
end.
{-------------------------}
var A: string[5];
 begin readln(A); writeln(word(A[3]));
 end.
 
var Z: int; Y: string[16]; //array [1..5] of real;
begin Z:=maxint-1; z++; writeln(Z); A(Y)
end.


uses sysutils;
type Efileexists = class(Exception);
var F: text;
begin Assign(F, 'muj.pas');
      try
       reset(F);
      except 
       on Efileexists do writeln('nelze otevřít')
      end;
end.



type ukstrom=^strom;
     strom=record
       D: integer;
       vlevo,vpravo:ukstrom
     end;
function pocet(u:ukstrom): integer;
var X: integer;
begin X:=0;
      if u<>nil then X:=1+pocet(u^.vlevo)+pocet(u^.vpravo);
      pocet:=x
end;
var S: Ukstrom;
begin new(S); new(S^.vlevo); new(S^.vlevo^.vlevo);
      new(S^.vlevo^.vpravo);
      new(S^.vpravo);
      S^.vlevo^.vlevo^.vlevo:=nil;
      S^.vlevo^.vlevo^.vpravo:=nil;
      S^.vlevo^.vpravo^.vlevo:=nil;
      S^.vlevo^.vpravo^.vpravo:=nil;
      S^.vpravo^.vlevo:=nil;
      S^.vpravo^.vpravo:=nil;
      writeln(pocet(S))
end.      

var a,x: shortint;
begin a := 3;
x := (succ(char(a + 1))) and (pred((a shl 2) + a)) - ((25 and 12) shr 4);
write(x);
end.


type muj = object
      a: shortint;
      procedure Napln(X: shortint); virtual;
      constructor start;
      function vypis: shortint; virtual;
     end;

procedure muj.napln(X:shortint);
 begin A:=X end;
 
constructor muj.start;
 begin end;
 
function muj.vypis: shortint;
 begin vypis:=a
 end;  

procedure Pouzij(var neco:muj);
 begin neco.napln(5);      
 end;

var M:muj;

function hash(K: integer):integer;
 begin hash:=0;
       for k:=1 to 3 do hash:=hash(2)+5
 end;

var M1: set of 0..15;
    M2: set of 0..31;
    M3: set of 0..47;

    F:text;    
    B:byte =1;
//    X: set of 1..500;
    AA: record X: char; Y: string end; 
    BB: record A: char; B: string[6] end;
    CC: ^string;
const xmax=500;
begin writeln('B=',B);
      assign(F,'A.A');
      reset(F); if IOResult>0 then write('soubor neexistuje');
//      if B in [1..Xmax] then write('true');
(* M.start;
      pouzij(M); 
      writeln('V objektu je ',m.vypis);
      writeln(hash(3))  
      writeln(sizeof(M1),'--',sizeof(M2),'==', sizeof(M3));
      BB.A:='A';
      AA:=BB; 
*)
end.      