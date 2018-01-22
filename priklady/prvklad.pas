var P: array [1..100] of real;
    I, J, K: integer; C: real;
    
begin Randomize;
      for I:=1 to 100 do P[I]:=Random;
      for I:=1 to 100 do begin
      {N - počet hodnot řazené posloupnosti}
        C:=P[I];
        K:=1;
        {nalezení vhodného místa (se zarážkou):}
        while P[K]< C do Inc(K);
         {posun prvků o jedno místo dozadu}
        for J:=I-1 downto K do P[J+1]:=P[J];
         {vložení do uvolněného prostoru:}
          P[K]:=C
      end;
      for I:=1 to 100 do writeln(P[I]:8:5)
end.    