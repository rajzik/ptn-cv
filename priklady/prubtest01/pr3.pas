{Předpokládejte, že na standardním vstupu jsou na každém řádku údaje o
křivkách.  Každá křivka je vždy na jednom řádku a může být popsána různým
počtem reálných čísel představujících pozice uzlových bodů.  Vytvořte soubor
bez udání typu, v němž bude vždy uložen počet uzlových bodů a za ním
příslušná reálná čísla patřící k dané křivce.  Diskové jméno výstupního
souboru je zadáno jako první řádek standardního vstupu.}

const MaxBodu = 100; {maximální počet uzlových bodů jedné křivky}
type Body = array [1..MaxBodu] of real;

var F: file;
    N: string;
    P: byte;
    B: Body;
    
begin if not eof then begin
         readln(N);
         assign(F, N);
         rewrite(F, 1);
         while not eof do begin
           P:=0;
           while not SeekEoln do begin
             Inc(P);
             read(B[P])
           end; 
           readln;
           BlockWrite(F, P, 1);
           BlockWrite(F, B, P*SizeOf(real)) 
         end;
         Close(F)
      end
end.      
     