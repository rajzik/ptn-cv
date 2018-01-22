var op1,op2:byte;
    operace:boolean;
    I:byte;
    
procedure Zamen(var A,B:byte);    
 var pom:byte;
 begin pom:=A;
       A:=B;
       B:=pom
 end;
 
procedure Vypis(A,B:byte; oper: boolean);
 begin write(A:2);
       if oper then write(' +') else write(' -');
       writeln(B:3,' = ?')
 end;       

begin Randomize;
      for I:=1 to 100 do begin
        op1:=Random(7)+1;
        op2:=Random(7)+1;
        if op1+op2<=7 then operace:=true
           else begin
             operace:=false;
             if op1<op2 then zamen(op1,op2); 
           end;
        vypis(op1,op2,operace)     
      end
end.