uses modul_zas;

var Vrchol: UkPrvek;
    R: string;
    Z: char;
    P: pointer;

{ vstup: souvislý text po řádcích; výstup: znaky v obráceném pořadí...}

function MojePorovnani(X, Y: pointer): boolean;
 begin MojePorovnani:= char(X^)<>char(Y^)
 end;

begin Init(Vrchol);
      while not eof do begin
         read(Z);
         getmem(P, 1);
         char(P^):=Z;
         Push(Vrchol, P, @MojePorovnani);
      end;
      writeln;
      while not empty(vrchol) do begin
         P:=Pop(Vrchol);
         write(char(P^))
      end;
      writeln
      
end.         
 
