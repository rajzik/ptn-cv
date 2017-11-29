
unit PriorityQueue;

interface 
uses Queue;

type 
	prioritniFunkce = function (A, B: DataItem) : boolean;
	
	prioritniFronta = fronta; 
	DataItem = Queue.DataItem;
		
	PListItem = ^ListItem;
	ListItem = Queue.ListItem;
	
	

procedure swp (var A, B: DataItem); 
procedure init (var s : prioritniFronta);

procedure vloz (var s : prioritniFronta; p: DataItem; prioritniFce : prioritniFunkce);

procedure odeber (var s : prioritniFronta; var data: DataItem);
procedure vypis (var s : prioritniFronta; jak : vypisTyp; var T : text);
function pocet(s:prioritniFronta): integer;
function jePrazdna(s:prioritniFronta): boolean;

procedure zrus (var s: prioritniFronta);

implementation

{
	Helper function for swapping two DataItems
}
procedure swp (var A, B: DataItem); 
var tempData : DataItem;
begin
	tempData := A;
	A := B;
	B := tempData;
end;

procedure init (var s : prioritniFronta);
begin
	Queue.init(s);
end;


{
	Inserting in sorted list 

	Add new item at start of queue. 
	sort afterwards. 
	Modified bubble sort -> it's already sorted.

}
procedure vloz (var s : prioritniFronta; p: DataItem; prioritniFce : prioritniFunkce);
var pom1, pom2 : PListItem;
begin 
	Queue.vloz(s, p);
	
	pom1 := s.first;
	pom2 := pom1^.next;

	while ((pom2<> nil) and prioritniFce(pom1^.data, pom2^.data)) do begin
		swp(pom1^.data, pom2^.data);
		pom1 := pom1^.next;
		pom2 := pom2^.next;
	end;

end;

procedure odeber (var s : prioritniFronta; var data: DataItem);
begin
	Queue.odeber(s, data);
end;

procedure vypis (var s : prioritniFronta; jak : vypisTyp; var T : text);
begin
	Queue.vypis(s, jak, T);
end;

function pocet(s:prioritniFronta): integer;
begin
	pocet := Queue.pocet(s);
end;

function jePrazdna(s:prioritniFronta): boolean;
begin
	jePrazdna := Queue.jePrazdna(s);
end;

procedure zrus (var s: prioritniFronta);
begin
	Queue.zrus(s);
end;

end.
