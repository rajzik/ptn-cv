{Implementujte ATD Uspořádané pole v několika variantách (metody řazení).
Data jsou v podobě posloupnosti řetězců ve vstupním souboru. Jméno 
vstupního souboru je zadáno jako první parametr z příkazového řádku.
Pokud nebude první parametr zadán, čtěte data ze standardního vstupu.
Připravte výstup dat pro analýzu časové složitosti implementace.}

uses m_usppole, sysutils;

var UP: UspPole;
    UPheap: UspPoleHeap;

function JakVypsat(A: Prvek): string;
 begin JakVypsat:=':'+string(A^)+'|'#10
 end;
 
function Porovnej(A, B: Prvek): shortint;
 begin Porovnej:=-1;
       if string(A^)<string(B^) then Porovnej:=1;
       if string(A^)=string(B^) then Porovnej:=0;
 end; 

procedure CtiAVlozData(var S: text; var U: UspPole);
 var R: string; P: Prvek;
 begin
       while not eof(S) do begin
          readln(S, R);
          getmem(P, Length(R)+1);
          string(P^):=R;
          U.Vloz(P);
       end;
 end;

procedure Test(X: UspPole);
 var F: text;
 begin if ParamCount>0 then begin
          Assign(F, ParamStr(1));
          if FileExists(ParamStr(1)) then begin
             reset(F);
             CtiAVlozData(F, X)
          end else writeln(stderr, ParamStr(0),': nesprávný první parametr')
        end else CtiAVlozData(input, X);
        X.Serad;
        X.Vypis(output, @JakVypsat)
 end;

begin UP.Start(@Porovnej);
      UPHeap.Start(@Porovnej);
      Test(UPheap);
end. 