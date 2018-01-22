{1. Vstup -- řetězce, výstup -- řetězce v obráceném pořadí}
{2. Vstup -- řetězce, výstup -- řetězce ve stejném pořadí}
{3. Příklad 2 s prioritami}
{4. Příklad 2 řešený pomocí dynamických struktur}
{5. Příklad 2 řešený lineárním seznamem}

const Max = 1000000;

type 
     Ukdata = ^string;
     UkPrvek = ^Prvek;
     
     Prvek = record
       Nasled: UkPrvek;
       Udaje: Ukdata
     end;  


     Fronta = record
       Data, Konec: UkPrvek;
     end;  

var S: string; 
    F: Fronta;
    

procedure Fr_Init(var F: Fronta);
 begin F.Data:=nil;
       F.Konec:=nil
 end;

procedure Fr_Vloz(var F: Fronta; S: string);
 begin if F.Data=nil then begin
          new(F.Data);
          F.konec:=F.data;
       end else begin
          new(F.Konec^.Nasled);
          F.Konec:=F.Konec^.Nasled;   
       end;
       F.Konec^.Nasled:=nil;
       new(F.Konec^.Udaje);
       F.Konec^.Udaje^:=S
 end;

function Fr_Prazdny(F: Fronta): boolean;
 begin Fr_Prazdny:=f.Data=nil
 end;

function Fr_Odeber(var F: Fronta): string;
 var Pom: UkPrvek;
 begin if F.Data<>nil then begin
         Fr_Odeber:=F.Data^.Udaje^;
         dispose(F.Data^.Udaje);
         Pom:=F.Data^.Nasled;
         dispose(F.Data);
         F.Data:=Pom
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