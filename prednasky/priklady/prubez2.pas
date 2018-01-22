{1. Je dán lineární jednosměrný dynamický seznam s datovou složkou typu
pointer.  Napište funkci, která vzájemně vymění datové složky dvou po sobě
jdoucích prvků, pokud nebudou svým pořadím vyhovovat.  Pro porovnání hodnot
připravte vhodný podprogram, který bude předán jako parametr této funkci. 
Dalším parametrem bude ukazatel na seznam.  Doplňte všechny potřebné
definice datových typů.}

type
  ukPrvek:^prvek;

  record prvek:
    sez.data:pointer;
    sez.nasl:^prvek;
    end;

  record seznam
    zac:ukPrvek;
    end;

procedure swap (a,b: prvek);
var pom:prvek
begin
  pom:=a;
  a:=b;
  b:=a;
end;


procedure zamena (@swap; s:seznam);
begin

if s^.data < s^.nasl^.data then swap(s, s.nasl);

end;


{2. Vytvořte proceduru, která přidá na konec dvojsměrně svázaného seznamu
nový prvek, jehož datovou hodnotu dostane v parametru.  Dalším parametrem
procedury je ukazatel na začátek seznamu.  Prvek se však bude přidávat jen v
případě, že nová datová hodnota v seznamu dosud není.  Předpokládejte, že
data jsou celočíselného typu.  Doplňte všechny potřebné definice datových
typů.}

type
  ukPrvek: ^prvek
  
  record prvek
    prv.data:integer;
    prv.pred:ukPrvek;
    prv.nasl:ukPrvek;
  end;

  record seznam
    zac:ukPrvek;

procedure add (data: integer; s:seznam);
var pom,pom1:prvek;
    podm:boolean
begin
  podm:=true;
  if s=nil then
      begin
        new(pom);
        pom.data:=data;
        pom^.pred:=pom;
        pom^.nasl:=pom;
        s.zac:=pom;
      end;
    else
      begin
        pom1:=s^.zac;
        while   pom1^.nasl <> nil do
          begin
            if (data = pom1.data) then podm:=false;
            pom1:=pom1^.nasl;
          end;
        if podm then
          begin
            new(pom);
            pom1^.nasl:=pom;
            pom.data:=data;
            pom^.pred:=pom1;
          end;
      end; 
end;


{3. Navrhněte implementaci datového typu "množina reálných čísel" pomocí
dynamické struktury.  Realizujte operaci inicializace (vytvoření prázdné
množiny) a operaci sjednocení dvou takových množin.}

procedure init(m:mnozina);
begin
  m:=nil;
end;

{4. Předpokládejte, že v souboru bez udání typu s diskovým jménem
'prac.data' jsou údaje o pracovnících a jejich dětech.  Údaje o každém
pracovníkovi začínají čtyřbajtovým identifikačním číslem, pak v jednom bajtu
je uveden počet dětí a na příslušném počtu dalších bajtů je postupně věk
všech dětí.  Vypište identifikační číslo každého pracovníka, který má nějaké
děti mladší 10 let.}

var
  id,i:integer;
  pocDeti:byte;
  vekDite:byte;
  podminka:boolean;
  f:file;
  
begin

assign(f,'prac.data');
reset(f,1);
while not eof(f) do 
  begin
    podminka:=false;
    blockread(f,id,4);
    blockread(f,pocDeti,1)
    for i:=1 to pocDeti do
      begin
        blockread(f,vekDite,1);
        if vekDite<10 then podminka:=true;
      end;
    if podminka then writeln(id);
  end;
close(f);

end.