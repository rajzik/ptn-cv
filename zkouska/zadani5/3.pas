{

    3)
Napište programový modul, 
který implementuje operace pro práci s grafickými úsečkami. 
Úsečka je reprezentována délkou ve vodorovném směru a délkou ve svislém směru. 
Modul bude obsahovat operaci pro grafické sčítání úseček 
(sčítají se odpovídající složky), 
pro násobení velikosti úsečky reálným číslem a pro vykreslení úsečky.
 Způsob vykreslení určuje procedura, která bude definována vně modulu.

V určité aplikaci budete chtít vykreslovat tyto úsečky procedurou, 
k jejíž činnosti budete potřebovat počáteční bod úsečky a měřítko zobrazení. 
Navrhněte takovou uživatelskou proceduru, která odpovídá návrhu v uvedeném modulu.

}



unit modul;


interface

type



    Tusecka = ^usecka;
    jakVyreslit = procedure(var f: file; x, y, delkaH, sirkaH);

    usecka = record
        kresleni: jakVyreslit;
        delkaH,delkaS : integer;
        dalsi : Tusecka
    end;


    procedure Init(var U : Tusecka);
    procedure Scitani(var U : Tusecka; var vysledek : longint);
    procedure Nasob(var U : Tusecka;  var vysledek : longint);


implementation

    procedure Pridej (var U : Tusecka; var u : usecka)
        var pom : Tusecka;
    begin 
        pom :=U;
        pom^.delkaH:=u.delkaH;
        pom^.delkaS:=u.delkaS;
        pom^.dalsi:=U;
        U:=pom
    end;



    procedure Nacti(F : text; var u : usecka);
        var pom : Tusekca;
    begin
        while not eof(F) do begin
            readln(F,u.delkaH,u.delkaS);
            Pridej(pom,u);
        end;

    end;

    procedure Init(var U : Tusecka);
    begin
        U := nil
    end;

    procedure Scitani(var U : Tusecka; var vysledek : longint);
    var pom : Tusecka;
    begin
        pom:=U;
        vysledek:=0;
        while pom <> nil then begin
            vysledek:= vyseldek + (pom^.delkaH + pom^delkaS);
        end;
    end;

    procedure Nasob(var U : Tusecka;  var vysledek : longint);
        var pom : Tusecka;
    begin
        pom:=U;
        vysledek:=0;
        while pom <> nil then begin
            vysledek:= vyseldek + (pom^.delkaH * pom^delkaS);
        end;
    end;

    procedure Vyskresly(U : Tusecka; F : text );
        var pom : Tusecka;
            x, y: integer;
    begin
        pom:=U;
        x := 0;
        y := 0;
        while pom <> nil then begin
            jakVyreslit(F, );
            pom:= pom^.next;
        end;
    end;

end.