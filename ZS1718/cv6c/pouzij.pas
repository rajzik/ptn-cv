uses modul_fronta;

var R: string;
    F: Fronta;
    P: Prvek;
    //V: text;

function Zpusob(X: Prvek): string;
 var Pom, StrDelka: string;
     D: byte;
 begin Pom:=string(X^);
       D:=Length(Pom);
       Str(D:3, StrDelka);
       Zpusob:='Délka '+StrDelka+': '+Copy(Pom,1,10)
 end;

begin Zacni(F);
      while not eof do begin
        readln(R);
        // z řetězce R je potřebné udělat prvek P
        GetMem(P, Length(R)+1);
        string(P^):=R;
        Pridej(F, P)
      end;  
      //Assign(V, 'mujvystup.txt');
      //rewrite(V);
      Vypis(F, @Zpusob, output)
end.