const LJmeno = 10;
      LPrijmeni = 20;
      Oddel = ',';

type TypJmeno = string[LJmeno];
     TypPrijmeni = string[LPrijmeni];
     Zaznam = record
       Jm: TypJmeno;
       Pr: TypPrijmeni;
       Body: byte
     end;  

     Soubor = file of Zaznam;
     
var Z: Zaznam; F: soubor;
    JmSouboru: string;

procedure Cti(var S: string);
 var Pom: char;
 begin S:='';
       read(Pom);
       while Pom<>Oddel do begin
         S:=S+Pom;
         read(Pom)
       end  
 end;

begin 
      readln(JmSouboru);
      Assign(F, JmSouboru);
      rewrite(F);
      
      while not eof do begin
        Cti(Z.Jm); Cti(Z.Pr); readln(Z.Body);
        write(F,Z)
      end;

      close(F)
end.