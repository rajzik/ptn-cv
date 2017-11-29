program realToBit;
const c = 3.333335;
const operators:array[boolean] of char = ('+','-');
const numbers:array[boolean] of char = ('0', '1');

type tasingle=array[1..4] of byte;


{ Prevod cisla na bitovou interpretaci }
function byte2bit(item:byte):string;

var i: integer; retString: string;

begin
	retString := '';
	{ prochazeni cisla bit po bitu }
	for i:=0 to 7 do begin
		retString := numbers[
			(
				{ bitovy posun doprava a porovnani s 1 }
				(item shr i) and 1
			) = 1] + retString;
	end;
	byte2bit:=retString;
end;

{ Mantissa 23 bitu, 3 casti }
function mantissa(partOne, partTwo, partThree:byte): string;

begin
	mantissa := 
		{ doplneni predchoziho byte o 7 bitu }
		byte2bit((partOne shl 1) + (partTwo shr 7)) + 
		byte2bit((partTwo shl 1) + (partThree shr 7)) +
		{ Substring, 7 cisel vraci o jedno navic }
		copy(byte2bit((partThree shl 1)), 1, 7);
end;


function single2real(number:single):string;      
var a:tasingle; 
begin
	a:=tasingle(number);

	single2real := 
		'Z=' + 
		operators[number<0] + 
		' E=' + 
		byte2bit((a[3] shr 7) + (a[4] shl 1)) + 
		' M=' + 
		mantissa(a[3], a[2], a[1]);

end;

begin
	writeln(single2real(c));
end.
