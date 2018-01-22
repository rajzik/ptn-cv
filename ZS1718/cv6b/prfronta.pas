unit prfronta;
interface

type Prvek = pointer;
     UkClen = ^Clen;
     
     TypRelace = function (A, B: Prvek): boolean;
     TypVzhled = function (A: Prvek): string;

     Clen = record
       Data: Prvek;
       Predchozi, Dalsi: UkClen;
     end;
     
     PFronta = record
       Zac: UkClen;
       Jak: TypRelace;
     end;

procedure Init(var F: PFronta; Jak: TypRelace);
procedure Vloz(var F: PFronta; P: Prvek);
procedure Odeber(var F: PFronta; var P: Prvek);
procedure Vypis(F: PFronta; JakVypsat: TypVzhled; var T: text);
function Prazdna(F: PFronta): boolean;

implementation

procedure Init(var F: PFronta; Jak: TypRelace);
 begin F.Zac:=nil;
       F.Jak:=Jak
 end;
 
procedure Vloz(var F: PFronta; P: Prvek);
 var Pom1, Pom2: UkClen;
     PomPrvek: Prvek;
 begin if Prazdna(F) then begin
          new(F.Zac);
          F.Zac^.Data:=P;
          F.Zac^.Predchozi:=nil;
          F.Zac^.Dalsi:=nil
       end else begin
          new(F.Zac^.Predchozi);
          F.Zac^.Predchozi^.Dalsi:=F.Zac;
          F.Zac:=F.Zac^.Predchozi;
          F.Zac^.Data:=P;
          Pom1:=F.Zac;
          Pom2:=F.Zac^.Dalsi;
          while (Pom2<>nil) and (not F.Jak(Pom1^.Data, Pom2^.Data)) do begin
             PomPrvek:=Pom1^.Data;
             Pom1^.Data:=Pom2^.Data;
             Pom2^.Data:=PomPrvek;
             Pom1:=Pom2;
             Pom2:=Pom2^.Dalsi
          end
       end
 end;
 
procedure Odeber(var F: PFronta; var P: Prvek);
 var Pom:UkClen;
 begin if not Prazdna(F) then begin
         P:=F.Zac^.Data;
         Pom:=F.Zac;
         F.Zac:=F.Zac^.Dalsi;
         if F.Zac<>nil then F.Zac^.predchozi:=nil;
         dispose(Pom)
       end else P:=nil 
 end;
 
procedure Vypis(F: PFronta; JakVypsat: TypVzhled; var T: text);
 var Pom: UkClen;
 begin Pom:=F.Zac;
       while Pom<>nil do begin 
         writeln(T, JakVypsat(Pom^.Data));
         Pom:=Pom^.dalsi
       end  
 end;
 
function Prazdna(F: PFronta): boolean;
 begin Prazdna:=F.Zac=nil
 end;
 
end.