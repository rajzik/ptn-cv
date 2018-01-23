{
    Definujte dva polymorfní objekty Fronta a 
Prioritní fronta s metodami vkládání a odebrání prvku. 
Vkládané hodnoty jsou reprezentovány obecnými ukazateli, 
rozhodnutí o prioritě řeší funkce nastavená při inicializaci v 
objektu Prioritní fronta v odpovídající datové složce. 
Jako základní datovou strukturu použijte pole o 10000 prvcích. 
Definujte všechny potřebné datové typy a těla všech metod.


}

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



{
	copy of Queue.pas
}

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
