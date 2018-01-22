unit m_graf;
interface
type 
     Uzel = pointer;
     Evaluace = pointer;
     
     UkHrana = ^Hrana;
     Hrana = record
       U1, U2: UkUzel;
       Eval: Evaluace;
       dalsi: UkHrana;
     end;
     
     SeznamHran = record
       Hzac, Hkon: UkHrana;
     end;  
     
     UkUzel = ^PrvekUzlu;
     PrvekUzlu = record
       data: Uzel;
       dalsi: UkUzel
     end;  
     SeznamUzlu = record
       UZac, UKon: UkUzel;
     end;

     Graf = object
       Uzly: SeznamUzlu;
       Hrany: SeznamHran;
       constructor init;
       procedure PridejUzel(U: Uzel);
       procedure PridejHranu(U1, U2: Uzel; E: Evaluace);
       procedure Vykresli(var F: text);
       procedure VypisBUT(var F: file);
       function Prazdny: boolean;
     end;



implementation

constructor Graf.init;
 begin 
       Uzly.Uzac:=nil;
       Uzly.UKon:=nil;
       Hrany.HZac:=nil;
       Hrany.HKon:=nil;
 end;
 
procedure Graf.PridejUzel(U: Uzel);
 begin
 end;
 
procedure Graf.PridejHranu(U1, U2: Uzel; E: Evaluace);
 begin
 end;
 
procedure Graf.Vykresli(var F: text);
 begin
 end;
 
procedure Graf.VypisBUT(var F: file);
 begin
 end;
 
function Graf.Prazdny: boolean;
 begin Prazdny := Uzly.Uzac=nil
 end;
 

end.