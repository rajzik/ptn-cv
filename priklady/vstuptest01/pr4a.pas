{Na vstupu jsou zadána tři komplexní čísla A, B, C. Napište program, který
vypíše komplexní číslo V vzniklé výpočtem výrazu V = (A+B)/(A+C) . B

Pro součet, součin a podíl dvou komplexních čísel vytvořte vhodné
operátory, které pak při výpočtu použijete.}

type Komplex = record
       Re, Im: real
     end;
     
var Error: boolean;
     
operator + (A, B: Komplex) Z: Komplex;
 begin Z.Re:=A.Re+B.Re;
       Z.Im:=A.Im+B.Im
 end;
 
operator * (A, B: Komplex) Z: Komplex;
 begin Z.Re:=A.Re*B.Re-A.Im*B.Im;
       Z.Im:=A.Re*B.Im+A.Im*B.Re
 end;
  
operator / (A, B: Komplex) Z: Komplex;
 var Delitel: real;
 begin Delitel:=sqr(B.Re)+sqr(B.Im);
       if Delitel<>0 then begin
         Z.Re:=(A.Re*B.Re+A.Im*B.Im)/Delitel;
         Z.Im:=(A.Re*B.Im-A.Im*B.Re)/Delitel
       end else begin
         Error:=true;
         Z.Re:=0;
         Z.Im:=0
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
      Pis((A + B)/(A + C) * B);
end.      
