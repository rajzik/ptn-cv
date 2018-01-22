type 
     ukUzel = ^Uzel;
     Uzel = record
       data: typdata;
       vlevo, vpravo: UkUzel
     end;
     
var Koren: UkUzel;

procedure Init(var K: UkUzel);
 begin K:=nil
 end;
 
procedure BVloz(var K: UkUzel; D: typdata);
 begin if K=nil then begin
          new(K);
          K^.data:=d;
          K^.vlevo:=nil;
          K^.vpravo:=nil
       end else 
          if D<=K^.data then BVloz(K^.Vlevo, D)
             else BVloz(K^.Vpravo, D)  
 end;        
 
procedure InOrder(K: UkUzel);
 begin if K<>nil then begin
          InOrder(K^.Vlevo);
          write(K^.data);
          InOrder(K^.Vpravo)
       end
 end;         






 