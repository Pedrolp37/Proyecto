program title;
uses crt;
const
     reg1 = 'CORDILLERA CENTRAL';
     reg2 = 'CORDILLERA ORIENTAL';
     reg3 = 'SISTEMA CORIANO';
     reg4 = 'LAGO DE MARACAIBO';
     reg5 = 'LOS ANDES';
     reg6 = 'LOS LLANOS';
     reg7 = 'SISTEMA DELTAICO';
     reg8 = 'SUR DEL ORINOCO';
     reg9 = 'LAS ISLAS';
type
    z = array[1..2] of integer;
var
   i,gs,nreg:shortint;
   fil,col:integer;
   region,mn,reg:string;
   epi:z;

function ValidarNumRegion(nreg:shortint; var reg:string):shortint;
var
   y:shortint;

begin
     if (nreg<1) or (nreg>9) then
        begin
             y:=0;
             writeln('El numero de la region no es correcto. Debe estar entre 1-9');
        end
     else
         begin
              case nreg of
                   1:begin
                          if (upcase(reg)<>reg1) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                   2:begin
                          if (upcase(reg)<>reg2) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                   3:begin
                          if (upcase(reg)<>reg3) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                    4:begin
                          if (upcase(reg)<>reg4) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                    5:begin
                          if (upcase(reg)<>reg5) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                    6:begin
                          if (upcase(reg)<>reg6) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                    7:begin
                          if (upcase(reg)<>reg7) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                    8:begin
                          if (upcase(reg)<>reg8) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
                   9:begin
                          if (upcase(reg)<>reg9) then
                             begin
                                  writeln('El numero ingresado no concuerda con la region ingresada');
                             end
                          else
                              begin
                                   y:=1;
                              end;
                     end;
              end;
         end;
     ValidarNumRegion:=y;
end;

function ValidarRegion(regi:string):shortint;
var
   y:shortint;
begin
     if ((regi=reg1) or (regi=reg2) or (regi=reg3) or (regi=reg4) or (regi=reg5) or (regi=reg6) or (regi=reg7) or (regi=reg8) or (regi=reg9)) then
        begin
             y:=1;
        end
     else
          begin
               y:=0;
               writeln('El nombre de la region no concuerda con las regiones dadas');
          end;
     ValidarRegion:=y;
end;

procedure IntroducirRegion(var region,reg:string);
var
   naux:string;
   nreg,error:integer;

begin
     repeat
           writeln('Introduzca la cadena region');
           readln(region);
           reg:=copy(region,5,length(region));
           naux:=copy(region,3,1);
           val(naux,nreg,error);
     until (((ValidarRegion(upcase(reg)))<>0) and (ValidarNumRegion(nreg,reg)<>0));
end;

procedure IntroducirMatriz(var mn:string; var fil,col:integer);
var
   fila,colu:shortstring;
   error,error1:integer;
   y:shortint;

begin
     repeat
           writeln('Introduzca las filas y columnas');
           readln(mn);
           fila:=copy(mn,1,1);
           colu:=copy(mn,3,1);
           val(fila,fil,error);
           val(colu,col,error1);
           if (error<>0) or (error1<>0) then
              begin
                   y:=0;
                   writeln('Por favor vuelva a introducir los datos de la manera en la que se indico');
                   delay(2000);
              end
           else
               begin
                    y:=1;
               end;
     until (y=1);
end;

function ValidarMaxMatriz(var fil,col:shortint):shortint;
var
   y:shortint;
begin
     if (fil>15) or (col>15) then
        begin
             writeln('Las dimensiones son mayores a las aceptadas');
             writeln('En tres segundos sera redirigido');
             delay(3000);
             y:=0;
        end
     else
         begin
              y:=1;
         end;
     ValidarMaxMatriz:=y;
end;

function ValidarNegMatriz(var fil,col:shortint):shortint;
var
   y:shortint;
begin
     if (fil<0) or (col<0) then
        begin
             writeln('Las dimensiones no pueden ser negativas');
             writeln('En tres segundos sera redirigido');
             delay(3000);
             y:=0;
        end
     else
         begin
              y:=1;
         end;
     ValidarNegMatriz:=y;
end;

{function ValidarCostyVid(costyvid:string):shortint;
var
   y:shortint;

begin

end;}

Function ValidarGradoSismo(gradsis:shortint):shortint;
var
   x:shortint;

begin
     case gradsis of
          0..10:begin
                     x:=1;
                end;
     else
         begin
              x:=0;
              writeln('El grado del sismo debe ser estar entre 0-10');
              writeln('En tres segundos sera redirigido');
              delay(3000);
         end;
     end;
     ValidarGradoSismo:=x;
end;

Function ValidarEpicentro(epi:z; var fil,col:integer):z;
var
   i:shortint;
   w:z;

begin
     for i:=1 to 2 do
         begin
              if(epi[i]>fil) or (epi[i]<0) or (epi[i]>col) then
                begin
                     w[i]:=0;
                end
              else
                  begin
                       w[i]:=1;
                  end;
         end;
     ValidarEpicentro:=w;
end;

procedure IntroducirGradoSismo(var gs:shortint);

begin
     Repeat
           clrscr;
           writeln('Introduzca el grado del sismo');
           readln(gs);
           delay(500);
     Until (ValidarGradoSismo(gs)=1);
end;

procedure IntroducirEpicentro(var epi:z);
var
   i,aux:shortint;

begin
     clrscr;
     writeln('Introduzca el epicentro');
     for i:=1 to 2 do
         begin
              readln(epi[i]);
         end;
     delay(500);
     Repeat
           if (ValidarEpicentro(epi,fil,col)[1]=0) or (ValidarEpicentro(epi,fil,col)[2]=0) then
              begin
                   aux:=0;
                   clrscr;
                   writeln('El epicentro que introdujo no se encuentra dentro de la matriz');
                   writeln('En tres segundos sera redirigido');
                   delay(3000);
                   clrscr;
                   writeln('Vuelva a introducir el epicentro');
                   for i:=1 to 2 do
                       begin
                            readln(epi[i]);
                       end;
              end
           else
               begin
                    aux:=1;
               end;
     Until (aux=1);
end;

Begin
     IntroducirRegion(region,reg);
     //ValidarNumRegion(nreg);
     IntroducirMatriz(mn,fil,col);
     IntroducirGradoSismo(gs);
     IntroducirEpicentro(epi);
     clrscr;
     writeln('Las dimensiones de la matriz son: ',fil,'x',col);
     writeln('El grado del sismo es: ',gs);
     write('El epicentro es: ');
     for i:=1 to 2 do
         begin
              write(epi[i],' ');
         end;
     gotoxy(19,3);
     write(',');
     readkey;
End.
