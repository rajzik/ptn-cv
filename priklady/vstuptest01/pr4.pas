{Na vstupu jsou zadána tři komplexní čísla A, B, C. Napište program, který
vypíše komplexní číslo V vzniklé výpočtem výrazu V = (A+B)/(A+C) . B

Pro součet, součin a podíl dvou komplexních čísel vytvořte vhodné
podprogramy, které pak při výpočtu použijete.}

type Komplex = record
       Re, Im: real
     end;
     
var Error: boolean;
     
function KSoucet(A, B: Komplex): Komplex;
 begin KSoucet.Re:=A.Re+B.Re;
       KSoucet.Im:=A.Im+B.Im
 end;
 
function KSoucin(A, B: Komplex): Komplex;
 begin KSoucin.Re:=A.Re*B.Re-A.Im*B.Im;
       KSoucin.Im:=A.Re*B.Im+A.Im*B.Re
 end;
  
function KPodil(A, B: Komplex): Komplex;
 var Delitel: real;
 begin Delitel:=sqr(B.Re)+sqr(B.Im);
       if Delitel<>0 then begin
         KPodil.Re:=(A.Re*B.Re+A.Im*B.Im)/Delitel;
         KPodil.Im:=(A.Re*B.Im-A.Im*B.Re)/Delitel
       end else begin
         Error:=true;
         KPodil.Re:=0;
         KPodil.Im:=0
       end  
 end;
  
function Pm(X:real): char;
 begin if X<0 then Pm:='-' else Pm:='+'
 end;
 
procedure Cti(var X: Komplex);
 begin read(X.Re, X.Im)
 end;

procedure Pis(X: Komplex);
 begin if Error then writeln('Ve výpočtu je dělení 0+0i')
                else writeln(X.Re:7:2,' ',Pm(X.Im),X.Im:7:2,'i')
 end; 

var A, B, C: Komplex;
begin Error:=false;
      Cti(A); Cti(B); Cti(C);
      Pis(KSoucin(KPodil(KSoucet(A, B), KSoucet(A, C)), B));
end.      
