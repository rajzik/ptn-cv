{Na vstupu je souvislý text. Vložte slova tohoto textu do binárního
uspořádaného stromu a vypište je na standardní výstup v pořadí daném
uspořádáním řetězců podle kódu.

Varianta: Do stromu budou vkládány pouze unikátní hodnoty.

Varianta: Výpis bude pracovat napřed s pravým podstromem.
}

uses m_uspstrom_obj, slova;

var S: Strom;
    U: UnikStrom;
    V: ObratStrom;
    
function Relace(A, B: Prvek): shortint;
 begin if string(A^)>string(B^) then
          relace:=1
       else if string(A^)=string(B^) then
          relace:=0
       else relace:=-1         
 end;

procedure zpusob(A: Prvek; var F: text);
 begin writeln(F, '!', string(A^),'!')
 end; 

procedure Delej(X: Strom);
 var R: string; P: Prvek;
 begin 
       while not eof do begin
         R:=DejSlovo(input);
         getmem(P, Length(R)+1);
         string(P^):=R;
         // vložení slova do stromu
         X.Vloz(P)
       end;
       writeln('Počet uzlů stromu: ', X.Pocet);
       writeln('Počet hladin stromu: ', X.Hladin);
       // Výpis stromu
       X.Vypis(@zpusob, output)
 end;

begin
      // inicializace stromu
      S.Start(@Relace);
      U.Start(@Relace);
      V.Start(@Relace);
      Delej(V)

end.