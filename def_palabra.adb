with Ada.Text_Io;
use Ada.Text_Io;
package body Def_Palabra is

   ---------------------
   -- Guardar_Palabra --
   ---------------------

   procedure Guardar_Palabra (
         Palabra : in out Tpalabra) is
      function Convertir (
            Letra : in     Character)
        return Character is
         type Mayusculas is array (1 .. 31) of Character;
         May : constant Mayusculas := "ABCDEFGHIJKLMNOPQRSTUVWXYZµê÷‡È";
         type Minusculas is array (1 .. 31) of Character;
         Min : constant Minusculas := "abcdefghijklmnopqrstuvwxyz†Ç°¢£";
         I   :          Integer    := 1;
      begin
         while I<31 and Letra/=Min(I) loop
            I:=I+1;
         end loop;
         if Letra=Min(I)then
            return May(I);
         else
            return Letra;
         end if;
      end Convertir;

      Letra : Character;
      Idx   : Integer   := 1;
   begin
      Get(Letra);
      while Letra=' ' loop
         Get(Letra);
      end loop;
      while Letra/=' ' and Letra/='.' and Idx<=Max loop
         Palabra.N:=Palabra.N+1;
         Palabra.Pal(Palabra.N):=Convertir(Letra);
         Get(Letra);
      end loop;
   end Guardar_Palabra;

   ------------------------
   -- visualizar palabra --
   ------------------------

   procedure Visualizar_Palabra (
         Palabra : Tpalabra) is
   begin
      for I in Min..Palabra.N loop
         Put(Palabra.Pal(I));
      end loop;
   end Visualizar_Palabra;
end Def_Palabra;