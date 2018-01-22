unit modul_fronta;
interface

type Prvek = pointer;
     TypFormatu = function (A: Prvek): string;

     UkClen = ^Clen;
     Clen = record
       Data: Prvek;
       Dopredu, Dozadu: UkClen;
     end;
     
     Fronta = record
       Zac, Kon: UkClen;
       PPrvku: longword
     end;  

procedure Zacni(var F: Fronta);
procedure Pridej(var F: Fronta; P: Prvek);
procedure Odeber(var F: Fronta; var P: Prvek);
function Prazdna(F: Fronta): boolean;
function Pocet(F: Fronta): longword;
procedure Vypis(F: Fronta; Jak: TypFormatu; var T: text);

implementation

procedure Zacni(var F: Fronta);
 begin F.zac:=nil;
       F.Kon:=nil;
       F.PPrvku:=0;
 end;
 
procedure Pridej(var F: Fronta; P: Prvek);
 begin if Prazdna(F) then begin
          new(F.Zac);
          F.Kon:=F.Zac;
          F.Zac^.Data:=P;
          F.Zac^.Dopredu:=nil;
          F.Zac^.Dozadu:=nil
       end else begin
          new(F.Kon^.Dozadu);
          F.Kon^.Dozadu^.Dopredu:=F.Kon;
          F.Kon:=F.Kon^.Dozadu;
          with F.Kon^ do begin
            Data:=P;
            Dozadu:=nil;
          end
       end;
       Inc(F.PPrvku);
 end;
 
procedure Odeber(var F: Fronta; var P: Prvek);
 begin 
 end;
 
function Prazdna(F: Fronta): boolean;
 begin Prazdna:=F.Zac=nil;
 end;
 
function Pocet(F: Fronta): longword;
 begin Pocet:=F.PPrvku;
 end;
 
procedure Vypis(F: Fronta; Jak: TypFormatu; var T: text);
 var Pom: UkClen;
 begin Pom:=F.Zac;
       while Pom<>nil do begin
         writeln(T, Jak(Pom^.Data));
         Pom:=Pom^.Dozadu
       end  
 end;
 
end.