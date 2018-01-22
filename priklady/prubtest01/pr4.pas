{Navrhněte datový typ "množina řetězců, jejichž délka je nejvýše 15 znaků".
Realizujte operaci inicializace (vytvoření prázdné množiny) a operaci
sjednocení dvou takových množin.}

const MaxCard = 1000;

type 
     Ret = string[15];
     PoleRet = array [1..MaxCard] of Ret;
     
     MnozRet = record
        P: PoleRet;
        Obs: word
     end;
     
procedure Init(var M: MnozRet);
 begin M.Obs:=0
 end;
 
procedure Sjednoceni(A, B: MnozRet; var C: MnozRet);
 var I: word;
 procedure Zarad(var X: MnozRet; R: Ret);
  var I: word;
  begin I:=1;
        while (I<=X.Obs) and (R<>X.P[I]) do Inc(I);
        if I>X.Obs then begin
           Inc(X.Obs);
           X.P[X.Obs]:=R
        end   
  end;
 begin C:=A;
       for I:=1 to B.Obs do
          Zarad(C, B.P[I])
 end;