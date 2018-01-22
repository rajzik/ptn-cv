{Implementujte orientovaný ohodnocený graf. Přidejte ze standardního vstupu
potřebné informace o uzlech a hranách. Vypište výsledný graf do souboru
bez udaného typu a vykreslete jeho tvar na standardní výstup.
Jméno souboru bez udaného typu přečtěte z parametru z příkazového řádku.
}

type ZaznamOUzlu = record
       id: longword;
       X, Y: longint
     end;  
     
     ZaznamOHrane = record
       U1, U2: longword;
       Hodnota: string
     end;  

var
   G: Graf;
   GU, GV: Uzel;
   Eval: Evaluace;
   Co: char;
   Soubor: file;
   NazevSouboru: string;
   HodnotaUzel: ZaznamOUzlu;
   HodnotaHrana: ZaznamOHrane;

procedure CtiUzel(var U: ZaznamOUzlu);
 begin readln(U.id, U.X, U.Y)
 end;

procedure CtiHranu(var H: ZaznamOHrane);
 var C: char;
 begin readln(H.U1, H.U2, C, H.Hodnota)
 end;

begin G.Init;
      while not eof do begin
        read(Co);
        if Co='u' then begin
           CtiUzel(HodnotaUzel);
           GetMem(GU,SizeOf(ZaznamOUzlu));
           zaznamOUzlu(GU^):=HodnotaUzel;
           G.PridejUzel(GU)
        end;   
        if Co='h' then begin
           CtiHranu(HodnotaHrana);
           GetMem(GU,SizeOf(longword));
           longword(GU^):=HodnotaHrana.U1;
           GetMem(GV,SizeOf(longword));
           longword(GV^):=HodnotaHrana.U2;
           GetMem(Eval,SizeOf(string));
           string(Eval^):=HodnotaHrana.Hodnota;
           G.PridejHranu(GU, GV, Eval)
        end;   
        
      end;
      NazevSouboru:=ParamStr(1);
      if NazevSouboru='' then NazevSouboru:='graf.data';
      assign(Soubor,NazevSouboru);
      rewrite(Soubor, 1);
      G.VypisBUT(Soubor);
      G.Vykresli(output);

end.