with Ada.Text_Io, Def_Palabra, Def_Verbos;
use Ada.Text_Io, Def_Palabra, Def_Verbos;
procedure Analizador_Verbal is

   --Palabra que introduce el usuario.
   Palabra : Tpalabra;

   --Esta variable interpreta si el usuario quiere introducir otra palabra(s) o no(n).
   Opcion : Character := 's';

   --Array que guarda las posibles raíces de verbo que detecta el programa.
   Raiz_Ar,
   Raiz_Er,
   Raiz_Ir : Traiz := (others => 0);

   --Tablas que reflejarán las posibles coincidencias en la búsqueda de terminaciones verbales.
   Coincidencias_Ar,
   Coincidencias_Er,
   Coincidencias_Ir : Tcoincidencias := (others => False);

   --subprogramas
   procedure Buscar_Terminaciones (
         Terminaciones :        Verbos;
         Palabra       :        Tpalabra;
         Coincidencias :    out Tcoincidencias;
         Raiz          :    out Traiz) is
   separate;

   function No_Hay_Terminaciones (
         Coincidencias : Tcoincidencias)
     return Boolean is
   separate;

   procedure Visualizar_Resultado (
         Palabra       :        Tpalabra;
         Terminaciones :        Verbos;
         Coincidencias :        Tcoincidencias;
         Raiz          : in     Traiz) is
   separate;


begin



   --Este bucle asegura la repetición del programa mientras el usuario no diga lo contrario.
   while Opcion='s' or Opcion = 'S' loop

      --Introducción.
      Put_Line("Bienvenido al analizador verbal.");
      Put_Line("Introduce una palabra seguida de punto y te dire:");
      Put_Line("         *El tiempo verbal");
      Put_Line("         *La persona verbal");
      Put_Line("         *La conjugacion completa del tiempo/tiempos que pertenecen al verbo");
      Put_Line("         *El infinitivo");
      New_Line(2);

      --Inicializamos todas las tablas.
      Palabra:= ((others => ' '), 0);
      Raiz_Ar :=(others => 0);
      Raiz_Er :=(others => 0);
      Raiz_Ir :=(others => 0);
      Coincidencias_Ar := (others => False);
      Coincidencias_Er :=(others => False);
      Coincidencias_Ir :=(others => False);





      --Guardamos la palabra.
      Guardar_Palabra(Palabra);


      --Si quisieramos visualizar la tabla donde hemos guardado la palabra lo hariamos con la siguiente orden
      --Visualizar_Palabra(Palabra);

      --Como no existen palabras que esten solo compuestas de una letra, comprobamos antes que la longitud sea mayor.
      --En caso contrario, indicamos un mensaje diciendo que lo introducido no es un verbo seguro.
      if Palabra.N > 1 then

         --Ahora hemos de mirar si es una forma verbal. Para ello haremos tres recorridos debido a que tenemos tres tablas según su conjugación.
         --hacemos un recorrido en vez de una búsqueda porque un verbo puede pertenecer a más de un tiempo o persona verbal de la la misma conjugación.
         Buscar_Terminaciones(Terminaciones_Ar, Palabra, Coincidencias_Ar, Raiz_Ar);
         Buscar_Terminaciones(Terminaciones_Er, Palabra, Coincidencias_Er, Raiz_Er);
         Buscar_Terminaciones(Terminaciones_Ir, Palabra, Coincidencias_Ir, Raiz_Ir);

         --Indica si la palabra es una forma verbal.
         if No_Hay_Terminaciones(Coincidencias_Ar) and No_Hay_Terminaciones(Coincidencias_Er) and No_Hay_Terminaciones(Coincidencias_Ir)  then
            Put("No es una forma verbal. ");
            if Palabra.Pal(Palabra.N) = 'R' then
               if Palabra.Pal(Palabra.N-1) = 'A' or Palabra.Pal(Palabra.N-1) = 'E' or Palabra.Pal(Palabra.N-1) = 'I' then
                  Put("Es un infinitivo.");
               end if;
            end if;
            New_Line;
         else
            if No_Hay_Terminaciones(Coincidencias_Ar) then
               Put_Line("No es una forma verbal con la conjugacion AR.");
            else
               --Ahora ya sabemos que es una forma verbal con conjugación -ar
               Put("Este verbo pertenece a la primera conjugacion. ");
               Visualizar_Resultado(Palabra, Terminaciones_Ar, Coincidencias_Ar, Raiz_Ar);
            end if;

            if No_Hay_Terminaciones(Coincidencias_Er) then
               Put_Line("No es una forma verbal con la conjugacion ER.");
            else
               --Ahora ya sabemos que es una forma verbal con conjugación -er
               Put("Este verbo pertenece a la segunda conjugacion. ");
               Visualizar_Resultado(Palabra, Terminaciones_Er, Coincidencias_Er, Raiz_Er);
            end if;

            if No_Hay_Terminaciones(Coincidencias_Ir) then
               Put_Line("No es una forma verbal con la conjugacion IR.");
            else
               --Ahora ya sabemos que es una forma verbal con conjugación -ir
               Put("Este verbo pertenece a la tercera conjugacion. ");
               Visualizar_Resultado(Palabra, Terminaciones_Ir, Coincidencias_Ir, Raiz_Ir);
            end if;
         end if;

      else
         Put_Line("No existe ningun verbo que solo este compuesto de una letra.");
      end if;
      Put_Line("Deseas introducirme otra palabra para que yo te haga el analisis?");
      Put_Line("Por favor, introduzcame 's' o 'S' si la repuesta es afirmativa y 'n' o 'N' en caso contrario. Gracias");
      Get(Opcion);
      while Opcion/='s' and Opcion/='S' and Opcion/='n'and Opcion/='N'loop
         --Por si el usuario escribe más de una letra, para que salte el texto restante que no interesa.
         Skip_Line;
         Put_Line("Lo sentimos, ninguna de las opciones que ha escrito es correta. Pulse 's' o 'S' si desea que trabaje con otra palabra y 'n' o 'N' si no lo desea");
         Get(Opcion);
      end loop;
   end loop;
   Put_Line("Hasta otra!!!!");
end Analizador_Verbal;