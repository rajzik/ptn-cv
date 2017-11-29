program pointers;

const x = 3;
	poc = 10;
type tm = array[1..x, 1..x] of byte;
	ptm = ^tm;
	tn = array [1..x, 1..x] of ^byte;
	tx = array [1..1000000] of byte;
	ptx = ^tx;
	ty = array[1..8] of byte;

var pole: ptm;
	y,i : integer;
	n : tn;
	m : ptx;
	a : Pchar;
	u : pointer;



function prumer(m : ptx; pocet: longword) : real;
var pru : real;
	i : longword;
begin
	pru := 0;
	for i:= 1 to pocet do begin
		pru := pru + m^[i];
	end;
	
	prumer := pru/pocet;
end;

function myStrLen(st: pchar) : byte;
var endChar : char;
	counter : byte;

begin
 	counter := 0;
	endChar := st[0];
	while ord(endChar) <> 0 do begin
		counter := counter + 1;
		endChar := st[counter];
	end;

	myStrLen := counter;
end;

function myStrLenPointer(point : pointer) : byte;
var counter : byte;
begin
	counter:= 0;
	
	while ord(char(point^)) <> 0 do begin
		counter := counter + 1;
		inc(point);
	end;
	myStrLenPointer := counter;
end;
	
procedure getOrd(st:pchar);
var ay : ty;
	i : byte;
begin
	ay := ty(st);
	for i:=1 to 8 do write(ay[i], ' ');
	writeln();
end;




begin;


	getMem(m, poc * sizeof(longword));
	for i := 1 to poc do begin 
		m^[i] := i;
	end;	

	writeln(prumer(m, poc));
	new(a);
	a := 'Jan Silhan';
	writeln(a, ', delka: ' , strlen(a), ', myStrLen: ', mystrlen(a));	
	writeln(sizeof(a));	
	getOrd(a);
	u := pointer(a);
	writeln(mystrlenpointer(u));
	writeln(char(u^));
	inc(u);
	writeln(char(u^));

	{ for i:=1 to x do begin
		for y:=1 to x do begin
			new(n[i, y]);
			n[i,y]^ := 1;
			write(n[i,y]^);
		end; 
		writeln();
	end; }


	freeMem(m);
end.
