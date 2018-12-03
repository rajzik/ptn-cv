uses mptvlakyo, mzjisti, mtypy;

var V: VarZaznam;
    Adresa,stupen: word;
    Kod: integer;
    ZadHodnota: string;
    
begin if ParamCount>0 then begin // očekává se adresa lokomotivy v parametru
         ZadHodnota:=ParamStr(1);
         Val(ZadHodnota, Adresa, Kod); // převod adresy na celé číslo
         zadHodnota:=paramstr(2);
         Val(Zadhodnota,stupen,Kod);
            V.Udaj:=typcele;  // příprava povelu
            V.cele:=stupen;        // tady bude V.cele:=0; když budeme chtít opačný směr
            PosliData('lokStav', Adresa, 'rychlostStupne', V)   
end;
end.