{Na vstupu se nachází souvislý text sborníku. Vložte všechna slova ze vstupu
do binárního uspořádaného stromu a vypište je seřazená podle "abecedy".

Varianta: Do stromu vkládejte pouze unikátní slova.

Varianta: Slova se vypíší s počty jejich výskytů.
}

uses m_strom_obj, slova, sysutils;

var R: string;
    S: Strom;
    U: UnikStrom;
    P: Prvek;
    
    PrvCas, DruCas: TDateTime;
    
function Porovnej(A, B: Prvek): shortint;
 begin if string(A^)>string(B^) then Porovnej:=1
          else if string(A^)=string(B^) then Porovnej:=0
               else Porovnej:=-1
 end;    
 
function Obraz(A: Prvek): string;
 begin Obraz:='|'+string(A^)+'|'
 end; 

procedure Delej(X: Strom);
 begin
       while not eof do begin
          R:=DejSlovo(input);
          getmem(P, Length(R)+1);
          string(P^):=R;
          X.Vloz(P);
       end;
//       writeln('Ve stromu je ', X.Pocet, ' prvků.');
//       writeln('Strom má ', X.Hladin, ' hladin.');
//       X.Vypis(@Obraz, output); 
 end;

var h1,m1,s1,ms1,h2,m2,s2,ms2: word;
begin
     S.Start(@Porovnej);
     U.Start(@Porovnej);
     PrvCas:=Time; 
     Delej(S);
     DruCas:=Time;
     DecodeTime(PrvCas, h1, m1, s1, ms1);
     DecodeTime(DruCas, h2, m2, s2, ms2);
     writeln('Rozdíl: ',(((h2*60+m2)*60+s2)*1000+ms2)-(((h1*60+m1)*60+s1)*1000+ms1))
end.