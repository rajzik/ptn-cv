program ahoj;
const c = 3.333333;
const znamenko:array[boolean] of char = ('+','-');
const cisla:array[boolean] of char = ('0', '1');

type tasingle=array[1..4] of byte;

function byte2bit(item:byte):string; 
var i:integer; retString : string;

begin
	retString := '';
	for i:=0 to 7 do begin
		retString := cisla[((item shr i) and 1) = 1] + retString;
	end;
	byte2bit:=retString;
end;


function single2real(cislo:single):string;      
var a:tasingle; 
begin
	a:=tasingle(cislo);

	single2real := 
		'Z=' + 
		znamenko[cislo<0] + 
		' E=' + 
		byte2bit((a[3] shr 7) + (a[4] shl 1)) + 
		' M=' + 
		byte2bit((a[3] shl 1) + (a[2] shr 7)) + 
		byte2bit((a[2] shl 1) + (a[1] shr 7)) +
		copy(byte2bit((a[1] shl 1)), 1, 7);

end;

begin
	writeln(single2real(c));
end.
