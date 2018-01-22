{1. Je dán lineární jednosměrný dynamický seznam s datovou složkou typu
pointer.  Napište funkci, která vybere z tohoto seznamu prvek s minimální
hodnotou a nabude hodnoty ukazatele na tuto hodnotu.  Pro porovnání hodnot
připravte vhodný podprogram, který bude předán jako parametr této funkci. 
Dalším parametrem bude ukazatel na seznam.  Doplňte všechny potřebné
definice datových typů.}

type UkSeznam = ^Seznam;
     Seznam = record
        Data: pointer;
        Dalsi: UkSeznam;
     end;
     
procedure Porovnej(A,B: UkSeznam): boolean;
  begin Porovnej:=A^<B^
  end;
     

function MinPrvek(S: UkSeznam; @Porovnej): pointer;
    var pred, pom, min: UkDalsi
    begin If S<>nil do begin
             min:=S;
             Pom:=S;
             while Pom<>nil do begin
                if Porovnej(Pom^.Data, Min^.Data) then Min:=Pom;
                Pom:=Pom^.Dalsi;
             end;
             MinPrvek:=Pom^.Data;
          end;    
    end;

{2. Vytvořte proceduru, která z jednosměrného dynamického lineárního
seznamu odstraní prvek, jehož hodnota je zadána ve druhém parametru.  Prvním
parametrem je ukazatel na začátek seznamu.  Hodnoty jsou typu reálných
čísel.  Předpokládejte, že se zadaná hodnota v seznamu nachází nejvýše
jednou.  Doplňte všechny potřebné definice datových typů.}

type UkSeznam = ^Seznam;
     Seznam = record
        Data: real;
        Dalsi: UkSeznam;
     end;

procedure (var S: UkSeznam; Hledana: real);
  var Pom, pred: UkPrvek;
  begin if S<>nil then begin
            Pom:=S;
            pred:=nil;
            while (Pom<>nil) and (Pom^.Data<>Hledana) do begin
              pred:=Pom;
              Pom:=Pom^.Dalsi;
            end;
            if Pom<>nil then begin
              pred^.Dalsi:=Pom^.Dalsi;
              write(Pom^.Data);
              dispose(Pom);          
            end;
              
        end;
  end;

{3. Předpokládejte, že na standardním vstupu jsou na každém řádku údaje o
obrazových objektech.  Prvním údajem je typ objektu (kružnice, úsečka,
obdélník) a za ním jsou rozměrové údaje (u kružnice poloměr, u úsečky délka
a sklon, u obdélníku velikost jeho hran).  Vytvořte soubor bez udání typu s
názvem 'obraz.vec', do něhož uložíte všechny údaje ze vstupu.}

type  kruznice = object
        polomer: real;
      end;
      
      usecka = object
        delka: real;
        sklon: real;
      end;
      
      obdelnik = object
        VelikostHran: real;
      end;
        

var F: file;
    Typ: byte; {[0,1,2] - typ objektu}
    Kruznice: Kruznice  //objekty
    usecka: Usecka;
    obdelnik: obdelnik;
    

begin assign(F, 'obraz.vec');
      rewrite(F, 1);
      while not eof do begin
          read(Typ);
          if Typ=0 then begin 
              readln(Kruznice.polomer);
              blockwrite(F, Kruznice, sizeOf(kruznice));
          end else if Typ=1 then begin
              readln(usecka.delka, usecka.sklon);
              blockwrite(F, Usecka, sizeOf(usecka));
          end else if Typ=2 then begin
              readln(obdelnik.VelikostHran);
              blockwrite(F, obdelnik, sizeOf(obdelnik));
          end;
          
      end;

end.

{4. Navrhněte implementaci datového typu "množina řetězců s délkou do 50
znaků" pomocí dynamické struktury.  Realizujte operaci inicializace
(vytvoření prázdné množiny) a operaci průniku dvou takových množin.}

type Mnozina = set of UkRet; {mnozina retezcu}
      UkRet = ^Ret;
      Ret = String[50];


procedure Init(var M: mnozina);
  begin M:=[];
  end;

procedure Prunik(A,B: Mnozina): Mnozina;
  begin Prunik:=A*B;    
  end;
