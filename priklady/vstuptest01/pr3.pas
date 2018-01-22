{Na disku se nachází soubor záznamů s názvem stavby.dat. Jednotlivé záznamy
obsahují následující údaje:

-- jméno (název) majitele (max. 200 znaků)
-- číslo popisné
-- ulice (max. 100 znaků)
-- rok kolaudace

Vypište z tohoto souboru počty kolaudovaných staveb v jednotlivých
desetiletích počínaje rokem 1950 do současnosti.}

const OdRoku = 1950;
      DoRoku = 2016;
type Stavba = record
       jmeno: string[200];
       cispop: word;
       ulice: string[100];
       rokkol: word
     end;
     Soubor = file of Stavba;
     Indexy = OdRoku div 10 .. DoRoku div 10;
     Pocitadla = array [Indexy] of word;
     
var F: Soubor; S: Stavba;
    P: Pocitadla; I: Indexy;

begin Assign(F, 'stavby.dat');
      reset(F);
      Fillchar(P,SizeOf(P),0);
      while not eof(F) do begin
         read(F, S);
         if (S.rokkol>=OdRoku) and (S.rokkol<=DoRoku) then
            Inc(P[S.rokkol div 10])
      end;
      for I:=low(Indexy) to High(Indexy) do writeln(I*10, ': ', P[I]);
end.