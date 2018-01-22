var a, b, c, max: real;

begin
      read(a, b);
      Max:=0;
      while (a<>-1) or (b<>-1) do begin
         C:=sqrt(sqr(a)+sqr(b));
         if C>Max then Max:=C;
         read(a, b)
      end;
      writeln(Max)

end.