unit tree;
interface 

type 

pData = integer;


pUzel = ^uzel;
uzel = record
	data : pData;
	counter : byte;
	left, right : pUzel;	
end;


strom = object
	root : pUzel;
	constructor init();
	function jePrazdna() : boolean;
	procedure vloz(p : pData);
	function odeber(p : pData) : pUzel;
	procedure inOrder();
	procedure preOrder();
	procedure postOrder();
	destructor zrus();
end;



implementation

constructor strom.init();
begin
	root := nil;
end;


function strom.jePrazdna() : boolean;
begin
	jePrazdna := root = nil;
end;

procedure strom.vloz(p : pData);
	procedure insertIn(var r:pUzel; d : pData);
	begin
		if (r = nil) then begin
			new(r);
			r^.data := d;
			r^.left := nil;
			r^.right := nil;
			r^.counter := 1;
		end else if r^.data = d then begin
			r^.counter := succ(r^.counter);
		end
		else
			if d < r^.data then insertIn(r^.left, d)
						else insertIn(r^.right, d); 
	end;

begin
	insertIn(root, p);
end;

function strom.odeber(p : pData) : pUzel;
	function minValueNode(node : pUzel) : pUzel;
	var temp :pUzel;
	begin
		temp := node;
		while temp^.left <> nil do temp := temp^.left;
		minValueNode := temp;
	end;
	function deleteNode(node : pUzel; d : pData) : pUzel;
	var temp : pUzel;
	begin
		if (node = nil) then begin
			deleteNode := nil;
		end
		else if p < node^.data then begin 
			node^.left := deleteNode(node^.left, d);
			deleteNode := node;
		end else if p > node^.data then begin 
			node^.right := deleteNode(node^.right, d);
			deleteNode := node;
		end else begin
			if node^.counter > 1 then begin
				writeln(node^.counter);
				node^.counter := node^.counter - 1;
				writeln(node^.counter);
				deleteNode := node;
			end else if node^.left = nil then begin
				deleteNode := node^.right;
			end else if node^.right = nil then begin	
				deleteNode := node^.left;
			end else begin
				temp := minValueNode(node^.right);
				node^.data := temp^.data;
				node^.counter := temp^.counter;
				temp^.counter := 1;
				node^.right := deleteNode(node^.right, temp^.data);
				deleteNode := node;
			end;
		end;
	end;

var temp : pUzel;

begin
temp := deleteNode(root, p);

odeber := temp;

end;

procedure printFunction(r : pUzel);
begin
write('pocet: ');
write(r^.counter);
write(', data: ');
writeln(r^.data);
end;


procedure strom.inOrder();
	procedure inOrderPrint(r : pUzel);
	begin
		if (r <> nil) then begin
			inOrderPrint(r^.left);
			printFunction(r);
			inOrderPrint(r^.right);
		end;
	end;
begin
	inOrderPrint(root);
end;
procedure strom.preOrder();

	procedure preOrderPrint(r : pUzel);
	begin
		if (r <> nil) then begin
			printFunction(r);
			preOrderPrint(r^.left);
			preOrderPrint(r^.right);
		end;
	end;
begin
	preOrderPrint(root);
end;
procedure strom.postOrder();
	procedure postOrderPrint(r : pUzel);
	begin
		if (r <> nil) then begin
			postOrderPrint(r^.left);
			postOrderPrint(r^.right);
			printFunction(r);
		end;
	end;
begin
	postOrderPrint(root);
end;

destructor strom.zrus();
begin
	while ( not jePrazdna() ) do begin
		odeber(root^.data);	
	end;
end;


end.
