program prg;
uses tree;

var s : strom;
	temp : pData;

begin
s.init();
writeln('ahoj');
while not eof do begin
	readln(temp);
	writeln(temp);
	s.vloz(temp);
end;
writeln('inorder: ');
s.inOrder();
writeln('preorder: ');
s.preOrder();
writeln('postorder: ');
s.postOrder();
writeln('Odebiram 22!');
s.odeber(22);
writeln('Odebiram 22!');
s.odeber(22);
writeln('inorder: ');
s.inOrder();
writeln('Odebiram posledni 22!');
s.odeber(22);
writeln('inorder: ');
s.inOrder();

writeln('inorder: ');
s.odeber(34);
s.inOrder();

writeln('inorder: ');
s.odeber(2);
s.odeber(2);
s.odeber(2);
s.inOrder();
end.
