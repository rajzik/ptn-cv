	
{Uvažujme modul pro ukládání obecných dat do maticové struktury. 
Není dopředu známo, jaké rozměry matice může mít, 
je proto nutné ji implementovat formou dynamické datové struktury 
(například lineárního seznamu). 
Je dáno rozhraní modulu:
}
unit Matice;

interface
type 
     MatXY = ... {doplňte definici tohoto a případných dalších potřebných datových typů}
     TypJakVypsat = function (A: pointer): string;
procedure Init(var M: MatXY); {vyprázdnění matice}
procedure Vypis(M: MatXY; X, Y: longword; JakVypsat: TypJakVypsat);
  {vypíše hodnotu na souřadnicích řádku X a sloupce Y na standardní výstup}
procedure Vloz(var M: MatXY; X, Y: longword; D: pointer);
  {vloží do matice prvek D se souřadnicemi řádku X a sloupce Y}
implementation

Doplňte potřebné datové typy a implementační část modulu. 

Na tuto otázku můžete odpovědět libovolně dlouhým textem. Odpověď bude vyhodnocena zkoušejícím ručně.
unit Matice;

interface

type 

ukmatXY = ^matXY;

matXY = record begin
  x,y : longword;
  data : pointer;
  next : ukmatXY;
end;

TypJakVypsat = function (A: pointer): string;
procedure Init(var M: MatXY); {vyprázdnění matice}
procedure Vypis(M: MatXY; X, Y: longword; JakVypsat: TypJakVypsat);
  {vypíše hodnotu na souřadnicích řádku X a sloupce Y na standardní výstup}
procedure Vloz(var M: MatXY; X, Y: longword; D: pointer);
  {vloží do matice prvek D se souřadnicemi řádku X a sloupce Y}
implementation

procedure Init(var M: MatXY);

begin
  M.x := -1;
  M.y := -1;
  M.data := nil;
  m.next := nil;
end;


procedure Vypis(M: MatXY; X, Y: longword; JakVypsat: TypJakVypsat);
var current : ukmatXY;

begin
  current := ^M;
  while ((current <> nil) and (current^.x <> X) and (current^.y <> Y)) do begin
    current := current^.next;
  end;
  if (current <> nil) then begin
    jakVypsat(current^.data);
  end;

end;

procedure Vloz(var M: MatXY; X, Y: longword; D: pointer);
current : ukmatXY;
begin
  current := ^M;
  if (current^.data = nil) then begin
    current^.x := X;
    current^.y := Y;
    current^.data := D;
  end else begin
    while (current^.next <> nil) do begin
      current := current^.next;
    end;
    new(current^.next);
    current^.next^.x := X;
    current^.next^.y := Y;
    current^.next^.data := D;
    current^.next^.next := nil;
  end;
  
end;