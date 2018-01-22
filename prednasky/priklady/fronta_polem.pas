{1. Vstup -- řetězce, výstup -- řetězce v obráceném pořadí}
{2. Vstup -- řetězce, výstup -- řetězce ve stejném pořadí}

const Max = 10000;

type 
     Uschovna = array [1..Max] of string;
     Zasobnik = record
       Data: Uschovna;
       Pocet: word
     end;  

     Fronta = record
       Data: Uschovna;
       celo, konec: word
     end;  

var S: string; 
    Z: Zasobnik;
    F: Fronta;
    
procedure Zas_Init(var Z: Zasobnik);
 begin Z.Pocet:=0
 end;

procedure Zas_Vloz(var Z: Zasobnik; S: string);
 begin if Z.Pocet<Max then begin
          Inc(Z.Pocet);
          Z.Data[Z.Pocet]:=S
       end       
 end;

function Zas_Prazdny(Z: Zasobnik): boolean;
 begin Zas_Prazdny:=Z.Pocet=0
 end;

function Zas_Odeber(var Z: Zasobnik): string;
 begin if Z.Pocet>0 then begin
          Zas_Odeber:=Z.Data[Z.Pocet];
          Dec(Z.Pocet)
       end else Zas_Odeber:=''
 end;


procedure Fr_Init(var F: Fronta);
 begin F.Celo:=0; F.Konec:=0;
 end;

procedure Fr_Vloz(var F: Fronta; S: string);
 var I: word;
 begin if F.konec<Max then begin
          Inc(F.Konec);
          F.Data[F.Konec]:=S;
          if F.Celo=0 then F.Celo:=1
       end else
          if F.Celo>1 then begin
             for I:=1 to F.Konec-F.Celo+1 do
               F.Data[I]:=F.Data[F.Celo+I-1];
             F.Konec:=F.Konec-F.Celo+1;
             F.Celo:=1;
             Inc(F.Konec);
             F.Data[F.Konec]:=S
       end        
 end;

function Fr_Prazdny(F: Fronta): boolean;
 begin Fr_Prazdny:=F.Celo=0
 end;

function Fr_Odeber(var F: Fronta): string;
 begin if F.Celo>0 then begin
          Fr_Odeber:=F.Data[F.Celo];
          Inc(F.Celo);
          if F.Celo>F.Konec then begin
             F.Celo:=0;
             F.Konec:=0
          end   
       end else Fr_Odeber:=''
 end;

begin Fr_Init(F);
      while not eof do begin
        readln(S);
        Fr_Vloz(F, S)
      end;

      while not Fr_Prazdny(F) do begin
        S:=Fr_Odeber(F);
        writeln(S)
      end  
end.