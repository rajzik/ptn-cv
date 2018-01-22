{Implementujte ATD Uspořádané pole jako objekt ve více variantách
řadicích metod. Použijte tuto implementaci pro seřazení řetězců ze
standardního vstupu. Seřazený výstup vypisujte do souboru, jehož jméno
je zadáno v prvním parametru z příkazového řádku. Pokud první parametr
chybí, výpis směřujte na standardní výstup.}

uses m_usppole;

var Bubble: UspPole;
    HeapSort: UspPole1;

function Relace(A, B: Prvek): shortint;
 begin Relace:=-1;
       if string(A^)>string(B^) then Relace:=1;
       if string(A^)=string(B^) then Relace:=0;
 end;

function Zkracene(P: Prvek): string;
 begin Zkracene:='|'+Copy(string(P^), 1, 20) + '|'
 end;

procedure Delej(UP: UspPole);
 var R: string;
     P: Prvek;
     F: text;
 
 begin 
       while not eof do begin
          readln(R);
          getmem(P, Length(R)+1);
          string(P^):=R;
          UP.Vloz(P);
       end;
       UP.Serad;
       if ParamCount>0 // je zadáno jméno výstupu
          then begin
             Assign(F, ParamStr(1));
             rewrite(F);
             UP.Vypis(F, @Zkracene);
             Close(F)
          end else  // není zadáno jméno -> output
             UP.Vypis(output, @Zkracene)
 end;

begin
      Bubble.Init(@Relace);
      HeapSort.Init(@Relace);
      Delej(HeapSort)

end.