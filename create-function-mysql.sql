/***** FUNCION CORRECTA *****/

DELIMITER $$

create function preciomayor()
RETURNS varchar(255)
BEGIN
declare conteo varchar(255) default "";

SELECT  COUNT(DISTINCT h.precio) into conteo
FROM historialcompras h
INNER JOIN articulos a ON h.id_articulo = a.id_articulo 
WHERE h.id_articulo = 34 AND MONTH(fechacompra) = MONTH(DATE_ADD(CURDATE(),INTERVAL -1 MONTH));

return conteo;

END$$
DELIMITER ;


/***** END FUNCION CORRECTA **********/ 

drop function preciomayor

select preciomayor()
