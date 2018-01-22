program test;

type vypisFce = function(A:pointer) : string;


type pole = array[0..2] of pointer;

procedure asdf(d:pole; jak:vypisFce);
var i : integer;
begin
    for i := 0 to 1 do begin
        writeln(jak(d[i]));
    end;
end;


function test(A:pointer) : string;
begin
    test := string(A^);
end;


var a : pole;
    test1, test2: string;

begin
    test1 := 'dasdasfa';
    test2 := 'test';
    
    a[0] := @test1;
    a[1] := @test2;

    asdf(a, @test);

end.
