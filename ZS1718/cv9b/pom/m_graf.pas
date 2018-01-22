unit m_graf;
interface
type 
     Uzel = pointer;
     Evaluace = pointer;
     
     TypSrovUzly = function (A, B: Uzel): boolean; // true při rovnosti

     TypVykresliUzel = function (A: Uzel): string;
     TypVykresliHranu = function (A, B: Uzel; E: Evaluace): string;
     
     TypBUTUzel = procedure (var F: file; U: Uzel);
     TypBUTHrana = procedure (var F: file; A, B: Uzel; E: Evaluace);
     
     UkUzel = ^PrvekUzlu;
     UkHrana = ^Hrana;
     Hrana = record
       U1, U2: UkUzel;
       Eval: Evaluace;
       dalsi: UkHrana;
     end;
     
     SeznamHran = record
       Hzac, Hkon: UkHrana;
     end;  
     
     PrvekUzlu = record
       data: Uzel;
       dalsi: UkUzel
     end;  
     SeznamUzlu = record
       UZac, UKon: UkUzel;
     end;

     Graf = object
       Uzly: SeznamUzlu;
       Hrany: SeznamHran;
       SrovUzly: TypSrovUzly;
       constructor init(SU: TypSrovUzly);
       procedure PridejUzel(U: Uzel);
       procedure PridejHranu(A, B: Uzel; E: Evaluace);
       procedure Vykresli(var F: text; JakU: TypVykresliUzel; JakH: TypVykresliHranu);
       procedure VypisBUT(var F: file; JakU: TypBUTUzel; JakH: TypBUTHrana);
       function Prazdny: boolean;
       
       function NajdiUzel(U: Uzel):UkUzel;
       function NajdiHranu(A, B: Uzel):UkHrana;
     end;

implementation

constructor Graf.init(SU: TypSrovUzly);
 begin 
       Uzly.Uzac:=nil;
       Uzly.UKon:=nil;
       Hrany.HZac:=nil;
       Hrany.HKon:=nil;
       SrovUzly:=SU;
 end;
 
function Graf.Najdiuzel(U: Uzel):UkUzel;
 var Pom: UkUzel;
 begin Pom:=Uzly.UZac;
       while (Pom<>nil) and not SrovUzly(Pom^.data, U) do
          Pom:=Pom^.dalsi;
       NajdiUzel:=Pom
 end;
 
procedure Graf.PridejUzel(U: Uzel);
 var Pom: UkUzel;
 begin Pom:=NajdiUzel(U);
       if Pom<>nil then Pom^.data:=U
       else begin
          if Prazdny then begin
             new(Uzly.Uzac);
             Uzly.Ukon:=Uzly.Uzac
          end else begin  
             new(Uzly.Ukon^.dalsi);
             Uzly.Ukon:=Uzly.Ukon^.dalsi;
          end;
          Uzly.Ukon^.dalsi:=nil;
          Uzly.Ukon^.data:=U
       end
 end;
 
function Graf.NajdiHranu(A, B: Uzel):UkHrana;
 var Pom: UkHrana;
 begin Pom:=Hrany.HZac;
       while (Pom<>nil) and (not SrovUzly(Pom^.U1, A) or not SrovUzly(Pom^.U2, B))
          do Pom:=Pom^.dalsi;
       NajdiHranu:=Pom
 end;
 
procedure Graf.PridejHranu(A, B: Uzel; E: Evaluace);
 var Pom: UkHrana; Exist, UA, UB: UkUzel;
 begin // kontrola existence uzlů:
       Exist:=NajdiUzel(A);
       if Exist<>nil then begin  // první uzel nalezen, hledáme druhý
          UA:=Exist;             // uschováme nalezený uzel
          Exist:=NajdiUzel(B);
          if Exist<>nil then begin  // i druhý nalezen, přidáváme hranu
             UB:=Exist;             // uschováme druhý uzel
             Pom:=NajdiHranu(A, B);
             if Pom<>nil then Pom^.Eval:=E  // když hrana existuje, jen změna Eval
             else begin                     // když neexistuje, přidává se
                if Hrany.HZac=nil then begin
                   new(Hrany.Hzac);
                   Hrany.Hkon:=Hrany.HZac
                end else begin
                   new(Hrany.Hkon^.dalsi);
                   Hrany.Hkon:=Hrany.Hkon^.dalsi
                end;
                Hrany.Hkon^.U1:=UA;
                Hrany.Hkon^.U2:=UB;
                Hrany.Hkon^.Eval:=E;
                Hrany.Hkon^.dalsi:=nil
             end
          end  // else: nenalezen uzel -> neděláme nic
        end  // else: nenalezen uzel -> neděláme nic
 end;
 
procedure Graf.Vykresli(var F: text; JakU: TypVykresliUzel; JakH: TypVykresliHranu);
 var PomU: UkUzel; PomH: UkHrana;
 begin PomU:=Uzly.UZac;
       while PomU<> nil do begin
         writeln(F, JakU(PomU^.data));
         PomU:=PomU^.Dalsi
       end;
       PomH:=Hrany.HZac;
       while PomH<>nil do begin
         writeln(F, JakH(PomH^.U1^.data, PomH^.U2^.data, PomH^.Eval));
         PomH:=PomH^.Dalsi
       end
 end;
 
procedure Graf.VypisBUT(var F: file; JakU: TypBUTUzel; JakH: TypBUTHrana);
 var PomU: UkUzel; PomH: UkHrana;
 begin PomU:=Uzly.UZac;
       while PomU<> nil do begin
         JakU(F, PomU^.data);
         PomU:=PomU^.Dalsi
       end;
       PomH:=Hrany.HZac;
       while PomH<>nil do begin
         JakH(F, PomH^.U1^.data, PomH^.U2^.data, PomH^.Eval);
         PomH:=PomH^.Dalsi
       end
 end;
 
function Graf.Prazdny: boolean;
 begin Prazdny := Uzly.Uzac=nil
 end;
 

end.