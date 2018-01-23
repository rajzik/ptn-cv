{
V souboru bez udání typu jsou údaje o pracovní neschopnosti zaměstnanců. 
U každého zaměstnance je uvedeno jméno a příjmení (jeden řetězec uložený na minimálním prostoru s délkou v prvním bajtu),
datum počátku neschopnosti (celočíselný čtyřbajtový údaj) a 
počet dní neschopnosti. 
Napište program, 
který přečte tento soubor, 
vypíše na standardní výstup průměrný počet dní neschopnosti a jméno a příjmení pracovníka s 
největším počtem dnů pracovní neschopnosti. 
Název vstupního souboru přečtěte z prvního parametru z příkazového řádku.
Na tuto otázku můžete odpovědět libovolně dlouhým textem. Odpověď bude vyhodnocena zkoušejícím ručně.
}

type


zamestnanec = record begin
  jmenoaprijmeni : string;
  zacatek: longword;
  pocet : byte;
end;


var 
  current, nejvysiPocet : zamestnanec;
  i, prumer : real;
  
  f : file;
  fileName : string;
  
begin
  fileName := paramStr(1);
  assign(f, fileName);
  reset(f, 1);
  i := 0;
  prumer := 0;
  
  nejvysiPocet.jmenoaprijmeni = '';
  nejvysiPocet.zacatek = 0;
  nejvysiPocet.pocet = 0;
  
  while (not eof(f)) do begin
      blockread(f, current.jmenoaprijmeni, 1);
      blockread(f, current.jmenoaprijmeni[1], length(current.jmenoaprijmeni));
      blockread(f, current.zacatek, sizeof(current.zacatek));
      blockread(f, current.pocet, sizeof(current.pocet));
      if (nejvysiPocet.pocet < current.pocet) then
      begin
	      nejvysiPocet := current;
      end;

      prumer := prumer + current.pocet;
      i := i + 1;
  end;
  
  
  writeln('Nejvisi pocet dni: ', nejvysiPocet.pocet);
  writeln('Nejvisi pocet dni jmeno:', nejvysiPocet.jmenoaprijmeni);
  writeln('prumer poctu dni: ', prumer / i);
  
  
end.


{
  BTW podle nekoho neukladam jmeno a prijmeni pro maximum
  ale `nejvysiPocet := current;` tohle je asi co????????????????
}