{Za použití modulu s implementací prioritní fronty řešte tuto úlohu:

Na vstupu je řada řetězců. Vypište tuto řadu na výstup seřazenou podle délek řetězců. 
Ke každému vypisovanému řetězci uveďte jeho délku získanou standardní funkcí Length.
}

uses modul_pf;

var Fronta: PFronta;
    R: string;
    P: Prvek;

function PodleDelky(A, B: Prvek): boolean;
 begin PodleDelky:=Length(string(A^))>Length(string(B^))
 end;
 
function Zpusob(A: Prvek): string;
 var Pom: string;
 begin Str(Length(string(A^)):3, Pom);
       Zpusob:=Pom+':'+string(A^)+'!'
 end; 

begin Init(Fronta, @PodleDelky);
      while not eof do begin
        readln(R);
        GetMem(P, Length(R)+1);
        string(P^):=R;
        Vloz(Fronta, P);
      end;  
      Vypis(Fronta, @Zpusob, output)
end.