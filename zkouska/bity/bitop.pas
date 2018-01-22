{
    USAGE
    ./bitop <char> < test
}

var Z, heslo: char;
    S: byte;
    F: file of byte;

begin 
    {Cteni volitelneho parametru}
    if Paramcount>0 then 
          Heslo:=ParamStr(1)[1]
    else Heslo:='A';
    {Otevreni souboru}
    Assign(F, 'sifra.dat');
    rewrite(F);
    {Cteni ze vstupu char po charu}
    while not eof do begin
        read(Z);
        {WANNABE sifrovani}
        S:=ord(Z) xor ord(Heslo);
        {Zapsani do souboru}
        write(F,S);
    end;
    Close(F);
end.      