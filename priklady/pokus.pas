
type complex = record Re, Im: real end;
var X: complex;
    YÝ: float;
function CSoucet(A, B: complex): complex;
 begin CSoucet.Re:=A.Re+B.Re;
       CSoucet.Im:=A.Im+B.Im;
 end;
begin read(X.Re, X.Im); read(Y);
      writeln(CSoucet(X,X).Re)
end.