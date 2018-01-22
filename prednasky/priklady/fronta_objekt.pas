unit fronta_objekt;
interface

{1. Vstup -- řetězce, výstup -- řetězce v obráceném pořadí}
{2. Vstup -- řetězce, výstup -- řetězce ve stejném pořadí}
{3. Příklad 2 s prioritami}
{4. Příklad 2 řešený pomocí dynamických struktur}
{5. Příklad 2 řešený lineárním seznamem}
{6. Modul s obecnými datovými složkami}
{7. Modul s objektem}

type 
     UkPrvek = ^Prvek;
     
     Prvek = record
       Nasled: UkPrvek;
       Udaje: pointer
     end;  


     TypVetsi = function (A, B: pointer): boolean;

     Fronta = object
       Data, Konec: UkPrvek;
       constructor Fr_Init;
       procedure Fr_Vloz(D: pointer; Vetsi: TypVetsi);
       function Fr_Prazdny: boolean;
       function Fr_Odeber: pointer;
     end;  

implementation


constructor Fronta.Fr_Init;
 begin Data:=nil;
       Konec:=nil;
 end;

procedure Fronta.Fr_Vloz(D: pointer; Vetsi: TypVetsi);
 var Pom, Novy: UkPrvek;
 begin if Data=nil then begin
          new(Data);
          konec:=data;
          Konec^.Nasled:=nil;
          Konec^.Udaje:=D
       end else begin
          Pom:=Data;
          while (Pom<>nil) and Vetsi(Pom^.Udaje,D) do
            Pom:=Pom^.Nasled;
          if Pom=nil then begin
             new(Konec^.Nasled);
             Konec:=Konec^.Nasled;
             Konec^.Nasled:=nil;
             Konec^.Udaje:=D
          end else begin
             new(Novy);
             Novy^.Nasled:=Pom^.Nasled;
             Pom^.Nasled:=Novy;
             Novy^.Udaje:=Pom^.Udaje;
             Pom^.Udaje:=D;
          end   
       end;
 end;

function Fronta.Fr_Prazdny: boolean;
 begin Fr_Prazdny:=Data=nil
 end;

function Fronta.Fr_Odeber: pointer;
 var Pom: UkPrvek;
 begin if Data<>nil then begin
         Fr_Odeber:=Data^.Udaje;
         Pom:=Data^.Nasled;
         dispose(Data);
         Data:=Pom
       end else Fr_Odeber:=nil
 end;

end.

