separate (Analizador_Verbal)
procedure Visualizar_Resultado (
      Palabra       :        Tpalabra;
      Terminaciones :        Verbos;
      Coincidencias :        Tcoincidencias;
      Raiz          : in     Traiz) is
   X : Integer;
   I : Integer := Min;

   procedure Conjugar (
         Cursor : in     Integer) is
   begin
      --      for Indice in Cursor..Cursor+5 loop
      for M in Min..Raiz(I) loop
         Put(Palabra.Pal(M));
      end loop;
      for M in Min..Terminaciones(Cursor).N loop
         Put(Terminaciones(Cursor).Pal(M));
         --         end loop;
      end loop;

   end Conjugar;

begin

   --Con esto se indica la persona del verbo.
   while I <= Max loop
      if Coincidencias(I) = True then
         --Ahora miramos qué forma verbal es.
         X := I mod 6;
         if X = 1 then
            Put("Primera persona del singular.");
         elsif X = 2 then
            Put_Line("Segunda persona del singular.");
         elsif
               X = 3 then
            Put("Tercera persona del singular.");
         elsif
               X = 4 then
            Put("Primera persona del plural.");
         elsif
               X = 5 then
            Put("Segunda persona del plural.");
         elsif X = 0 then
            Put("Tercera persona del plural.");
         end if;
         Put("Verbo: ");
         for M in Min..Raiz(I) loop
            Put(Palabra.Pal(M));
         end loop;
         if Terminaciones=Terminaciones_Ar then
            Put("AR");
         elsif Terminaciones=Terminaciones_Er then
            Put("ER");
         elsif Terminaciones=Terminaciones_Ir then
            Put("IR");
         end if;
         New_Line;
         --Averiguamos el tiempo verbal.
         if 1 <= I and I <= 6 then
            Put_Line("Tiempo Presente.");
            Put("Yo ");
            Conjugar(1);
            New_Line;
            Put("Tu ");
            Conjugar(2);
            New_Line;
            Put("El ");
            Conjugar(3);
            New_Line;
            Put("Nosotros ");
            Conjugar(4);
            New_Line;
            Put("Vosotros ");
            Conjugar(5);
            New_Line;
            Put("Ellos ");
            Conjugar(6);
            New_Line;


         elsif       7 <= I and I <= 12 then
            Put_Line("Tiempo Preterito Imperfecto.");
            Put("Yo ");
            Conjugar(7);
            New_Line;
            Put("Tu ");
            Conjugar(8);
            New_Line;
            Put("El ");
            Conjugar(9);
            New_Line;
            Put("Nosotros ");
            Conjugar(10);
            New_Line;
            Put("Vosotros ");
            Conjugar(11);
            New_Line;
            Put("Ellos ");
            Conjugar(12);
            New_Line;

         elsif
               13 <= I and I <= 18 then
            Put_Line("Tiempo Preterito Perfecto.");
            Put("Yo ");
            Conjugar(13);
            New_Line;
            Put("Tu ");
            Conjugar(14);
            New_Line;
            Put("El ");
            Conjugar(15);
            New_Line;
            Put("Nosotros ");
            Conjugar(16);
            New_Line;
            Put("Vosotros ");
            Conjugar(17);
            New_Line;
            Put("Ellos ");
            Conjugar(18);
            New_Line;

         elsif
               19 <= I and I <= 24 then
            Put_Line("Tiempo Futuro.");
            Put("Yo ");
            Conjugar(19);
            New_Line;
            Put("Tu ");
            Conjugar(20);
            New_Line;
            Put("El ");
            Conjugar(21);
            New_Line;
            Put("Nosotros ");
            Conjugar(22);
            New_Line;
            Put("Vosotros ");
            Conjugar(23);
            New_Line;
            Put("Ellos ");
            Conjugar(24);
            New_Line;

         elsif
               25 <= I and I <= 30 then
            Put_Line("Tiempo Condicional.");
            Put("Yo ");
            Conjugar(25);
            New_Line;
            Put("Tu ");
            Conjugar(26);
            New_Line;
            Put("El ");
            Conjugar(27);
            New_Line;
            Put("Nosotros ");
            Conjugar(28);
            New_Line;
            Put("Vosotros ");
            Conjugar(29);
            New_Line;
            Put("Ellos ");
            Conjugar(30);
            New_Line;

         end if;


      end if;
      I := I + 1;
   end loop;


end Visualizar_Resultado;