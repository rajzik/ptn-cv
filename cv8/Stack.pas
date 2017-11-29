
unit Stack;

interface 
uses Queue;

type zasobnik = fronta;
	DataItem = Queue.DataItem;
		
	PListItem = ^ListItem;
	ListItem = Queue.ListItem;


procedure init (var s : zasobnik);

procedure vloz (var s : zasobnik; p: DataItem);

procedure odeber (var s : zasobnik; var data: DataItem);
procedure vypis (var s : zasobnik; jak : vypisTyp; var T : text);
function pocet(s:zasobnik): integer;
function jePrazdna(s:zasobnik): boolean;

procedure zrus (var s: zasobnik);

implementation

procedure init (var s : zasobnik);
begin
	Queue.init(s);
end;



procedure vloz (var s : zasobnik; p: DataItem);
begin 
	Queue.vloz(s, p);
end;
procedure odeber (var s : zasobnik; var data: DataItem);
var pom : PListItem;
begin 
	if jePrazdna(s) then begin
		data := nil;
	end
	else if s.first^.next = nil then begin
		data := s.first^.data;
		dispose(s.first);
	end else begin
		data := s.first^.data;
		pom := s.first;
		s.first := pom^.next;
		dispose(pom);
	end;
end;

procedure vypis (var s : zasobnik; jak : vypisTyp; var T : text);
begin
	Queue.vypis(s, jak, T);
end;
function pocet(s:zasobnik): integer;
begin
	pocet := Queue.pocet(s);
end;

function jePrazdna(s:zasobnik): boolean;
begin
	jePrazdna := Queue.jePrazdna(s);
end;


procedure zrus (var s: zasobnik);
begin 
	Queue.zrus(s);
end;


end.
