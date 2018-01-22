unit oboustranyseznam;

interface 

type dataItem = pointer;

    plist = ^list;
    list = object
        data: dataItem;
        next, prev: plist;

        constructor init;
        procedure add(d: dataItem);
        procedure remove(d: dataItem);
    end;


implementation
    constructor list.init;
    begin
        data:= nil;
        next := nil;
        prev := nil;
    end;
    procedure list.add(d: dataItem);
    var newItem : list;
        test : plist;
    begin
        if (data = nil) then data := d
        else begin
            newItem.init;
            newItem.data := d;
            prev^ := newItem;
            newItem.next^ := self;
            newItem.prev := nil;
        end;
    end;
    procedure list.remove(d: dataItem);
    var current : list;
    begin
        current := self;
        while (current.next <> nil) and (current.data <> d) do begin
            current := current.next^;
        end;

        if current.data = d then begin
            current.next^.prev := current.prev;
            current.prev^.next := current.next;
        end;
    end;
end.