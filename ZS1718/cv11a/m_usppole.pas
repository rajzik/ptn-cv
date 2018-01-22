unit m_usppole;
interface
const MaxPole = 20000;
type

     Prvek = pointer;
     TypRelace = function (A, B: Prvek): shortint;
     TypZobraz = function (P: Prvek): string;

     Indexy = 1..MaxPole;
     Pole = array [Indexy] of Prvek;
     UkPole = ^Pole;

     UspPole = object
       Data: UkPole;
       Obsaz: longword;
       Rel: TypRelace;
       constructor Init(R: TypRelace);
       procedure Vloz(P: Prvek); virtual;
       procedure Serad; virtual;
       procedure Vypis(var F: text; Z: TypZobraz);
     end;

     UspPole1 = object (UspPole)
       constructor Init(R: TypRelace);
       procedure Vloz(P: Prvek); virtual;
       procedure Serad; virtual;
     end;

implementation

constructor UspPole.Init(R: TypRelace);
 begin Rel:=R;
       new(Data);
       Obsaz:=0;
 end;
 
procedure UspPole.Vloz(P: Prvek);
 begin if Obsaz=MaxPole then
          writeln(StdErr, ParamStr(0), ', Chyba 314: Pole je již zaplněno.')
       else begin
          Inc(Obsaz);
          Data^[Obsaz]:=P
       end   
 end;
 
procedure UspPole.Serad;
 var Pom: Prvek;
     BylaVymena: boolean;
     I, J: Indexy;
 begin 
       if Obsaz>1 then begin
         J:=Obsaz-1;
         BylaVymena:=true;
         while BylaVymena do begin
           BylaVymena:=false;
           for I:=1 to J do
             if Rel(Data^[I], Data^[I+1])<=0 then begin
                Pom:=Data^[I];
                Data^[I]:=Data^[I+1];
                Data^[I+1]:=Pom;
                BylaVymena:=true
             end;
           Dec(J)
         end
      end
 end;
 
procedure UspPole.Vypis(var F: text; Z: TypZobraz);
 var I: Indexy;
 begin
       for I:=1 to Obsaz do writeln(F, Z(Data^[I]))
 end;

constructor UspPole1.Init(R: TypRelace);
 begin inherited Init(R);
 end;
 
procedure UspPole1.Vloz(P: Prvek); 
 begin inherited Vloz(P)
 end;
 
procedure UspPole1.Serad; 
 begin 
 end;
 
 

end.