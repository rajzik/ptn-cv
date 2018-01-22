{Uspořádejte slova ze vstupního textu podle abecedy (kódu).

Varianta: Zjistěte kromě uspořádání také celkový počet slov ve stromu a 
celkový počet hladin stromu.

}

uses m_uspstrom, 
     slova;

var S: strom;
    R: string;
    P: Prvek;

function relace(A, B: Prvek): shortint;
 begin if string(A^)>string(B^) then
          relace:=1
       else if string(A^)=string(B^) then
          relace:=0
       else relace:=-1         
 end;
 
procedure zpusob(A: Prvek; var F: text);
 begin writeln(F, '!', string(A^),'!')
 end; 

begin Start(S, @relace); 
      while not eof do begin
         R:=DejSlovo(input);
         getmem(P, Length(R)+1);
         string(P^):=R;
         Vloz(S, P)
      end;
      writeln('Celkový počet prvků stromu: ', pocet(S));
      writeln('Celkový počet hladin stromu: ', hladin(S));
      Vypis(S, @zpusob, output)
end.