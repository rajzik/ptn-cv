unit m_graf;
interface
uses m_rp;
type
     Uzel = pointer;
     Evaluace = pointer;

     Graf = object
        
        constructor Init;
        procedure PridejUzel(U: Uzel);
        procedure PridejHranu(U1, U2: Uzel; E: Evaluace);
        function Prazdny: boolean;
        procedure VypisBUT(var F: file);
        procedure Vykresli(var F: text);
     end;

implementation


end.