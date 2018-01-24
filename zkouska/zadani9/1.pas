{

Napište podprogram, jehož parametrem je polymorfní objekt představující implementaci uspořádaného stromu s obecnými datovými složkami. 
Podprogram využije tohoto objektu k seřazení řady reálných čísel ze standardního vstupu podle absolutních hodnot. 
K podprogramu zapište definici nějakého objektu, 
který odpovídá zapsanému použití, 
ale nezapisujte těla jeho metod.
Deklarujte instanci definovaného objektu a použijte (vyvolejte) navržený podprogram.

Na tuto otázku můžete odpovědět libovolně dlouhým textem. Odpověď bude vyhodnocena zkoušejícím ručně.

}

uses tree; 

type 
    myTree = object(strom) 
        constructor init;
        procedure add(cislo: real);
    end;

    constructor myTree.init;
        function leftOrRight(pre, curr: pointer): boolean;
        begin
            leftOrRight := abs(real(pre)) < abs(real(curr));  
        end;    

    begin
        inherited init(@leftOrRight);        
    end;

    procedure myTree.add(cislo: real);
    var a := pointer;
    begin
        a := getMem(sizeof(cislo));
        real(a^) := cislo;
        inherited pridej(a);        
    end;

procedure add(var t: myTree; var cislo: real);
begin
    t.add(cislo);
end;



var s : myTree;
    c : real;
begin
    myTree.init;
    while not eof do begin
        readln(c);
        add(s, c);
    end;
end.

