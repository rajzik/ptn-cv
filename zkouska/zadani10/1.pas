
const max = 4;

var 
    heslo : string;
    c : char; 
    i, counter : integer;
    f : file;

begin
if (length(paramstr(1)) < 4) then heslo := 'ahoj'
    else if length(paramstr(1) > 4) heslo := copy(paramstr(1), length(paramstr(1)) - 4, 4)
    else heslo := paramstr(1);

    assign(f, paramstr(2));
    rewrite(f);
    counter := 1;
    while not eof do begin
        read(c);    
        c := c xor heslo[(counter mod max) + 1];
        succ(counter);
        write(f, c);
    end;
    close(f);
end.




