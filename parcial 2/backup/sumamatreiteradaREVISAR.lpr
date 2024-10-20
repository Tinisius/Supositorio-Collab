program sumamatreiteradaREVISAR;
type
  arr=array [1..2,1..2] of integer;
  var
    matriz:arr;
    i,j,k,n,suma:integer;

function sumar(var mat:arr; var k,j,suma:integer):integer;
begin
if j=2 then
   suma:=matriz[k,j]
else
    suma:=suma+sumar(mat,k,j+1,suma);
sumar:=suma;
end;
begin
  suma:=0;
  for i:=1 to 2 do
      begin
        for j:=1 to 2 do
            begin
              readln(n);
              matriz[i,j]:=n;
            end;
        j:=1;
        k:=i;

        writeln(sumar(matriz,k,j,suma));
      end;
  readln();
end.

