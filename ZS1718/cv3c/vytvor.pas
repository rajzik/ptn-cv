const LJmeno = 20;
      LPrijmeni = 30;

type 
     TypJmeno = string[LJmeno];
     TypPrijmeni = string[LPrijmeni];
     Zaznam = record
       Jm: TypJmeno;
       Pr: TypPrijmeni;
       Body: byte
     end;  
     
     Soubor = file of Zaznam;

var S: Soubor; JmSouboru: string;
    Z: Zaznam;

procedure Cti(var S: TypJmeno);
 var Z: char;
 begin read(z); S:='';
       while Z<>';' do begin
         S:=S+Z;
         read(Z)
       end  
 end;

procedure Cti(var S: TypPrijmeni);
 var Z: char;
 begin read(z); S:='';
       while Z<>';' do begin
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
         write(S, Z);
      end;
      Close(S);
end.