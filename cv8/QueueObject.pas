unit QueueObject;

interface 

type
 
	DataItem = pointer;
	vypisTyp = function (data : DataItem) : string;
	
	PListItem = ^ListItem;
	ListItem = record
		data : DataItem;
		next : PListItem;
	end;
	
	fronta = object 
		{Data}
		first : PListItem;
		{Methods}
		constructor init();
		procedure vloz (p: DataItem);		
		procedure odeber (var data: DataItem);
		procedure vypis (jak : vypisTyp; var T : text);
		function pocet(): integer;
		function jePrazdna(): boolean;
		destructor zrus ();
	end;
	Pfronta = ^fronta;






implementation


constructor fronta.init ();
begin
	first := NIL;
end;

procedure fronta.vloz (p: DataItem);
var pom1 : PListItem;
begin
	if jePrazdna() then begin 
		new (first);
		first^.data := p;
		first^.next := nil;
	end else begin
		new(pom1);
		pom1^.next := first;
		pom1^.data := p;
		first := pom1;
	end;
end;





procedure fronta.odeber (var data : DataItem);
var pom, pom2 : PListItem;
begin
	if jePrazdna() then begin
		 data := nil;
	end 
	else if first^.next = nil then begin
		data := first^.data;
		dispose (first);
		first := nil;	
	end else begin 
	pom := first;
	while pom^.next <> nil do begin
		pom2 := pom;	
		pom := pom^.next;
	end;
	pom2^.next := nil;
	data := pom^.data;
	dispose(pom);
	end;
end;

procedure fronta.vypis (jak : vypisTyp; var T: text);
var pom : PListItem;

begin 
	pom := first;
	while (pom <> NIL) do begin
		writeln(T, jak(pom^.data));	
		pom := pom^.next;
	end;
end;

function fronta.jePrazdna(): boolean;
begin
	jePrazdna := first = NIL;
end;


function fronta.pocet(): integer;
var i : integer;
	pom : PListItem;
begin
	i := 0;
	pom := first;
	while pom <> nil do begin
		i := i + 1;
		pom := pom^.next;
	end;
	pocet := i;
end;

destructor fronta.zrus ();
var data : dataItem;
begin
	repeat 
		odeber(data);
	until jePrazdna(); 

end;


end.
