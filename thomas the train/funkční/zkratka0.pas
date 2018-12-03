uses mptvlakyo, mzjisti, mtypy;

var V: VarZaznam;
    Adresa: word;
    Kod: integer;
    ZadHodnota: string;
    
begin if ParamCount>0 then begin // očekává se adresa lokomotivy v parametru
         ZadHodnota:=ParamStr(1);
         Val(ZadHodnota, Adresa, Kod); // převod adresy na celé číslo
         if Kod<>0 then writeln('Adresa ',ZadHodnota,' je chybná.')
         else begin 
            V.Udaj:=typcele;  // příprava povelu
            V.cele:=0;        // tady bude V.cele:=0; když budeme chtít opačný směr
            PosliData('lokStav', Adresa, 'smer', V)
         end
      end else writeln('Nebyla zadána adresa lokomotivy');   
end.