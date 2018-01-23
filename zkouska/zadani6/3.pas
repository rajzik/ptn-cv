{
    Napište programový modul implementující abstraktní datový typ „kruhový seznam“ 
pomocí jednosměrné dynamické struktury. Datovými složkami budou obecné ukazatele. 
Operace: inicializace, vložení prvku, výpis obsahu seznamu. 
Místo, kam se vkládají nové prvky, není podstatné (vhodně zvolte). 
Pro výpis obsahu seznamu do textového souboru navrhněte vnější funkci, 
jejíž tělo definuje uživatel vně modulu a která bude parametrem vypisovací operace.
}

unit kruhSez;

interface 

type 
    pItem = ^item;

    item = record
        data: pointer;
        next: pItem;
    end;
    
    seznam = record
        startItem, endItem: pItem;
    end;
    pSeznam = ^seznam;

    typVypis = function(var A:pointer) : string;

    procedure init(var s: seznam);
    procedure add(var s: seznam; d: pointer);
    procedure print(var f : file; var s: seznam; jak: typVypis);


implementation


    procedure init(var s: seznam);
    begin
        s.startItem := nil;
        s.endItem := nil;
    end;

    procedure add(var s: seznam; d: pointer);
    var i : item;
    begin
        item.data := d;
        if (s.startItem = nil) then begin
            s.startItem := @item;
            s.endItem := @item;
            item.next := @item;
        end else begin
            item.next := s.startItem;
            s.endItem^.next := @item;
            s.endItem := @item;
        end;
    end;

    procedure print(var f : file; var s: seznam; jak: typVypis);
    var current: pSeznam;
    begin
        current := @s;

        while current <> s.startItem do begin
            writeln(f, jak(current^.data));
            current:= current^.next;
        end;
    end;
end.