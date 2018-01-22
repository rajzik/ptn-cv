Program Example6;

Uses strings, sysutils;

{ Program to demonstrate the StrEnd function. }

Const P : PChar = 'Příliš';
var I:byte;
function jak(X: char):string;
 begin if ord(X)<32 then jak:='#'+inttostr(ord(x))
          else jak:=x
 end;
begin
  for I:=0 to StrLen(P) do write(i,':',jak((P+I)^),'; '); writeln;
  writeln(strlen(P),' ', sizeof(P),' ',sizeof(P^));
end.