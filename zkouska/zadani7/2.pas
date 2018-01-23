
(*2]
Předpokládejte, že existuje objekt typu Fronta implementující obyčejnou frontu řetězcových hodnot.
 
 Metodami objektu jsou Init (pro počáteční inicializaci), 
 QueUp (přidání do fronty), 
 Remove (odebrání prvku z fronty). 
 
 Vytvořte polymorfního následníka tohoto objektu, 
 který tuto obyčejnou frontu mění na frontu cestujících na lanovku,
 kdy každým odebráním z fronty zmizí 6 prvků (kapacita jedné kabinky) místo jednoho.

Do řešení napište potřebnou definici původního objektu Fronta pro implementaci fronty bez těl metod, datový typ nového objektu a těla POUZE JEHO metod.
*)





type 
    information = pointer;
    pQueue = ^queue;
    queue = object
        next : pQueue;
        data : information;

        constructor init;
        procedure QueUp(i: information);
        function remove: information;
    end;

    lanInformation = array[0..6] if information;
    lanQueue = object(queue)
        function remove: lanInformation;
    end;

    function lanQueue.remove: lanInformation;
    var i: integer;

    begin
        for i := 0 to 6 do begin
            remove[i] := inherited remove;
        end;
    end;



