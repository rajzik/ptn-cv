uses fronta_objekt;

type MojeData = record
       Podklad_prefix: string;
       PocMezer: byte
     end;  

     UkMojedata = ^Mojedata;

var S: string; 
    F: Fronta;
    P: pointer;
    M: MojeData;
    I: byte;

function MojePriorita(X, Y: pointer): boolean;
 begin MojePriorita:=MojeData(X^).PocMezer<=Mojedata(Y^).PocMezer;
       if MojeData(X^).PocMezer=Mojedata(Y^).PocMezer then
          MojePriorita:=MojeData(X^).Podklad_prefix<=Mojedata(Y^).Podklad_prefix
 end;
    
begin F.Fr_Init;
      while not eof do begin
        readln(S);
        M.Podklad_prefix:=Copy(S,1,20);
        M.PocMezer:=0;
        for I:=1 to Length(S) do
          if S[I]=' ' then Inc(M.PocMezer);
          
        GetMem(P,SizeOf(M));
        MojeData(P^):=M;
        F.Fr_Vloz(P, @MojePriorita)
      end;

      while not F.Fr_Prazdny do begin
        P:=F.Fr_Odeber;
        writeln(MojeData(P^).PocMezer:3, ': ', Mojedata(P^).Podklad_prefix);
        FreeMem(P, SizeOf(M))
      end  
end.