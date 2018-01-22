var Z: char;
    vypust: boolean;
begin vypust:=false;
      while not eof do begin
         read(z);
         if z='&' then begin write(z); vypust:=true end;
         if (z=';') and vypust then vypust:=false;
         if not vypust then write(z)
      end   
end.

uses SysUtils;
var f: text; i: word;
    x: array [1..1000] of char;
begin Assign(F, 'test.txt');
      if FileExists('test.txt') then begin
         writeln('Soubor test.txt existuje.');
         reset(F); writeln(StdErr, 'Chyba -- existuje.')
      end else writeln('Soubor test.txt neexistuje.');   
      writeln(ParamStr(0));
      readln(x); 
      for I:=1 to 1000 do begin
        if i mod 60=1 then begin
           writeln; write(i:4,': ')
        end;
        write(x[i])
      end;
      writeln;
      sleep(1000);
      writeln(length(x));
      writeln(x);     
end.