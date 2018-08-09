select nompuerto, altura from puerto where categoria='E';
TALLER CONSULTAS COMPLEJAS 
Realice las siguientes consultas, debajo de cada uno escriba la sintaxis seguido 
-- 1. Obtener el código, el tipo, el color y el premio de todos los maillots que hay. 
	select * from maillot;
-- 2. Obtener el dorsal y el nombre de los ciclistas cuya edad sea menor o igual que 25 años. 
	select dorsal, nombre from ciclista where edad<=25; 
-- 3. Obtener el nombre y la altura de todos los puertos de categoría ‘E’ (Especial). 
	select nompuerto, altura from puerto where categoria='E';
-- 4. Obtener el valor del atributo netapa de aquellas etapas con salida y llegada en la misma ciudad. 
	select netapa from etapa where salida=llegada;
-- 5. ¿Cuántos ciclistas hay? 
	select count(dorsal) from ciclista;
-- 6. ¿Cuántos ciclistas hay con edad superior a 25 años?
	select count(dorsal) from ciclista where edad>25;
-- 7. ¿Cuántos equipos hay? 
	select count(nomeq) from equipo;
-- 8. Obtener la media de edad de los ciclistas. 
	select avg(edad) from ciclista;
-- 9. Obtener la altura mínima y máxima de los puertos de montaña.
	select max(altura), min(altura) from puerto;
-- 10. Obtener el nombre de cada ciclista junto con el nombre del equipo al que pertenece 
	select dorsal, nomeq from ciclista;
-- 11. Obtener el nombre de los ciclistas que sean de Banesto. 
	select nombre from ciclista where nomeq='Banesto';
-- 12. ¿Cuántos ciclistas pertenecen al equipo Amore Vita? 
	select count(dorsal) from ciclista where nomeq='Amore Vita'
-- 13. Edad media de los ciclistas del equipo TVM. 
	select avg(edad) from ciclista where nomeq='TVM';
-- 14. Nombre de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain 
	select nombre from ciclista where nomeq=(select nomeq from ciclista where nombre='Miguel Indurain');
-- 15. Nombre de los ciclistas que han ganado alguna etapa.
	select distinct etapa.dorsal, ciclista.nombre from etapa inner join ciclista on ciclista.dorsal=etapa.dorsal;
-- 16. Nombre de los ciclistas que han llevado el maillot General.
	select llevar.codigomail, ciclista.nombre from ciclista inner join llevar on ciclista.dorsal=llevar.dorsal and llevar.codigomail='MGE';
-- 17. Obtener el nombre del ciclista más joven 
	select min(edad), nombre from ciclista;
-- 18. Obtener el número de ciclistas de cada equipo. 
	SELECT DISTINCT ciclista.nomeq, count(*) AS cantidad FROM ciclista group by nomeq;
-- 19. Obtener el nombre de los equipos que tengan más de 5 ciclistas. 
	SELECT distinct ciclista.nomeq, count(nomeq) AS cantidad FROM ciclista group by nomeq having count(nomeq)>5;
-- 20. Obtener el número de puertos que ha ganado cada ciclista. 
	SELECT distinct puerto.dorsal, count(puerto.dorsal) AS cantidad FROM puerto group by puerto.dorsal;
-- 21. Obtener el nombre de los ciclistas que han ganado más de un puerto. 
	SELECT ciclista.nombre, COUNT(puerto.dorsal) AS ganadas FROM ciclista INNER JOIN puerto ON puerto.dorsal = ciclista.dorsal GROUP BY puerto.dorsal HAVING COUNT(puerto.dorsal) > 1;
-- 22. Obtener el nombre y el director de los equipos a los que pertenezca algún ciclista mayor de 33 años. 
	SELECT equipo.nomeq, equipo.director FROM equipo inner join ciclista on equipo.nomeq = ciclista.nomeq and ciclista.edad > 33;
-- 23. Nombre de los ciclistas que no pertenezcan a Kelme 
	SELECT ciclista.nombre FROM ciclista where nomeq!='Kelme';
-- 24. Nombre de los ciclistas que no hayan ganado ninguna etapa.
	SELECT ciclista.dorsal, ciclista.nombre FROM [ciclista] where not exists (select etapa.dorsal from etapa where ciclista.dorsal = etapa.dorsal);
-- 25. Nombre de los ciclistas que no hayan ganado ningún puerto de montaña. 
	SELECT ciclista.dorsal, ciclista.nombre FROM [ciclista] where not exists (select count(puerto.dorsal) as cantidad from puerto where ciclista.dorsal = puerto.dorsal and group by puerto.dorsal having count(puerto.dorsal)>1 );
-- 26. Nombre de los ciclistas que hayan ganado más de un puerto de montaña.
	select distinct ciclista.nombre from ciclista inner join puerto on ciclista.dorsal=puerto.dorsal where exists (SELECT puerto.dorsal, count(puerto.dorsal) FROM [puerto] group by puerto.dorsal having count(puerto.dorsal)>1);
-- 27. ¿Qué ciclistas han llevado el mismo maillot que Miguel Indurain?
	select distinct ciclista.nombre, llevar.codigomail from ciclista inner join llevar on ciclista.dorsal=llevar.dorsal and codigomail=(select codigomail from llevar where llevar.dorsal=(select ciclista.dorsal from ciclista where ciclista.nombre='Miguel Indurain'));
-- 28. De cada equipo obtener la edad media, la máxima edad y la mínima edad. 
	SELECT ciclista.nomeq, avg(edad), min(edad), max(edad), count(nomeq) as numerociclistas FROM [ciclista] group by nomeq;
-- 29. Nombre de aquellos ciclistas que tengan una edad entre 25 y 30 años y que no pertenezcan a los equipos Kelme y Banesto. 
	SELECT ciclista.nombre, ciclista.edad, ciclista.nomeq FROM ciclista where nomeq!='Kelme' and nomeq!='Banesto' and ciclista.edad>=25 and ciclista.edad <=30;
-- 30. Nombre de los ciclistas que han ganado la etapa que comienza en Zamora. 
	SELECT ciclista.nombre, etapa.salida from ciclista inner join etapa on ciclista.dorsal=etapa.dorsal and etapa.salida='Zamora';
-- 31. Obtén el nombre y la categoría de los puertos ganados por ciclistas del equipo ‘Banesto’. 
	SELECT puerto.nompuerto, puerto.categoria, ciclista.nombre, ciclista.nomeq	from ciclista inner join puerto on ciclista.dorsal=puerto.dorsal and ciclista.nomeq='Banesto';
-- 32. Obtener el nombre de cada puerto indicando el número (netapa) y los kilómetros de la etapa en la que se encuentra el puerto. 
	SELECT puerto.nompuerto, puerto.netapa, etapa.km FROM puerto inner join etapa on etapa.netapa=puerto.netapa group by puerto.nompuerto;
-- 33. Obtener el nombre de los ciclistas con el color de cada maillot que hayan llevado. 
	SELECT distinct llevar.dorsal, ciclista.nombre, llevar.codigomail, maillot.color from llevar inner join maillot on llevar.codigomail=maillot.codigo inner join ciclista on llevar.dorsal=ciclista.dorsal;
-- 34. Obtener pares de nombre de ciclista y número de etapa tal que ese ciclista haya ganado esa etapa habiendo llevado el maillot de color amarillo al menos una vez. 
	SELECT CICLISTA.NOMBRE, etapa.netapa from ciclista INNER JOIN etapa on ciclista.dorsal=etapa.dorsal where exists (select llevar.dorsal from llevar inner join maillot on maillot.codigo=llevar.codigomail and maillot.color='Amarillo');
-- 35. Obtener el valor del atributo netapa de las etapas que no comienzan en la misma ciudad en que acabó la anterior etapa. 
	SELECT g1.netapa, g1.salida, g1.llegada FROM etapa g1 inner JOIN etapa g2 ON g2.netapa = g1.netapa - 1 WHERE not g1.salida=g2.llegada;
-- 36. Obtener el valor del atributo netapa y la ciudad de salida de aquellas etapas que no tengan puertos de montaña. 
	select etapa.netapa, etapa.salida from etapa where etapa.netapa not in (select distinct puerto.netapa from puerto);
-- 37. Obtener la edad media de los ciclistas que han ganado alguna etapa.
	select avg(ciclista.edad) from ciclista where ciclista.dorsal in (select distinct etapa.dorsal from etapa);
-- 38. Selecciona el nombre de los puertos con una altura superior a la altura media de todos los puertos. 
	select puerto.nompuerto, puerto.altura, (select avg(puerto.altura) from puerto) as MediaAltura from puerto where puerto.altura>(select avg(puerto.altura) from puerto);
-- 39. Obtener el nombre de la ciudad de salida y de llegada de las etapas donde estén los puertos con mayor pendiente. 
	select etapa.netapa, etapa.salida, etapa.llegada from etapa where etapa.netapa in (select puerto.netapa from puerto where pendiente > (select avg(pendiente) from puerto));
-- 40. Obtener el dorsal y el nombre de los ciclistas que han ganado los puertos de mayor altura. 
	SELECT ciclista.dorsal, ciclista.nombre from ciclista where ciclista.dorsal in (select puerto.dorsal from puerto where puerto.altura>(select avg(puerto.altura) from puerto));
-- 41. Obtener el nombre del ciclista más joven que ha ganado al menos una etapa. 
	select ciclista.nombre from ciclista where ciclista.edad in (select min(ciclista.edad) from ciclista where ciclista.dorsal in (select distinct etapa.dorsal from etapa)) and ciclista.dorsal in (select etapa.dorsal from etapa);
-- 42. Obtener el valor del atributo netapa de aquellas etapas tales que todos los puertos que están en ellas tienen más de 700 metros de altura. 
	select distinct puerto.netapa from puerto where puerto.altura in( select min(puerto.altura) from puerto where puerto.altura>700 group by puerto.netapa);
-- 43. Obtener el nombre y el director de los equipos tales que todos sus ciclistas son mayores de 20 años. 
	select equipo.nomeq, equipo.director from equipo where equipo.nomeq not in ( SELECT ciclista.nomeq FROM ciclista where ciclista.edad<20 group by nomeq order by edad asc);
-- 44. Obtener el dorsal y el nombre de los ciclistas tales que todas las etapas que han ganado tienen más de 170 km (es decir que sólo han ganado etapas de más de 170 km). 
	select ciclista.dorsal from ciclista where ciclista.dorsal not in (SELECT etapa.dorsal FROM [etapa] where etapa.km<170) and ciclista.dorsal in (SELECT etapa.dorsal FROM [etapa]);
-- 45. Obtener el nombre de los ciclistas que han ganado todos los puertos de una etapa y además han ganado esa misma etapa. 
		
-- 46. Obtener el nombre de los equipos tales que todos sus corredores han llevado algún maillot o han ganado algún puerto. 
-- 47. Obtener el código y el color de aquellos maillots que sólo han sido llevados por ciclistas de un mismo equipo. 
-- 48. Obtener el nombre de aquellos equipos tal que sus ciclistas sólo hayan ganado puertos de 1ª categoría. 
-- 49. Obtener el valor del atributo netapa de aquellas etapas que tienen puertos de montaña indicando cuántos tiene. 
-- 50. Obtener el nombre de todos los equipos indicando cuántos ciclistas tiene cada uno. 
-- 51. Obtener el director y el nombre de los equipos que tengan más de 3 ciclistas y cuya edad media sea igual o inferior a 30 años. 
-- 52. Obtener el nombre de los ciclistas que pertenezcan a un equipo que tenga más de cinco corredores y que hayan ganado alguna etapa indicando cuántas etapas ha ganado. 
-- 53. Obtener el nombre de los equipos y la edad media de sus ciclistas de aquellos equipos que tengan la media de edad máxima de todos los equipos. 
-- 54. Obtener el director de los equipos cuyos ciclistas han llevado más días maillots de cualquier tipo.
