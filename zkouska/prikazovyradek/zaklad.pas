program test;
var 
    a,b,c : string;


begin
    {Nazev programu}
    a := ParamStr(0);
    {prvni parametr}
    b := ParamStr(1);
    c := ParamStr(2);

    writeln(a, b, c);
end.