program prg;
uses Queue;

var fronta : PQueue;
	r: string;
	p: DataItem;
	counter : longint;


function podleVelikosti(A, B: DataItem) : boolean;

begin
	podleVelikosti := string(A^) > string(B^);
end;

function Zpusob1(A: DataItem): string;
var pom : string;
begin;
	inc(counter);
	str(counter:5, pom);
	Zpusob1 := pom + ': ' + string(A^);

end;


begin;
	Init(fronta, @podleVelikosti);		


	while not eof do begin
		readln(r);
		GetMem(p, Length(r) + 1);
		string(p^) := r;
		qInsert(fronta, p);
	end;

	qPrint(fronta, @Zpusob1, output);
end.

