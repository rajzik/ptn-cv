
unit StackObject;

interface 
uses QueueObject;

type 


	DataItem = QueueObject.DataItem;
		
	PListItem = ^ListItem;
	ListItem = QueueObject.ListItem;

	zasobnik = object(fronta)
	        procedure odeber (var data: DataItem);
	end;


implementation

procedure zasobnik.odeber (var data: DataItem);
var pom : PListItem;
begin 
	if jePrazdna() then begin
		data := nil;
	end
	else if first^.next = nil then begin
		data := first^.data;
		dispose(first);
	end else begin
		data := first^.data;
		pom := first;
		first := pom^.next;
		dispose(pom);
	end;
end;

end.


{
	Inheritance
	Rewriting only pop function.
	rest is already implemented.
	See QueueObject.pas
}
