type typprvku = (operand, oper);
     zaznam=record
       case prvek:typprvku of
       operand: (hodnota: real);
       oper:    (ktery: char)
     end;

var I, K:word; Z:string; kod:integer;
    pole: array [1..100] of zaznam;

begin I:=0;
      while not eof do begin
         read(z); inc(i);
         case Z[1] of
         '0'..'9': begin pole[i].prvek:=operand; 
                         Val(Z,pole[i].hodnota, kod);
                         if kod>0 then writeln('v zad�n� operandu je chyba na pozici ',kod,'!');
                   end;
         '+','-','*','/': begin pole[i].prvek:=oper;
                                pole[i].ktery:=Z[1];
                          end;
         else write('chybn� znak: ',z);
         end; 
      end;

      for K:=1 to I do
         if pole[K].prvek=operand then writeln('operand: ',pole[K].hodnota)
            else writeln('oper�tor: ',pole[K].ktery)
              
end.