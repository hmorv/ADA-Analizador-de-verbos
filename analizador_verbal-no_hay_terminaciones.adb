separate (Analizador_Verbal)
function No_Hay_Terminaciones (
      Coincidencias : Tcoincidencias ) 
  return Boolean is 
   I : Integer := Min;  
begin
   while Coincidencias(I) = False and I < Max loop
      I:=I+1;
   end loop;
   return Coincidencias(I) = False;
end No_Hay_Terminaciones;