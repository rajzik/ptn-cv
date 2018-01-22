const DelkaJmena = 15;
      DelkaPrijmeni = 25;
      Oddel = ';';

type 
     TypJmeno = string[DelkaJmena];
     TypPrijmeni = string[DelkaPrijmeni];
     Zaznam = record
       Jm: TypJmeno; 
       Pr: TypPrijmeni;
       Body: byte
     end;  
     
     Soubor = file of Zaznam;

var S: Soubor; JmSouboru: string;
    Z: Zaznam;

procedure Cti(var S: string);
 var Z: char;
 begin read(Z);
       S:='';
       while Z<>Oddel do begin
         S:=S+Z;
         read(Z)
       end
 end;        

begin readln(JmSouboru);
      Assign(S, JmSouboru);
      rewrite(S);
      while not eof do begin
         with Z do begin
            Cti(Jm); Cti(Pr); readln(Body)
         end;
         write(S, Z)   
      end;
      Close(S)
end.