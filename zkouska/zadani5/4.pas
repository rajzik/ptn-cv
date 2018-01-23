{

    4)
Je dáno:

procedure vypis(x: struktura);
 var i: word;
 begin x.start;
       for i:=1 to x.posled do x.out(i)
 end;

Definujte dva objekty včetně všech potřebných metod, 
které mohou být skutečným parametrem této procedury. 
První objekt implementuje frontu, 
druhý zásobník.
 Datovou složku struktury zvolte tak, 
 aby ji bylo možno přímo procedurou write 
 vypisovat na standardní výstup.
}