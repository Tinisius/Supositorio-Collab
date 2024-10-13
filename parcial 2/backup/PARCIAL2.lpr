program PARCIAL2;
type
  st5=string[5];
  treg=record
    rcode:st5;
    rDia:byte;
    rmonto:real;
  end;
  tarr=array [1..20] of treg;

{function insa(arr:tarr;i:byte):st5;
var j:byte; promedio:real;
begin
  promedio:=999999999;
  for j:=1 to i do
    begin

    end;
end; }

procedure datos(cod:st5;dia:byte;monto:real;var arr:tarr);
var arch:text; basura:char; i:byte;
begin
  i:=0;
  assign(arch,'ventas.txt');
  reset(arch);
  while not eof(arch) do
    begin
      inc(i);
      readln(arch,cod,basura,dia,monto);
      arr[i].rcode:=cod;
      arr[i].rDia:=dia;
      arr[i].rmonto:=monto;
      write(arr[i].rcode,' ',arr[i].rDia,' ',arr[i].rmonto);
      writeln();
    end;
    //insa(arr,i);
    write(i);
end;

var
  cod:st5;
  dia:byte;
  monto:real;
  arr:tarr;
begin
  datos(cod,dia,monto,arr);
   readln();

end.

