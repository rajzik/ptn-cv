{1. Je dán lineární jednosměrný dynamický seznam s datovou složkou typu pointer.
Napište funkci, která vybere z tohoto seznamu prvek s minimální hodnotou a
nabude hodnoty ukazatele na tuto hodnotu.  Pro porovnání hodnot připravte
vhodný podprogram, který bude předán jako parametr této funkci.  Dalším
parametrem bude ukazatel na seznam.  Doplňte všechny potřebné definice
datových typů.}

type UkPrvek=^Prvek;
     Prvek = record
       Data: pointer;
       Dalsi: UkPrvek
     end;
     TypPorov = function (A, B: pointer): shortint;
     // "A">"B" -> 1, rovnost -> 0, jinak -1

function VyberMax(S: UkPrvek; Porov: TypPorov): pointer;
 var Pom: UkPrvek; UkMax: pointer;
 begin Pom:=S; VyberMax:=nil; // kdyby seznam byl prázdný
       if Pom<>nil then begin
          UkMax:=Pom^.Data;
          Pom:=Pom^.Dalsi;
          while Pom<>nil do begin
            if Porov(Pom^.Data, UkMax)=-1 then UkMax:=Pom^.Data;
            Pom:=Pom^.Dalsi
          end;
          VyberMax:=UkMax
       end
 end;

{2. Navrhněte implementaci datového typu "množina řetězců s délkou do 50 znaků"
pomocí dynamické struktury.  Realizujte operaci inicializace (vytvoření
prázdné množiny) a operaci průniku dvou takových množin.}

type TypRet = string[50]; // prvek množiny
     UkPrvek = ^Prvek;    // realizace lineárním seznamem
     Prvek = record
       Data: TypRet;
       Dalsi: UkPrvek
     end;
     RetSet = UkPrvek;    // množina je reprezentována ukazatelem na seznam
     
procedure Init(var R: RetSet);
 begin R:=nil  // prázdná množina má 0 prvků
 end;     

procedure Prunik(A, B: RetSet; var C: RetSet);
// nový seznam C obsahuje prvky obsažené v A a zároveň v B
 var Pom, Novy: UkPrvek;
 function Nalezeno(Co, Kde: UkPrvek): boolean;
  begin // pro průchod použijeme ukazatel Kde, je volán hodnotou
        while (Kde<>nil) and (Co^.Data<>Kde^.Data) do 
           Kde:=Kde^.Dalsi;  // algoritmus sekvenčního hledání
        Nalezeno:=Kde<>nil
  end;
 begin Pom:=A; // projdeme A a vyhledáme v B. Nalezené umístíme do C
       Init(C);
       while Pom<>nil do begin
         if Nalezeno(Pom, B) then begin // přidání
            new(Novy);
            Novy^.Dalsi:=C;
            Novy^.Data:=Pom^.Data;
            C:=Novy
         end;
         Pom:=Pom^.Dalsi
       end
 end;
 
 
{3. Vytvořte proceduru, která z jednosměrného dynamického lineárního seznamu
odstraní prvek, jehož hodnota je zadána ve druhém parametru.  Prvním
parametrem je ukazatel na začátek seznamu.  Hodnoty jsou typu reálných
čísel.  Předpokládejte, že se zadaná hodnota v seznamu nachází nejvýše
jednou.  Doplňte všechny potřebné definice datových typů.}

type UkPrvek = ^Prvek;
     Prvek = record
       Data: real;
       Dalsi: UkPrvek
     end;

procedure Odstran(var S: UkPrvek; Co: real);
 var Pom: UkPrvek;
 begin Pom:=S; Vpredu:=Pom;
       while (Pom<>nil) and (Pom^.Data<>Co) do begin
          Vpredu:=Pom;
          Pom:=Pom^.Dalsi
       end;
       if Pom<>nil then begin // nalezen prvek, odstraňujeme
          if Pom=S then begin // odstraňujeme první prvek
             S:=S^.Dalsi;
             dispose(Pom)
          end else begin      // odstraňujeme jiný prvek
             Vpredu^.Dalsi:=Pom^.Dalsi;
             dispose(Pom)
          end
       end
 end;


{4. Předpokládejte, že na standardním vstupu jsou na každém řádku údaje o
obrazových objektech.  Prvním údajem je typ objektu (kružnice, úsečka,
obdélník) a za ním jsou rozměrové údaje (u kružnice poloměr, u úsečky délka
a sklon, u obdélníku velikost jeho hran).  Vytvořte soubor bez udání typu s
názvem 'obraz.vec', do něhož uložíte všechny údaje ze vstupu.}

var F: file;
    C: char;  // typ objektu je na vstupu udán jedním znakem: k, u, o
    A, B: real;
    
begin Assign(F, 'obraz.vec');
      rewrite(F, 1);
      while not eof do begin
         read(C); blockwrite(F, C, 1);
         case C of
         'k': begin readln(A);
                  blockwrite(F, A, sizeof(real));
              end;
    'u', 'o': begin readln(A, B);
                  blockwrite(F, A, sizeof(real));
                  blockwrite(F, B, sizeof(real));
              end
         end
      end;
      Close(F)
end.         