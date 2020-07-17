program title;
uses crt;
const
     reg1 = 'Cordillera Central';
     reg2 = 'Cordillera Oriental';
     reg3 = 'Sistema Coriano';
     reg4 = 'Lago de Maracaibo';
     reg5 = 'Los Andes';
     reg6 = 'Los Llanos';
     reg7 = 'Sistema Deltaico';
     reg8 = 'Sur del Orinoco';
     reg9 = 'Las Islas';
type
    z = array[1..2] of integer;
var
   fil,col,i,gs,nreg:shortint;
   reg:string;
   epi:z;

function ValidarNumRegion(nreg:shortint):shortint;
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
              y:=1;
         end;
     ValidarNumRegion:=y;
end;

function ValidarRegion(reg:string):shortint;
var
   y:shortint;
begin
     if (reg<>reg1) or (reg<>reg2) or (reg<>reg3) or (reg<>reg4) or (reg<>reg5) or (reg<>reg6) or (reg<>reg7) or (reg<>reg8) or (reg<>reg9) then
        begin
             y:=0;
             writeln('El nombre de la region no concuerda con las regiones dadas');
        end
     else
          begin
               y:=1;
          end;
     ValidarRegion:=y;
end;

function ValidarMaxMatriz(fil,col:shortint):shortint;
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

function ValidarNegMatriz(fil,col:shortint):shortint;
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

Function ValidarEpicentro(epi:z; var fil,col:shortint):z;
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

procedure IntroducirMatriz(var fil,col:shortint);

begin
     Repeat
           Repeat
                 clrscr;
                 writeln('Introduzca las filas de la matriz');
                 readln(fil);
                 writeln('Introduzca las columnas de la matriz');
                 readln(col);
                 delay(500);
           Until (ValidarNegMatriz(fil,col)=1)
     Until (ValidarMaxMatriz(fil,col)=1);
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

    { writeln('Aqui se introduce la ruta del archivo');
     readln(arch);}
     ValidarRegion(reg);
     ValidarNumRegion(nreg);
     IntroducirMatriz(fil,col);
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
