var z, jmen, zlomek, tg: real;
begin
      read(z);
      jmen:=z+4;
      if jmen<>0 then begin
         zlomek:=sqr(z)/jmen;
         if cos(zlomek)<>0 then begin
            tg:=sin(zlomek)/cos(zlomek);
            if tg>0 then writeln(ln(tg)-exp(1))
               else writeln('Nedefinováno')
         end else writeln('Nedefinováno')
      end else writeln('Nedefinováno')   
end.      