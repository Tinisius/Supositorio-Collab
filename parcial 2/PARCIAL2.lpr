program PARCIAL2;
type
  st5=string[5];
  treg=record
    rcode:st5;
    rDia,cant:byte;
    rmonto:real;
  end;
  tarr=array [1..20] of treg;
  arrayrubros=array [1..20] of treg;

function promedio(arr2:arrayrubros;p:byte):real;
begin
     promedio:=arr2[p].rmonto/arr2[p].cant;
end;

procedure guardar(var arr:tarr;var arr2:arrayrubros;i,p:byte);
var h,cantidad:byte;
begin
cantidad:=0;
  for h:=1 to i do
  begin
    if arr[h].rcode=arr2[p].rcode then
     begin
     inc(cantidad);
     arr2[p].rmonto:=arr[h].rmonto+arr2[p].rmonto;
     arr2[p].cant:=cantidad;
     end;
  end;
end;

procedure guardarymostrar(var arr:tarr;var arr2:arrayrubros;i,j:byte);
var p:byte;
begin
for p:=1 to j do
    begin
      guardar(arr,arr2,i,p);
      writeln(arr2[p].rmonto:2:2);
      writeln(arr2[p].cant);
      writeln();
    end;
for p:=1 to j do
    writeln('el promedio del codigo ',arr2[p].rcode,' es ',promedio(arr2,p):2:2);
end;

procedure datos(cod:st5;dia:byte;monto:real;var arr:tarr;var arr2:arrayrubros);
var arch,arch2:text; basura:char; i,j,p:byte;
begin
  i:=0;
  j:=0;
  assign(arch,'ventas.txt');
  reset(arch);
  assign(arch2,'rubros.txt'); reset(arch2);
  while not eof(arch) do
    begin
      inc(i);
      readln(arch,cod,basura,dia,monto);
      arr[i].rcode:=cod;
      arr[i].rDia:=dia;
      arr[i].rmonto:=monto;
      write(arr[i].rcode,' ',arr[i].rDia,' ',arr[i].rmonto:2:2);
      writeln();
    end;
  while not eof(arch2) do
    begin
      inc(j);
      readln(arch2,cod);
      arr2[j].rcode:=cod;
      arr2[j].rmonto:=0;
      writeln(arr2[j].rcode);
    end;
  guardarymostrar(arr,arr2,i,j);


end;

var
  cod:st5;
  dia:byte;
  monto:real;
  arr:tarr;
  arr2:arrayrubros;
begin
  datos(cod,dia,monto,arr,arr2);
  readln();
end.

