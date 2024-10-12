program project1;

type
  treg=record
   tfich:byte;
   color:char;
  end;
  mat=array[1..8,1..8] of treg;

var
  pos:treg;
  i,j,n1,n2,n3,n4:byte;
  mat1:mat;

procedure Iniciar(var mat2:mat);
var
  i,j,num:byte;
  begin
      for i:=1 to 8 do
          begin
          for j:=1 to 8 do
              begin
                case j of
                1,8:mat2[i,j].tfich:=5;
                2,7:mat2[i,j].tfich:=4;
                3,6:mat2[i,j].tfich:=3;
                4:mat2[i,j].tfich:=99;
                5:mat2[i,j].tfich:=12;
                end;
          case i of
              1:mat2[i,j].color:='A';
              2:begin mat2[i,j].color:='A'; mat2[i,j].tfich:=1;end;
              7:begin mat2[i,j].color:='R'; mat2[i,j].tfich:=1;end;
              8:mat2[i,j].color:='R';
              3,4,5,6:begin mat2[i,j].color:='B'; mat2[i,j].tfich:=0;end;
              end;

          end;

          end;
  end;

procedure mover;
var
  i,j:byte;
  begin
    for i:=1 to 8 do
    begin
        for j:=1 to 8 do
            write(mat1[i,j].tfich,mat1[i,j].color,' ');
        writeln();
    end;
    writeln();

    writeln('haga el movimiento');
    readln(n1,n2);
    writeln('a donde?');
    readln(n3,n4);
    mat1[n3,n4].color:=mat1[n1,n2].color;
    mat1[n3,n4].tfich:=mat1[n1,n2].tfich;

    mat1[n1,n2].color:='B';
    mat1[n1,n2].tfich:=0;
  end;

begin
  Iniciar(mat1);
  while true do
        mover();
  readln();
end.
