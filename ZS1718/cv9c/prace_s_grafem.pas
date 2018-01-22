{Imiplementujte objekt obecný graf. Na standardním vstupu je připravena
řada údajů o uzlech a hranách, tyto údaje využijte pro konstrukci grafu.
Graf vypište do souboru bez udání typu, jehož jméno je zadáno jako první
parametr z příkazového řádku. Graf vykreslete do vektorového formátu
na standardní výstup.
}

uses m_graf;

var Co: char;
    G: Graf;
    Soubor: file;
    NazevSouboru: string;


begin
      while not eof do begin
        read(Co);
        if Co='u' then VlozUzel(G);
        if Co='h' then VlozHranu(G)
      
      end;
      NazevSouboru:=ParamStr(1);
      if NazevSouboru='' then NazevSouboru:='graf.dta';
      Assign(Soubor, NazevSouboru);
      rewrite(Soubor, 1);
      G.VypisBUT(Soubor);
      Close(Soubor);
      
      G.Vykresli(output)

end.