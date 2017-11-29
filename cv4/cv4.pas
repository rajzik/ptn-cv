program retezce; 
uses strings;
function countI(retezec: string): integer;

var count, i:integer;

begin;
	count := 0;
	for i:= 0 to length(retezec) do begin 
		 inc(count, byte(retezec[i] = 'i'));
	end;

	countI:=count;
end;

function find(retezec, subretezec :string) : boolean;

begin;
	find := pos(retezec, subretezec) = 0;
end;

function realLength (str: string) : byte; 
begin 
	if length(str) = byte(str[1]) then 
		realLength := length(str)
	else  
		realLength := length(str) - 1;
		
	{ realLength := length(str); }
end;


function myLength(str: string) : byte;
begin
	myLength := byte(str[1]);
end;

function myCopy(str: string; x, y:integer) : string;
var retString : string; i : integer;

begin 
	retString := '';
	for i := x to y do begin
		retString := retString + str[i];
	end;
	myCopy := retString;
end;

function myDelete(ret: string; x, y: integer) : string;
var retString : string;
begin
	retString := myCopy(ret, 1, x - 1);
	retString := retString + myCopy(ret, x+y, length(ret)); 

	myDelete:= retString;
end;

function myInsert(inserting, ret: string; x:integer) : string;
var retString : string; 
begin 
	retString := myCopy(ret, 1, x - 1);
	retString := retString + inserting;
	retString := retString + myCopy(ret, x, length(ret));
	myInsert:= retString; 

end;



var r, test: string;



begin;
	r:='techniky malby';

	r:='Miluji ' + r;

	insert('programovací ', r, pos('techniky', r));
	delete(r, pos(' malby', r), 6);

	r:=r + '!';

	r[pos('programovací', r)] := 'P';
	
	
	{Test of our functions} 
	test := 'Miluji techniky malby';
	test := myInsert('programovaci ', test, pos('techniky', test));
	test := myDelete(test, pos(' malby', test), 6);
	test := test + '!';
	writeln('our test: ', test);


	writeln(realLength(r), realLength(test));
	

	writeln(r, ', pocet ''i'' v retezci: ', countI(r), ', Je nalezeno ''xyz'': ', find(r, 'xyz'), ', delka retezce: ', length(r), ' myDelete: ', myDelete(r, 5, 2));

end.
