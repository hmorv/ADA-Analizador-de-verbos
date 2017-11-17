separate (Analizador_Verbal)
procedure Buscar_Terminaciones (
      Terminaciones :        Verbos;
      Palabra       :        Tpalabra;
      Coincidencias :    out Tcoincidencias;
      Raiz          :    out Traiz) is
   I : Integer := Min;
   J : Integer;

   function Comparar (
         Palabra,
         Term    : Tpalabra)
     return Boolean is
      K : Integer;

   begin
      J := Palabra.N;
      K:=Term.N;
      while  (J/=0 and K /=0) and then Palabra.Pal(J)= Term.Pal(K) loop
         J:=J-1;
         K:=K-1;
      end loop;
      if J/=0 and K /=0 then
         --                  Raiz(I):=J;
         return Palabra.Pal(J)= Term.Pal(K);
      else
         --         Raiz(I):=J;
         return True;

      end if;

   end Comparar;
begin
   
   while I <= Max loop
      if Comparar(Palabra,Terminaciones(I)) then
         Raiz(I):=J;
         Coincidencias(I) := True;
      end if;
      I := I +1;
   end loop;
   --      end if;
   --   end if;
end Buscar_Terminaciones;