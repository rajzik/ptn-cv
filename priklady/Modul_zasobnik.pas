unit Modul_zasobnik;
interface
type Hodnota = pointer;
     UkPrvek = ^Prvek;
     Prvek = record
        data: Hodnota;
        dalsi: Ukprvek
     end;  

     TypNerovno = function (A, B: hodnota): boolean;

     Zasobnik = record
       vrchol: UkPrvek;
       PHod: Hodnota;
       Nerovno: TypNerovno
     end;  
    
procedure Z_Init(var X: zasobnik; N: TypNerovno);

procedure Z_Push(var X: zasobnik; H: Hodnota);

procedure Z_Pop(var X: zasobnik; var H:Hodnota);

function Z_Empty(X: zasobnik): boolean;
     
implementation

procedure Z_Init(var X: zasobnik; N: TypNerovno);
 begin X.Vrchol:=nil;
       X.PHod:=nil;
       X.Nerovno:=N
 end;
 
function JeVZas(X: Zasobnik; H: Hodnota): Boolean;
 var Pom: UkPrvek;
 begin Pom:=X.Vrchol;
       while (Pom<>nil) and (Nerovno(H,Pom^.data)) do
          Pom:=Pom^.dalsi;
       JeVZas:=Pom<>nil   
 end; 
 
procedure Z_Push(var X: zasobnik; H: Hodnota);
 var Pom: UkPrvek;
 begin if not JeVZas(X, H) then begin
         new(Pom);
         Pom^.data:=H;
         Pom^.dalsi:=X.Vrchol;
         X.Vrchol:=Pom
       end  
 end;

procedure Z_Pop(var X: zasobnik; var H:Hodnota);
 var Pom: UkPrvek;
 begin if not Z_Empty(X) then begin
          Pom:=X.Vrchol;
          X.Vrchol:=X.Vrchol^.dalsi;
          H:=Pom^.data;
          dispose(Pom)
       end // else Error('odebrání z prázdného zásobníku')
 end;

function Z_Empty(X: zasobnik): boolean;
 begin Z_Empty:=X.Vrchol=nil
 end;
     
end.