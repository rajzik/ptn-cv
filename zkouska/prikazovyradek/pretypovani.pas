program test2;
Uses sysutils;

var 
    s, c : string;
    a, b, errorCode: integer;


begin
    
    s := paramStr(1);
    a := StrToInt(s);

    c := paramStr(2);
    val(c, b, errorCode);

    writeln(a, b, errorCode);
end.