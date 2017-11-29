program prg;
uses StackObject;

type mujInt = integer;

var fr : zasobnik;
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


begin;
	fr.init();		

	while not eof do begin
		readln(r);
		GetMem(p, sizeof(r));
		mujInt(p^) := r;
		fr.vloz(p);
	end;

	fr.vypis(@Zpusob1, output);

	writeln('pocet: ');
	writeln(fr.pocet());
	
	fr.odeber(pom);

	writeln();
	fr.vypis(@Zpusob1, output);
	writeln('pocet: ');
	writeln(fr.pocet());
	
	fr.odeber(pom);

	writeln();
	fr.vypis(@Zpusob1, output);
	writeln('pocet: ');
	writeln(fr.pocet());
	
	fr.zrus();


	writeln('pocet: ');
	writeln(fr.pocet());
	
end.

{
	Object stack usage.
}