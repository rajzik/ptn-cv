type
     zvire=object
       constructor init;
       procedure pozdrav; virtual;
     end;
            
     krava=object(zvire)
       constructor krava;
       procedure pozdrav;  virtual;
     end;
     UkZvire = ^Zvire;
     UkKrava = ^krava;

     constructor zvire.init;
     begin end;
     
     constructor krava.krava;
     begin end;
               
     procedure zvire.pozdrav;
     begin writeln('jsem zvíře, nazdar')
     end;
     
     procedure krava.pozdrav;
     begin writeln('jsem búúúú kráva, búúúú')
     end;
                    
var  P: UkZvire;

begin P:=new(ukZvire, init);
      P^.pozdrav;
      
      P:=new(ukkrava, init);
      P^.pozdrav;
end. 