with def_palabra; USE def_palabra;
package Def_Verbos is

   --Este tipo es un array que guarda la longitudes de las "posibles" raices de verbo que el programa encuentra.
   type Traiz is array (Min..Max) of Integer;
  

   --Este tipo es otro array. En sus casillas se pone true si el verbo tiene una terminaci¢n determinada.
   --La longitud del array coincide con la longitud del tipo verbos, de m s abajo. De ese modo tendremos marcadas las coincidencias.
   type Tcoincidencias is array (Min..Max) of Boolean;

   type verbos is array (min..max) of tpalabra;
      Terminaciones_Ar: constant verbos:= (
 (('O', others => ' '),  1),--presente
 (('A', 'S', others => ' '),  2),
 (('A', others => ' '),  1),
 (('A', 'M', 'O', 'S', others => ' '),  4),
 (('µ', 'I', 'S', others => ' '),  3),
 (('A', 'N', others => ' '),  2),
 (('A', 'B', 'A', others => ' '),  3),--pret. imperfecto
 (('A', 'B', 'A', 'S', others => ' '),  4),
 (('A', 'B', 'A', others => ' '),  3),
 (('µ', 'B', 'A', 'M', 'O', 'S', others => ' '),  6),
 (('A', 'B', 'A', 'I', 'S', others => ' '),  5),
 (('A', 'B', 'A', 'N', others => ' '),  4),
 (('', others => ' '),  1),--pret. perfecto
 (('A', 'S', 'T', 'E', others => ' '),  4),
 (('à', others => ' '),  1),
 (('A', 'M', 'O', 'S', others => ' '),  4),
 (('A', 'S', 'T', 'E', 'I', 'S', others => ' '),  6),
 (('A', 'R', 'O', 'N', others => ' '),  4),
 (('A', 'R', '', others => ' '),  3),--futuro
 (('A', 'R', 'µ', 'S', others => ' '),  4),
 (('A', 'R', 'µ', others => ' '),  3),
 (('A', 'R', 'E', 'M', 'O', 'S', others => ' '),  6),
 (('A', 'R', '', 'I', 'S', others => ' '),  5),
 (('A', 'R', 'µ', 'N', others => ' '),  4),
 (('A', 'R', 'Ö', 'A', others => ' '),  4),--condicional
 (('A', 'R', 'Ö', 'A', 'S', others => ' '),  5),
 (('A', 'R', 'Ö', 'A', others => ' '),  4),
 (('A', 'R', 'Ö', 'A', 'M', 'O', 'S', others => ' '),  7),
 (('A', 'R', 'Ö', 'A', 'I', 'S', others => ' '),  6),
 (('A', 'R', 'Ö', 'A', 'N', others => ' '),  5));
     
 terminaciones_er: constant verbos:= (
 (('O', others => ' '),  1),
 (('E', 'S', others => ' '),  2),
 (('E', others => ' '),  1),
 (('E', 'M', 'O', 'S', others => ' '),  4),
 (('', 'I', 'S', others => ' '),  3),
 (('E', 'N', others => ' '),  2),
 (('Ö', 'A', others => ' '),  2),
 (('Ö', 'A', 'S', others => ' '),  3),
 (('Ö', 'A', others => ' '),  2),
 (('Ö', 'A', 'M', 'O', 'S', others => ' '),  5),
 (('Ö', 'A', 'I', 'S', others => ' '),  4),
 (('Ö', 'A', 'N', others => ' '),  3),
 (('Ö', others => ' '),  1),
 (('I', 'S', 'T', 'E', others => ' '),  4),
 (('I', 'à', others => ' '),  2),
 (('I', 'M', 'O', 'S', others => ' '),  4),
 (('I', 'S', 'T', 'E', 'I', 'S', others => ' '),  6),
 (('I', 'E', 'R', 'O', 'N', others => ' '),  5),
 (('E', 'R', '', others => ' '),  3),
 (('E', 'R', 'µ', 'S', others => ' '),  4),
 (('E', 'R', 'µ', others => ' '),  3),
 (('E', 'R', 'E', 'M', 'O', 'S', others => ' '),  6),
 (('E', 'R', '', 'I', 'S', others => ' '),  5),
 (('E', 'R', 'µ', 'N', others => ' '),  4),
 (('E', 'R', 'Ö', 'A', others => ' '),  4),
 (('E', 'R', 'Ö', 'A', 'S', others => ' '),  5),
 (('E', 'R', 'Ö', 'A', others => ' '),  4),
 (('E', 'R', 'Ö', 'A', 'M', 'O', 'S', others => ' '),  7),
 (('E', 'R', 'Ö', 'A', 'I', 'S', others => ' '),  6),
 (('E', 'R', 'Ö', 'A', 'N', others => ' '),  5)
);
      terminaciones_ir:constant verbos:= (
 (('O', others => ' '),  1),
 (('E', 'S', others => ' '),  2),
 (('E', others => ' '),  1),
 (('I', 'M', 'O', 'S', others => ' '),  4),
 (('Ö', 'S', others => ' '),  2),
 (('E', 'N', others => ' '),  2),
 (('Ö', 'A', others => ' '),  2),
 (('Ö', 'A', 'S', others => ' '),  3),
 (('Ö', 'A', others => ' '),  2),
 (('Ö', 'A', 'M', 'O', 'S', others => ' '),  5),
 (('Ö', 'A', 'I', 'S', others => ' '),  4),
 (('Ö', 'A', 'N', others => ' '),  3),
 (('Ö', others => ' '),  1),
 (('I', 'S', 'T', 'E', others => ' '),  4),
 (('I', 'à', others => ' '),  2),
 (('I', 'M', 'O', 'S', others => ' '),  4),
 (('I', 'S', 'T', 'E', 'I', 'S', others => ' '),  6),
 (('I', 'E', 'R', 'O', 'N', others => ' '),  5),
 (('I', 'R', '', others => ' '),  3),
 (('I', 'R', 'µ', 'S', others => ' '),  4),
 (('I', 'R', 'µ', others => ' '),  3),
 (('I', 'R', 'E', 'M', 'O', 'S', others => ' '),  6),
 (('I', 'R', '', 'I', 'S', others => ' '),  5),
 (('I', 'R', 'µ', 'N', others => ' '),  4),
 (('I', 'R', 'Ö', 'A', others => ' '),  4),
 (('I', 'R', 'Ö', 'A', 'S', others => ' '),  5),
 (('I', 'R', 'Ö', 'A', others => ' '),  4),
 (('I', 'R', 'Ö', 'A', 'M', 'O', 'S', others => ' '),  7),
 (('I', 'R', 'Ö', 'A', 'I', 'S', others => ' '),  6),
 (('I', 'R', 'Ö', 'A', 'N', others => ' '),  5)
);

end def_verbos;