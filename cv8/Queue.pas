unit Queue;

interface 

type
 
	DataItem = pointer;
	vypisTyp = function (data : DataItem) : string;
	
	PListItem = ^ListItem;
	ListItem = record
		data : DataItem;
		next : PListItem;
	end;
	
	fronta = record 
		first : PListItem;
	end;
	Pfronta = ^fronta;

procedure init (q : fronta);
procedure vloz (var q : fronta; p: DataItem);

procedure odeber (var q : fronta; var data: DataItem);
procedure vypis (var q : fronta; jak : vypisTyp; var T : text);
function pocet(q:fronta): integer;
function jePrazdna(q:fronta): boolean;

procedure zrus (var q: fronta);



implementation


procedure init (q : fronta);
begin
	q.first := NIL;
end;

procedure vloz (var q : fronta; p: DataItem);
var pom1 : PListItem;
begin
	if jePrazdna(q) then begin 
		new (q.first);
		q.first^.data := p;
		q.first^.next := nil;
	end else begin
		new(pom1);
		pom1^.next := q.first;
		pom1^.data := p;
		q.first := pom1;
	end;

end;





procedure odeber (var q : fronta; var data : DataItem);
var pom, pom2 : PListItem;
begin
	if jePrazdna(q) then begin
		 data := nil;
	end 
	else if q.first^.next = nil then begin
		data := q.first^.data;
		dispose (q.first);
		q.first := nil;	
	end else begin 
	pom := q.first;
	while pom^.next <> nil do begin
		pom2 := pom;	
		pom := pom^.next;
	end;
	pom2^.next := nil;
	data := pom^.data;
	dispose(pom);
	
	end;
end;

procedure vypis (var q : fronta; jak : vypisTyp; var T: text);
var pom : PListItem;

begin 
	pom := q.first;
	while (pom <> NIL) do begin
		writeln(T, jak(pom^.data));	
		pom := pom^.next;
	end;
end;

function jePrazdna(q:fronta): boolean;
begin
	jePrazdna := q.first = NIL;
end;



function pocet(q:fronta): integer;
var i : integer;
	pom : PListItem;
begin
	i := 0;
	pom := q.first;
	while pom <> nil do begin
		i := i + 1;
		pom := pom^.next;
	end;
	pocet := i;
end;

procedure zrus (var q: fronta);
var data : dataItem;
begin
	repeat 
		odeber(q, data);
	until jePrazdna(q); 

end;


end.
