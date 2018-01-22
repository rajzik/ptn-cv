unit fronta_modul;
interface

{1. Vstup -- řetězce, výstup -- řetězce v obráceném pořadí}
{2. Vstup -- řetězce, výstup -- řetězce ve stejném pořadí}
{3. Příklad 2 s prioritami}
{4. Příklad 2 řešený pomocí dynamických struktur}
{5. Příklad 2 řešený lineárním seznamem}
{6. Modul s obecnými datovými složkami}

type 
     UkPrvek = ^Prvek;
     
     Prvek = record
       Nasled: UkPrvek;
       Udaje: pointer
     end;  


     TypVetsi = function (A, B: pointer): boolean;

     Fronta = record
       Data, Konec: UkPrvek;
       Vetsi: TypVetsi;
     end;  
     
procedure Fr_Init(var F: Fronta);
procedure Fr_Vloz(var F: Fronta; D: pointer; Vetsi: TypVetsi);
function Fr_Prazdny(F: Fronta): boolean;
function Fr_Odeber(var F: Fronta): pointer;

implementation


procedure Fr_Init(var F: Fronta);
 begin F.Data:=nil;
       F.Konec:=nil;
 end;

procedure Fr_Vloz(var F: Fronta; D: pointer; Vetsi: TypVetsi);
 var Pom, Novy: UkPrvek;
 begin if F.Data=nil then begin
          new(F.Data);
          F.konec:=F.data;
          F.Konec^.Nasled:=nil;
          F.Konec^.Udaje:=D
       end else begin
          Pom:=F.Data;
          while (Pom<>nil) and Vetsi(Pom^.Udaje,D) do
            Pom:=Pom^.Nasled;
          if Pom=nil then begin
             new(F.Konec^.Nasled);
             F.Konec:=F.Konec^.Nasled;
             F.Konec^.Nasled:=nil;
             F.Konec^.Udaje:=D
          end else begin
             new(Novy);
             Novy^.Nasled:=Pom^.Nasled;
             Pom^.Nasled:=Novy;
             Novy^.Udaje:=Pom^.Udaje;
             Pom^.Udaje:=D;
          end   
       end;
 end;

function Fr_Prazdny(F: Fronta): boolean;
 begin Fr_Prazdny:=f.Data=nil
 end;

function Fr_Odeber(var F: Fronta): pointer;
 var Pom: UkPrvek;
 begin if F.Data<>nil then begin
         Fr_Odeber:=F.Data^.Udaje;
         Pom:=F.Data^.Nasled;
         dispose(F.Data);
         F.Data:=Pom
       end else Fr_Odeber:=nil
 end;

end.

