type Polozka = string;
//     UkPrvek = ^Prvek;
     Prvek = record
       Data: Polozka;
       Naslednik: ^Prvek
     end;
     
var P, jiny: ^Prvek;
    R: Polozka;

begin P:=nil;
      while not eof do begin
        readln(R);
        new(jiny);
        jiny^.Data:=R;
        jiny^.Naslednik:=P;
        P:=jiny
      end;
      jiny:=P;
      while jiny<>nil do begin
         writeln(jiny^.data);
         jiny:=jiny^.Naslednik
      end   
end.