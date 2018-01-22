TYPE Person = RECORD
        Name: STRING[20];
        Points: word
     END;
CONST HexChars: ARRAY [0..15] OF char = ('0', '1', '2', 
           '3','4','5','6','7','8','9','A','B','C','D','E','F');
      MaxCount: longint = 1000;
      EmptyPerson: Person = (Name: ''; Points: 0);
      MyCharSet: SET OF char = ['C', 'J', 'P', 'R'];
      Pismena = ['A'..'Z'];

type policko = array[1..256]of byte;
var f:file of char; S: string[12];
function A(S: string): byte;
 begin 
       if S<>'' then begin A:=1+A(S) end
           else A:=$1e2;
       Delete(S,1,1);    
 end;
                   
                   
begin write(A('Sobota')) end.

S:='Nazdar';
      assign(F,'x.x');
      rewrite(F);
      write(F,S[1],S[2]);
      Close(F)
end.