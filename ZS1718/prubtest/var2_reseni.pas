{1. Vytvořte proceduru, která přidá na konec dvojsměrně svázaného seznamu
nový prvek, jehož datovou hodnotu dostane v parametru.  Dalším parametrem
procedury je ukazatel na začátek seznamu.  Prvek se však bude přidávat jen v
případě, že nová datová hodnota v seznamu dosud není.  Předpokládejte, že
data jsou celočíselného typu.  Doplňte všechny potřebné definice datových
typů.}

type UkPrvek = ^Prvek;
     Prvek = record
       Data: integer;
       Vpred, Vzad: UkPrvek
     end;

procedure Pridej(var S: UkPrvek; Co: integer);
 var Pom, Druhy: UkPrvek;
 begin
       if S=nil then begin // speciální případ: prázdný seznam
          new(S);
          S^.Vpred:=nil;
          S^.Vzad:=nil;
          S^.Data:=Co
       end else begin      // neprázdný seznam, hledá se Co
          Pom:=S; Druhy:=S;
          while (Pom<>nil) and (Pom^.Data<>Co) do begin
             Druhy:=Pom;   // ukazatel na předchůdce
             Pom:=Pom^.Vzad
          end;
          if Pom=nil then begin // nenalezeno -> přidává se
             // Druhy ukazuje na poslední prvek
             new(Druhy^.Vzad);
             Pom:=Druhy^.Vzad;
             Pom^.Vpred:=Druhy;
             Pom^.Vzad:=nil;
             Pom^.Data:=Co
          end
       end
 end;

{2. Je dán lineární jednosměrný dynamický seznam s datovou složkou typu
pointer.  Napište funkci, která vzájemně vymění datové složky dvou po sobě
jdoucích prvků, pokud nebudou svým pořadím vyhovovat.  Pro porovnání hodnot
připravte vhodný podprogram, který bude předán jako parametr této funkci. 
Dalším parametrem bude ukazatel na seznam.  Doplňte všechny potřebné
definice datových typů.}

type UkPrvek = ^Prvek;
     Prvek = record
       Data: pointer;
       Dalsi: UkPrvek
     end;
     
     TypPorov = function (A, B: pointer): boolean;
     
function Vymena(S: UkPrvek; Vyhovuje: TypPorov): boolean;
 var Pom: UkPrvek; Pomdata: pointer;
 begin if (S=nil) or (S^.Dalsi=nil) then Vymena:=false
       else begin
         Vymena:=true;
         Pom:=S;
         while Pom^.Dalsi<>nil do begin
            if not Vyhovuje(Pom^.Data, Pom^.Dalsi^.Data) then begin
               Pomdata:=Pom^.Data;
               Pom^.Data:=Pom^.Dalsi^.Data;
               Pom^.Dalsi^.Data:=Pomdata
            end;
            Pom:=Pom^.Dalsi
         end
       end
 end;


{3. Navrhněte implementaci datového typu "množina reálných čísel" pomocí
dynamické struktury.  Realizujte operaci inicializace (vytvoření prázdné
množiny) a operaci sjednocení dvou takových množin.}

type 
     UkPrvek = ^Prvek;
     Prvek = record
       Data: real;
       Dalsi: UkPrvek
     end;
     RealSet = UkPrvek;

procedure Init(var R: RealSet);
 begin R:=nil
 end;
 
procedure VlozPrvek(var R: RealSet; H: real);
 var Novy: UkPrvek;
 begin new(Novy);
       Novy^.Data:=H;
       Novy^.Dalsi:=R;
       R:=Novy;
 end;
  
procedure Sjednot(A, B: RealSet; var C: RealSet);
// nový seznam C bude obsahovat všechny prvky A a dosud neobsažené prvky B
 var Pom, Novy: UkPrvek;
 function Nalezeno(Co: real; Kde: UkPrvek): boolean;
  // sekvenční hledání v lin. seznamu; "Kde" lze využít pro průchod, je voláno hodnotou
  begin while (Kde<>nil) and (Kde^.Data<>Co) do Kde:=Kde^.Dalsi;
        Nalezeno:=Kde<>nil
  end;
 begin Pom:=A;
       Init(C);
       while Pom<>nil do begin  // kopie A do C
          VlozPrvek(C, Pom^.Data);
          Pom:=Pom^.Dalsi
       end;
       Pom:=B;
       while Pom<>nil do begin // procházení B
          if not Nalezeno(Pom^.Data, C) then // přidává se do C
             VlozPrvek(Pom^.Data, C);
          Pom:=Pom^.Dalsi
       end
 end;
 
 
{4. Předpokládejte, že v souboru bez udání typu s diskovým jménem
'prac.data' jsou údaje o pracovnících a jejich dětech.  Údaje o každém
pracovníkovi začínají čtyřbajtovým identifikačním číslem, pak v jednom bajtu
je uveden počet dětí a na příslušném počtu dalších bajtů je postupně věk
všech dětí.  Vypište identifikační číslo každého pracovníka, který má nějaké
děti mladší 10 let.}

var F: file;
    Id: longword;
    Pocet, Vek: byte;
    Ma: boolean;

begin Assign(F, 'prac.data');
      reset(F, 1);
      while not eof(F) do begin
         BlockRead(F, Id, 4);        // identifikační číslo pracovníka
         BlockRead(F, Pocet, 1);     // počet jeho dětí
         Ma:=false;                  // má děti mladší 10 let?
         for I:=1 to Pocet do begin  // musíme přečíst všechny děti
           BlockRead(F, Vek, 1);
           if Vek<10 then Ma:=true
         end;
         if Ma then writeln(Id)
      end;
      Close(F)
end.