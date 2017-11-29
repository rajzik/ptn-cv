program prg;
uses mybigset;


var test, test2, test3 : bigset;



begin;
	init(test2);
	init(test3);
	
	init(test);
	test2[63] := 1;
	test3[63] := 1;
	writeln('Next line should be true'); 
	writeln(test2 = test3);
	writeln('Next line should be true');
	writeln(test = test);
	writeln('Next line should be false');
	writeln(test = test2);	
end.

