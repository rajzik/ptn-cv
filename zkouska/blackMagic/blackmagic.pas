type Pole = array [1..8] of byte;
     Mnozina = set of 0..15;
var A: integer;
    B: real;
    VA, VB: string;
    PA: Pole absolute A;
    PB: Pole absolute B;
    PAM: Mnozina absolute A;
    I: byte;
    
begin readln(VA);
      writeln('Znaky: 1=', VA[1], ', 2=',VA[2]);
      A:=(ord(VA[1])-ord('0'))*10 + ord(VA[2])-ord('0'); 
      writeln('Velikost A: ', SizeOf(A), ', velikost B: ', SizeOf(B));
      B:=A;
      Str(B:6:2, VB); VB[pos('.',VB)]:=',';
      writeln(VB);
      writeln('Paměť A: ', PA[1]:3, PA[2]:3);
      write('Binárně: ');
      for I:=0 to 15 do 
         if I in PAM then write('1') else write('0');
      write('Paměť B: ');
      for I:=1 to 8 do write(PB[I]:3); writeln
end.          