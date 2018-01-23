{
    Na standardním vstupu je připraven text, 
jehož znaky jsou v kódu ASCII (ordinální hodnoty jsou v rozmezí 0 až 127). 
Zabezpečte tyto znaky sudou paritou v nejvyšším bitu a výsledek vypište na standardní výstup. 
(Sudá parita: doplňuje se podle potřeby binární jednička tak, že počet binárních jedniček v daném bytu je sudý.)
}


procedure test(var a: string);
var i, j, pocet : integer;


begin
    for i:= 1 to length(a) + 1 do begin
        pocet := 0;
        for j := 0 to 7 do begin
            if ((a[i] shr j) and 1) = 1 then succ(pocet);
        end;
        if (pocet mod 2 <> 0) then begin
            a[i] := a[i] xor a[i] shl 1;
        end;
    end;
end;


{Nevim tenhle bullshit ale cca neco take}