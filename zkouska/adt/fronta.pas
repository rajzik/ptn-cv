unit fronta;

interface 

type 
	DataItem = pointer;

	PItem = ^Item;
	Item = record
		data : DataItem;
		prev, next : PItem;
	end;

	RelationType = function ( A, B: DataItem) : boolean;
	DesignType = function (A : DataItem) : string;

	
	PQueue = record 
		first : PItem;
		how : RelationType;
	end;

procedure Init (var q : PQueue; how : RelationType);
procedure qInsert (var q : PQueue; p: DataItem);
function qRemove (var q : PQueue) : DataItem;
procedure qPrint (var q : PQueue; how : DesignType; var T: text);
function qIsEmpty(q:PQueue): boolean;

implementation


procedure Init (var q : PQueue; how : RelationType);
begin
	q.first := NIL;
	q.how := how;
end;

procedure qInsert (var q : PQueue; p: DataItem);
var pom1, pom2 : PItem;
	pomItem : DataItem;
begin
	if qIsEmpty(q) then begin 
		new (q.first);
		q.first^.data := p;
		q.first^.next := nil;
		q.first^.prev := nil;
	end else begin
		new(q.first^.prev);
		q.first^.prev^.next := q.first;
		q.first^.data := p;
		pom1 := q.first;
		pom2 := pom1^.next;
		while (pom2<>nil) and q.how(pom1^.data, pom2^.data) do begin
			pomItem := pom1^.data;
			pom1^.data := pom2^.data;
			pom2^.data := pomItem;
			pom1:= pom2;
			pom2:= pom1^.next;
		end;
	end;

end;

function qRemove (var q : PQueue) : DataItem;
var pom : PItem;
	d : DataItem;
begin
	if qIsEmpty(q) then begin
		 qRemove := nil;
	end;
	pom := q.first;	
	if (pom <> nil) then begin
		q.first := pom^.next;
		d := pom^.data;
		dispose(pom);
		qRemove := d;
	end;
	qRemove := nil;
end;

procedure qPrint (var q : PQueue; how : DesignType; var T: text);
var pom : PItem;

begin 
	pom := q.first;
	while (pom <> NIL) do begin
		writeln(T, how(pom^.data));	
		pom := pom^.next;
	end;
end;

function qIsEmpty(q : PQueue): boolean;
begin
	qIsEmpty := q.first = NIL;
end;

end.
