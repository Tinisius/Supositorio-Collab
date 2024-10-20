program ej2;
 type
   matriz=array [1..5,1..5] of integer;
   vecmin=array[1..5] of integer;

procedure minimo(var mat:matriz;var vec:vecmin; i,k,n:byte);
var min:integer; j:byte;
begin
  min:=mat[i,1];
  for j:=1 to k do
     if min>mat[i,j] then
        min:=mat[i,j];
  vec[n]:=min;
  writeln(vec[n]);
end;

procedure sumar(var mat:matriz;var vec:vecmin;h,k,i,j:byte);
var suma:integer;n:byte;
begin
  n:=0;
  for i:= 1 to h do
  begin
  suma:=0;
      for j:=1 to k do
         suma:=suma+mat[i,j];
      if suma>=0 then
         begin
         inc(n);
         minimo(mat,vec,i,k,n);
         end;
  end;
end;

procedure cargarmat(var mat:matriz;var vec:vecmin);
var i,j,h,k:byte; arch:text; n:integer;
begin
  assign(arch,'ej2.txt');
  reset(arch);
  read(arch,h,k);
  for i:= 1 to h do
      begin
      for j:=1 to k do
          begin
          read(arch,n);
          mat[i,j]:=n;
          end;
      readln(arch);
  end;
  sumar(mat,vec,h,k,i,j);
end;

var
  mat:matriz;
  vec:vecmin;
begin
   cargarmat(mat,vec);
   readln();
end.

