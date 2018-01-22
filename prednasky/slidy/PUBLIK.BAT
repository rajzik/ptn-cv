@echo off
del ptn_predn.zip
del ptn_slajdy.zip
call zip ptn_predn *.*
call zip ptn_slidy p*.pdf
call scparst p*.pdf /net/disk/home/rybicka/html/prez/pt
call scparst ptn_predn.zip vyuka/progt/prednasky
call scparst ptn_slidy.zip vyuka/progt/prednasky
