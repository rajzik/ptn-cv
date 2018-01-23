{

(*1]
Předpokládejte, že existuje naplněné pole N záznamů
 o turistech. Každý turista má v záznamu jméno, příjmení (znakové řetězce),
 věk a počet nachozených kilometrů za rok 2017 (celá čísla).
 Definujte potřebné datové typy a napište proceduru, která všechny záznamy z tohoto pole uloží do souboru bez udání typu tak, 
 aby řetězce byly uloženy na minimálním prostoru.
*)

}

type 

    turista = record 
        jmeno, prijmeni: string;
        vek: byte;
        kilometry: word;
    end;

    pole = array[0..N] of turista;

procedure saveToFile(var f: file, a: pole);
var I:integer;
begin
    rewrite(f, 1);
    for I:=0 to N do begin
        blockwrite(f, a[I].jmeno, length(a[I].jmeno));
        blockwrite(f, a[I].prijmeni, length(a[I].prijmeni));
        blockwrite(f, a[I].vek, sizeof(a[i].vek));
        blockwrite(f, a[I].kilometry, sizeof(a[I].kilometry));
    end;
    close(f);
end;
