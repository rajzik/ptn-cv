unit mybigset;

interface 

const maxn = 511;
	maxbs=(maxn+1) div 8;
type rbigset = 0..maxn;
	rimpbs = 0..maxbs - 1;
	bigset = array [rimpbs] of byte;

procedure init(var b:bigset);


operator = (a, b:bigset) equals : boolean;


implementation

procedure init(var b:bigset); 

begin
	FillChar(b, sizeof(b), 0);
end;



{
	Some black pascal magic.
	When I wrote this, only Hala and I understood what I was doing.
	Now, Hala only knows
}
operator = (a, b : bigset) equals : boolean;
type myrbs = 1 .. maxbs;
	myrbsExtended = 0 .. maxbs;
	mybs = array [myrbs] of byte;
{
	black magic of retyping with same address.
}
var mya : mybs absolute a;
	myb : mybs absolute b;
	 i : myrbsExtended; 
	
begin
	i := 0;	 
	repeat
		inc(i);
	until (not (mya[i] = myb[i])) or (i = high(myrbsExtended));

	equals := mya[i] = myb[i];
end;


end.
