{
    1)
Předpokládejte implementaci tabulky s rozptýlenými hesly pomocí základního pole s indexy od 1 do Max 
a synonymy v jednosměrných dynamických seznamech. 
Do tabulky se ukládají znakové řetězce. 
Vytvořte proceduru, která uloží tuto tabulku do souboru bez udání typu tak, 
aby výsledek zabíral minimální prostor, 
ale aby se tabulka dala z tohoto souboru opět v identické podobě načíst.
Na tuto otázku můžete odpovědět libovolně dlouhým textem. 
Odpověď bude vyhodnocena zkoušejícím ručně.
}



program hash;


type 
    rozah = 1..Max;

    Tprvek = ^prvek;
    prvek = record
        data : string
    end;

var 

    H = array[1..Max] of Tprvek
    hash = ^H;
procedure Uloz(var h : hash);
    var F : file; I : rozah;
begin
    assign(F,'file');
    rewrite(F,1);
    
    for I:=1 to max do begin
        while H^[I] <> nil do begin 
            blockwrite(F,H^[I]^,sizeOf(Tprvek)); 
            H^[I]:=H^[I]^.next; 
            end;
        end;
    end;

end;