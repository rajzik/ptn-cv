{
1)	
Na disku existuje soubor bez udaného typu, 
který obsahuje informace o pracovnících -- jméno, 
příjmení (řetězce uložené jako posloupnosti znaků 
zakončené bajtem s hodnotou nula), 
věk (1 B) a plat (3 B). 
Zjistěte průměrný plat pracovníků pro všechny věky v souboru 
(tj. průměrný plat třicetiletých, jednatřicetiletých atd.).
Na tuto otázku můžete odpovědět libovolně dlouhým textem. 
Odpověď bude vyhodnocena zkoušejícím ručně.
}

const max = 500;

type 
    osoba = record 
        jmeno, prijmeni: string;
        vek: byte;
        plat    : integer;
    end;


pole = array [0..max] of integer;

var a : pole;

procedure ctiSoubor(var f: file);
var 
    jmeno, prijmeni: string;
    charakter : char;
    vek: byte;
    counter, plat: integer;

begin
    reset(f, 1);
    counter:=0;
    while not eof(f) do begin
        blockread(f, charakter, 1);
        a[counter].jmeno := charakter;

        while ord(charakter) <> 0 do begin
            a[counter].jmeno := a[counter].jmeno + charakter;
        end;

        blockread(f, charakter, 1);
        a[counter].prijmeni := charakter;

        while ord(charakter) <> 0 do begin
            a[counter].prijmeni := a[counter].prijmeni + charakter;
        end;

        blockread(f, a[counter].vek, 1);
        blockread(f, a[counter].plat, 3);

        succ(counter);
    end;

    {
        tady jen napsat program pro projiti cisel too tired for this shit
    }

end;
