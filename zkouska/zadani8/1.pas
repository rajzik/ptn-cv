{
Definujte dva polymorfní objekty. 
První implementuje uspořádaný binární strom řetězců, kde platí, 
že řetězce v levém podstromu jsou podle abecedy dříve než v daném uzlu, 
hodnoty v pravém podstromu jsou později než v daném uzlu. 
Operace: inicializace, 
vložení řetězce, 
uspořádaný výpis obsahu stromu podle abecedy do textového souboru. 
Druhý objekt uspořádává řetězce podle délky -- delší řetězce vlevo a kratší
vpravo z daného uzlu.
}
unit 1
interface
type 
  pstrom = ^strom;
  strom = object begin
        left, right : pstrom;
        data: string;
        constructor init();
        procedure add(item: string); virtual;
        procedure print(var f: file);
    end;

    plenstrom = ^lenstrom;
    lenstrom = object(strom) begin
        procedure add(item : string);
    end;
  
    pAlphastrom = ^alphaStrom;
    alphaStrom = object(strom) begin
        procedure add(item: string);
    end;
    compareFunction = function(A, B:string) : boolean;

implementation

constructor strom.init();
begin
  left := nil;
  right := nil;
  data := nil;
end;
  


procedure inOrder(var f : file, var root: pstrom);

begin
  if (root <> nil) then begin
    inOrder(f, root^.left);
    writeln(f, root^.data);
    inOrder(f, root^.right);
  end;
end;

procedure strom.print(var f : file);

begin
  inOrder(f, @self);
end;




procedure insert(root: pstrom; item: string; jak: compareFunction);

begin
    if root = nil then begin
        root^.data := item;
        root^.left := nil;
        root^.right := nil;
    end else begin
        if jak(root^.data, item) then insert(root^.left, item, @jak)
            else insert(root^.right, item, @jak);
    end;
end;


procedure lenstrom.add(item: string);
function cmp(A,B:string):boolean;
begin
    cmp := length(A) <= length(B);
end;


begin
    insert(@self, item, @cmp);
end;


procedure alphaStrom.add(item: string);
function cmp(A,B:string):boolean;
begin
    cmp := A <= B;
end;
begin
    insert(@self, item, @cmp);
end;
