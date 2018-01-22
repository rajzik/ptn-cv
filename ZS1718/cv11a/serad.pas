{Implementujte abstraktní datový typ Uspořádané pole. Zvolte několik
implementačních variant a zhodnoťte jejich časové složitosti. Pro řazení
použijte řetězce ze standardního vstupu. Výpis proveďte do souboru,
jehož jméno je zadáno jako první parametr z příkazového řádku. Není-li 
parametr uveden, vypisujte na standardní výstup.}

uses m_usppole;

var UP: UspPole;
    UPHeap: UspPole1;

function MojeRelace(A, B: Prvek): shortint;
 begin MojeRelace:=1;
       if string(A^)<string(B^) then MojeRelace:=-1;
       if string(A^)=string(B^) then MojeRelace:=0;
 end;
 
function JakZobrazit(P: Prvek): string;
 begin JakZobrazit:=':'+Copy(string(P^),1,25)+':'
 end; 

procedure Delej(UP: UspPole);
 var R: string;
     P: Prvek;
     F: text;
     NazevSouboru: string;
 begin
      while not eof do begin
        readln(R);
        getmem(P, Length(R)+1);
        string(P^):=R;
        UP.Vloz(P);
      end;
      UP.Serad;
      if ParamCount>0 then begin
         NazevSouboru:=ParamStr(1);
         Assign(F, NazevSouboru);
         rewrite(F);
         UP.Vypis(F, @JakZobrazit);
         Close(F)
      end else UP.Vypis(output, @JakZobrazit)
 end;
 
begin
      UP.Init(@MojeRelace);
      UPHeap.Init(@MojeRelace);
      Delej(UPHeap);
end.
