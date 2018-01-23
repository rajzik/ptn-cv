(*3]
Předpokládejte, že již existuje modul Matice s tímto rozhraním:

interface
type MatXY = ... {typ je nějak definován, není podstatné}
     TypJakVypsat = function (A: pointer): string;
procedure Init(var M: MatXY); {vyprázdnění matice}
procedure Vypis(M: MatXY; JakVypsat: TypJakVypsat);
procedure Vloz(var M: MatXY; X, Y: word; D: pointer);
implementation

Tento modul chceme použít pro ukládání informací o výkonech pracovníků na jednotlivých zakázkách. 

Čísla pracovníků tvoří řádkové indexy X, čísla zakázek sloupcové indexy Y, 

v příslušném místě matice je reálné číslo představující ohodnocení výkonu v korunách. koruny

Napište program využívající tento modul, 
v němž naplníte matici údaji čtenými ze standardního vstupu
a vypíšete obsah matice předdefinovanou procedurou Vypis. 

Výpis každé hodnoty proveďte na 5 pozic celkem a s dvěma desetinnými místy, za každým číslem vypište dvě mezery.
*)

uses matice;

var 
    x, y: word;
    mzda: real;
    mat : MatXY;

function vypis(A: pointer): string;

begin
    vypis := MatXY(A^).X:5:2;
    vypis := vypis + '  ':2;    

    vypis := vypis + MatXY(A^).Y:5:2;
    vypis := vypis + '  ':2;    

    vypis := vypis + real(MatXY(A^).D^):5:2;
    vypis := vypis + '  ':2;    
end;

begin
    Init(mat);

    while not eof do begin
        readln(x,y,mzda);
        Vloz(x,y,@mzda);
    end;
    Vypis(mat, @vypis);
end.
