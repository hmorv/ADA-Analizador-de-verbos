package Def_Palabra is

   Min : constant Integer := 1;
   Max : constant Integer := 30;
   type Tabla_Palabra is array (Min..Max) of Character;
   type Tpalabra is
      record
         Pal : Tabla_Palabra;
         N   : Integer       := 0;
      end record;

   procedure Guardar_Palabra (
         Palabra : in out Tpalabra);

   procedure Visualizar_Palabra (
         Palabra : Tpalabra);


end Def_Palabra;