{Implementujte prioritní frontu s obecnými datovými složkami pomocí
dvousměrného dynamického lineárního seznamu.  Operace: Inicializace, detekce
prázdnosti fronty, vložení prvku, odebrání prvku, výpis fronty do textového souboru.

Pro zjištění priority obecných datových složek připravte vhodnou vnější
funkci.  Rovněž pro způsob výpisu obecných složek do textového souboru
připravte vhodnou vnější funkci.
}


unit linearniseznam;
interface

type Prvek = pointer;

     TypRelace = function (A, B: Prvek): boolean;
     TypVzhled = function (A: Prvek): string;
     
     UkClen = ^Clen;

     Clen = record
       Data: Prvek;
       Predchozi, Dalsi: UkClen;
     end;

     PFronta = record
       Zac: UkClen;
       Srovnej: TypRelace
     end;

procedure Init(var F: PFronta; Jak: TypRelace);
function Prazdna(F: PFronta): boolean;
procedure Vloz(var F: PFronta; P: Prvek);
procedure Odeber(var F: PFronta; var P: Prvek);
procedure Vypis(F: PFronta; Jak: TypVzhled; var T: text); 

implementation

procedure Init(var F: PFronta; Jak: TypRelace);
 begin F.Zac:=nil;
       F.Srovnej:=Jak
 end;

function Prazdna(F: PFronta): boolean;
 begin Prazdna:=F.Zac=nil
 end;

procedure Vloz(var F: PFronta; P: Prvek);
 var Pom, nova: UkClen;
 begin if Prazdna(F) then begin
          new(F.Zac);
          F.Zac^.Data:=P;
          F.Zac^.Predchozi:=nil;
          F.Zac^.Dalsi:=nil
       end else begin
          Pom:=F.Zac;
          while (Pom^.Dalsi<>nil) and (not F.Srovnej(P,Pom^.Data)) do 
                Pom:=Pom^.Dalsi;
          if not F.Srovnej(P, Pom^.Data) then begin// na konec -> za Pom
             new(Pom^.Dalsi);
             Pom^.Dalsi^.Predchozi:=Pom;
             Pom:=Pom^.Dalsi;
             Pom^.Data:=P;
             Pom^.Dalsi:=nil
          end else begin // doprostřed -> před Pom
             new(Nova);
             Nova^.Dalsi:=Pom;
             Nova^.Predchozi:=Pom^.Predchozi;
             Pom^.Predchozi:=Nova;
             if Nova^.Predchozi<>nil then Nova^.Predchozi^.Dalsi:=Nova
                else F.Zac:=Nova;
             Nova^.Data:=P
          end
       end;
 end;

procedure Odeber(var F: PFronta; var P: Prvek);
 var Pom: UkClen;
 begin if not Prazdna(F) then begin
          P:=F.Zac^.Data;
          Pom:=F.Zac;
          F.Zac:=F.Zac^.Dalsi;
          dispose(Pom)
       end
 end;

procedure Vypis(F: PFronta; Jak: TypVzhled; var T: text); 
 var Pom: UkClen;
 begin Pom:=F.Zac;
       while Pom<>nil do begin
          writeln(T, Jak(Pom^.Data));
          Pom:=Pom^.Dalsi
       end
 end;

end.