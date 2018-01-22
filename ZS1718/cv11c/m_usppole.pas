unit m_usppole;
interface
const MaxPole = 100000;
type 
     Prvek = pointer;
     TypUsporadani = function (A, B: Prvek): shortint;
     TypZobraz = function (A: Prvek): string;

     Indexy = 1..MaxPole;
     UkPole = ^TypPole;
     TypPole = record
       Data: array [Indexy] of Prvek;
       Obsaz: longword
     end;
     
     UspPole = object
       Pole: UkPole;
       Porov: TypUsporadani;
       constructor Start(R: TypUsporadani);
       procedure Vloz(P: Prvek); virtual;
       procedure Serad; virtual;
       procedure Vypis(var F: text; Z: TypZobraz);
     end;

     UspPoleHeap = object(UspPole)
       constructor Start(R: TypUsporadani);
       procedure Vloz(P: Prvek); virtual;
       procedure Serad; virtual;
     end;

implementation

constructor UspPole.Start(R: TypUsporadani);
 begin Porov:=R;
       new(Pole);
       Pole^.Obsaz:=0
 end;
 
procedure UspPole.Vloz(P: Prvek);
 begin with Pole^ do begin
          if Obsaz=MaxPole then 
             writeln(stderr, ParamStr(0), ': Struktura je plná.')
          else begin
             Inc(Obsaz);
             Data[Obsaz]:=P
          end
       end
 end;
 
procedure UspPole.Serad;
 var bylazamena: boolean; I, J: Indexy; Pom: Prvek;
 begin with Pole^ do begin
          bylazamena:=true;
          J:=Obsaz-1;
          while bylazamena do begin
             bylazamena:=false;
             for I:=1 to J do 
                if Porov(Data[I], Data[I+1])=-1 then begin
                   bylazamena:=true;
                   Pom:=Data[I];
                   Data[I]:=Data[I+1];
                   Data[I+1]:=Pom
                end;
             Dec(J)   
          end
       end
 end;
 
procedure UspPole.Vypis(var F: text; Z: TypZobraz);
 var I: Indexy;
 begin for I:=1 to Pole^.Obsaz do write(F, Z(Pole^.Data[I]))
 end;
 
constructor UspPoleHeap.Start(R: TypUsporadani);
 begin inherited Start(R);
 end;
 
procedure UspPoleHeap.Vloz(P: Prvek); 
 begin inherited Vloz(P)
 end;
 
procedure UspPoleHeap.Serad; 
 begin 
 end;
 

end.