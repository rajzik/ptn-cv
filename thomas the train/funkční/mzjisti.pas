unit mzjisti;
interface
uses mtypy;


procedure ZpracujSoubor(nazevsoub:string;var pol:ukpolozka);
procedure Vyhledej(Polo:ukpolozka;var  ZadNazev,ZadHodnota,ZadVysl:string;var V:VarZaznam);


implementation


procedure Vyhledej( Polo:ukpolozka;var ZadNazev,ZadHodnota,ZadVysl:string;var V:VarZaznam);

	function hledej_STR_VObj(var co:string; Zacatek:ukpolozka):ukpolozka;
		var nemam:boolean;
		function vPoliHledej(var co:string; Zac:UkHodnota):ukpolozka;
		begin
		vPoliHledej:=nil;
			while (zac<>nil) and (vPoliHledej=nil) do begin
if(zac^.Hodn.Udaj=typpole) and (vPoliHledej=nil)then vPoliHledej:=vPoliHledej(co,zac^.Hodn.pole) 
				else if(zac^.Hodn.Udaj=typobjekt) and(vPoliHledej=nil)  then vPoliHledej:=hledej_STR_VObj(co,zac^.hodn.objekt);
				zac:=zac^.dalsi;
				end;
		end;
	

	begin
	nemam:=true;
	hledej_STR_VObj:=nil;
		while ((Zacatek<>nil) and nemam) do begin
			nemam:=zacatek^.nazev<>co;
			if not nemam then 	hledej_STR_VObj:=zacatek;
			if nemam and (zacatek^.Hodn.Udaj=typpole) then 
				begin 
					hledej_STR_VObj:=vPoliHledej(co,zacatek^.Hodn.pole);
					nemam:=(hledej_STR_VObj=nil)
				end
			else if nemam and (zacatek^.Hodn.Udaj=typobjekt) then 
			begin
				hledej_STR_VObj:=hledej_STR_VObj(co,zacatek^.Hodn.objekt);
				nemam:=(hledej_STR_VObj=nil)
			end;
		if nemam then zacatek:=zacatek^.dalsi;
	end;
	end;
// fce vyhledej
var predchozi:string;
begin
Polo:=hledej_STR_VObj(ZadNazev,polo);
if polo=nil then writeln('prvni parametr: ',ZadNazev,' nenalezen')else 
	begin
	predchozi:=ZadNazev;
		if polo=nil then writeln('prvni parametr: ',ZadNazev,' nenalezen')else 
			if(predchozi<>ZadHodnota) and (ZadHodnota<>'') then begin polo:=hledej_STR_VObj(ZadHodnota,polo);
			predchozi:=ZadHodnota;
			if polo=nil then writeln('druhý parametr: ',ZadHodnota,' nenalezen')else if(predchozi<>ZadVysl) and (ZadVysl<>'') then polo:=hledej_STR_VObj(ZadVysl,polo);
		end;
		
	
	end;
if polo<>nil then v:=polo^.hodn else writeln('treti parametr: ',ZadVysl,' nenalezen');

end;
///===konec hledání
function jeKon(var f:file):boolean;
var pozi:int64 ;
begin
  jekon:=true;
  if not EOF(F) then begin
      pozi:=FilePos(f);
      blockread(f,jekon,1);
      jekon:=(byte(jekon)=255);
      if not(jekon) then  seek(f,pozi); /// když není konec musím se vrátit
  end;
  end;


procedure nactipolozku(var pol:ukpolozka;var f:file);
        procedure varzaz(var zaz:VarZaznam;var f:file);
                procedure ctipole(var  hod:UkHodnota;var f:file);
                begin
                 if not  JeKon(f) then
                  begin
                       new(hod);
                       varzaz(hod^. Hodn,f);
                       ctipole(hod^.dalsi,f);
                  end else
                  hod:=nil;
                end;
        ///=======začatek proceduryVarzaz
        var by:byte;
        begin
            blockread(f,by,1) ;

            case by of
             0: /// oběkt v oběktu
               begin
                    zaz.Udaj:=typobjekt;
                    nactipolozku(zaz.objekt,f);
                     end;
             1: // pole hodnot
               begin
                    zaz.Udaj:=typpole;
                    ctipole(zaz.pole,f);
               end;
             2:///string
              begin
                   zaz.Udaj:=typretez;
                   blockread(f,zaz.retez[0],1);
                   blockread(f,zaz.retez[1],ord(zaz.retez[0]))
              end;
             3: //dva bajty (word)
              begin
                   zaz.Udaj:=typcele;
                   blockread(f,zaz.cele,2);
               end;
             4: //4 bajty (single)
              begin
                  zaz.Udaj:=  typrealne;
                  blockread(f,zaz.realne,4);
              end;
             5: //true(1) false(0)
              begin
                  zaz.Udaj:=typlogik;
                  blockread(f,zaz.logik,1);
              end;

            else writeln('zaznam se podělal, byte je:',by,' pozice v souboru je:',filepos(f))
            end;

        end;


///========nactipolozkuZacatek
var pom:byte;
begin
   if not jekon(f) then
   begin
        new(pol);
        blockread(f,pom,1);
        if(pom<>2)then writeln('chyba, položka nema nazev byte je:',pom,'pozice v souboru je :',filepos(f));
        blockread(f,pol^.nazev[0],1);
        blockread(f,pol^.nazev[1],ord(pol^.nazev[0]));
        varzaz(pol^.hodn,f);
        nactipolozku(pol^.dalsi,f)
   end else pol:=nil
   end;
  procedure ZpracujSoubor(nazevsoub:string;var pol:ukpolozka);
    var co:byte; f:file;
    begin
	assign(f,nazevsoub);
	reset(f,1);
	blockread(f,co,1);
		if co <>0 then writeln('chyba souboru') else
    nactipolozku(pol,f);
  end;

(*	 	 
procedure vypPolozky(pol:ukpolozka);
	procedure Vypzazn(var zaz:VarZaznam);
		procedure vypPole(co:UkHodnota);
		begin
                           write('(');
                           while co<>nil do begin
				Vypzazn(co^.Hodn);write('; ');
				co:=co^.dalsi;
			end;
                        writeln(')');
		end;
	begin
		case zaz.Udaj of
			typretez:  write('"',zaz.retez,'" ');
			typcele:   write(word(zaz.cele),' ');
			typrealne: write(single(zaz.realne),' ');
			typlogik:  write(boolean(zaz.logik),' ');
			typpole:   vypPole(zaz.pole);
			typobjekt: vypPolozky(zaz.objekt); 
		end;
	end;
begin
	while pol<>nil do begin
		write(pol^.nazev,':{ '); Vypzazn(pol^.Hodn);
		pol:=pol^.Dalsi;
	end;
	Write(' }');
end;	

*)

end.	 
