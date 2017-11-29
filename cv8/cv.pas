program prg;
uses PriorityQueue;

type mujInt = integer;

var fr : PrioritniFronta;
	r: mujInt;
	p, pom: DataItem;
	counter : longint;

	

function Zpusob1(data: DataItem): string;
var pom, pom2 : string;
	
begin;
	inc(counter);
	str(counter:5, pom);
	str(mujInt(data^), pom2);
	Zpusob1 := pom + ': ' + pom2;

end;

function prio(A,B: DataItem) : boolean;
begin
	write('prio; ');
	prio :=	mujInt(A^) > mujInt(B^);
	writeln(prio);
end;



begin;
	Init(fr);		

	while not eof do begin
		readln(r);
		GetMem(p, sizeof(r));
		mujInt(p^) := r;
		vloz(fr, p, @prio);
	end;

	vypis(fr, @Zpusob1, output);

	writeln('pocet: ');
	writeln(pocet(fr));
	
	odeber(fr, pom);

	writeln();
	vypis(fr, @Zpusob1, output);
	writeln('pocet: ');
	writeln(pocet(fr));
	
	odeber(fr, pom);

	writeln();
	vypis(fr, @Zpusob1, output);
	writeln('pocet: ');
	writeln(pocet(fr));
	
	zrus(fr);


	writeln('pocet: ');
	writeln(pocet(fr));
	
end.

