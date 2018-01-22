unit modul;
interface

const MaxRadku = 50;
      MaxSloupcu = 100;
      
type
      IndexS = 1..MaxSloupcu;
      IndexR = 1..MaxRadku;
      
      Radek = array [IndexS] of pointer;
      Sloupce = array [IndexR] of Radek;
      
      UkSloupce = ^Sloupce;
      
      Matice = record
        Pole: UkSloupce;
        ObsR, ObsS: byte
      end;
      
      FormaVypisu = procedure (A: pointer; var F: text);
      
procedure Init(var M: Matice);
procedure Vloz(var M: Matice; I: IndexR; J: IndexS; D: pointer);
procedure Vypis(M: Matice; Forma: FormaVypisu; var T: Text);

implementation

procedure Init(var M: Matice);
 var I: IndexR; J: IndexS;
 begin new(M.Pole);
       for I:=1 to MaxRadku do
          for J:=1 to MaxSloupcu do M.Pole^[I,J]:=nil;
       M.ObsR:=0; M.ObsS:=0
 end;
 
procedure Vloz(var M: Matice; I: IndexR; J: IndexS; D: pointer);
 begin if (I in [1..MaxRadku]) and (J in [1..MaxSloupcu]) then begin
          M.Pole^[I, J]:=D;
          if I>M.ObsR then M.ObsR:=I;
          if J>M.ObsS then M.ObsS:=J
       end         
 end;
 
procedure Vypis(M: Matice; Forma: FormaVypisu; var T: Text);
 var I: IndexR; J: IndexS;
 begin for I:=1 to M.ObsR do begin
         for J:=1 to M.ObsS do Forma(M.Pole^[I,J],T);
         writeln(T)
       end
 end;
 

end.