uses mod_strom, slova;

var R: string;
    S: strom;
    P: Prvek;
    N: longword;

function PodleVelikosti(A, B: Prvek): boolean;
 begin PodleVelikosti:=string(A^)>string(B^)
 end;

function Shodnost(A, B: Prvek): boolean;
 begin Shodnost:=string(A^)=string(B^)
 end;

function Obycejne(A: Prvek): string;
 begin Obycejne:=string(A^)
 end;

begin start(S); N:=0;
      while not eof do begin
        R:=DejSlovo(input);
        Inc(N);
        getmem(P, Length(R)+1);
        string(P^):=R;
        Vloz(S, P, @PodleVelikosti, @Shodnost)
      end;
      writeln('Celkem je ve stromu ', N, ' různých slov.');
      writeln('Strom obsahuje celkem ', hloubka(S), ' hladin.');
      Inorder(S, output, @Obycejne)
end.