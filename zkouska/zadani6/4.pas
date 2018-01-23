{
    Uvažujte dynamicky realizovaný neuspořádaný binární strom s datovými složkami 
nabývajícími čtyř hodnot (řešte výčtovým datovým typem): 
svíčka, ozdobná baňka, čokoládová figurka, nic. 
Implementujte operaci, která spočítá počet listů tohoto stromu obsahujících 
zadanou hodnotu. Doplňte všechny potřebné definice datových typů.

}


type

    tp = (svicka, banka, figurka, nic);
    pstrom = ^strom;

    strom = record
        data: tp;
        left, right: pstrom
    end;


function modifiedInOrder(s: pstrom, typ: tp): integer;
begin 
    if (s = nil) then begin
        modifiedInOrder := 0;
    end;
    modifiedInOrder := modifiedInOrder + modifiedInOrder(s^.left, typ);
    if (s^.data = tp) and s^.left = nil and s^.right = nil then begin
        modifiedInOrder := modifiedInOrder + 1;
    end;
    modifiedInOrder := modifiedInOrder + modifiedInOrder(s^.right, typ);
end;

var sometree : strom;

begin
    {nejake naplneni}
    writeln('Type svicka pocet: ', modifiedInOrder(@sometree, svicka));
    writeln('Type banka pocet: ', modifiedInOrder(@sometree, banka));
    writeln('Type figurka pocet: ', modifiedInOrder(@sometree, figurka));
    writeln('Type nic pocet: ', modifiedInOrder(@sometree, nic));

end;