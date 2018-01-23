{
    2)
Napište proceduru, která zruší v binárním neuspořádaném stromu každý listový uzel se zadanou hodnotou datové složky. 
Je-li hodnota nalezena v nelistovém uzlu, 
neprovádí se žádná akce.
Na tuto otázku můžete odpovědět libovolně dlouhým textem. 
Odpověď bude vyhodnocena zkoušejícím ručně
}

procedure zrusList(var s: pstrom; co: data);
begin
    if (s <> nil) then begin
        zrusList(s^.left, co);
        if (s^.left = nil and s^.right = nil and s^.data = co) then begin
            dispose(s);
            s := nil;
        end;
        zrusList(s^.right, co);
    end;
end;