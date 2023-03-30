--2. Realice consulta que muestre información de todos asesores de la empresa EPM.

select distinct asesor.* from asesor inner join asesoria on idAsesor=asesor inner join empresa on idEmpresa=Empresa and Empresa.Nombre = 'EPM'

select distinct asesor.* from asesor,asesoria,Empresa where idAsesor=Asesor and  idEmpresa=Empresa and  Empresa.Nombre = 'EPM'

--3. Realice consulta que muestre información de los vendedores de la empresa 2010.

select * from vendedor where Empresa = '2010'

--4. Realice consulta que muestre el Nombre, la Venta mínima (VentaMin) y el Id de la empresa (IdEmpresa) para la que trabaja cada vendedor.

select Nombres, VentaMin, Empresa from vendedor

--5. Realice consulta que muestre el IdEmpresa, Nombre y el objetivo de venta (ObjVenta).

select idEmpresa, Nombre, ObjVenta from Empresa

--6. Realice consulta que muestre de los vendedores que están inactivos (Estado).

select * from vendedor where estado = 'I'

--7. Realice consulta que muestre IdVendedor, nombre, y el Id del vendedor que lo capto.

select idVendedor, nombres, Captador from vendedor

--8. Realice consulta que muestre información de todos asesores que realizaron asertoria a las empresas (Almenos una asesoria).

select distinct asesor.* from Asesor,Asesoria where idAsesor=asesor

--9. Realice consulta que muestre información de la empresa que aún no han terminado operación.

select Empresa.* from Empresa, Operacion where idEmpresa=Empresa and FechaFin is null 

--10. Realice consulta que muestre IdVendedor, nombre del vendenor que no fue captado por otro vendedor

select idVendedor, Nombres from vendedor where captador is null

--11. Realice consulta que muestre información de la empresa que están inactivas y que están realizando operación.

select distinct empresa.* from empresa, operacion where idEmpresa=Empresa and Empresa.estado = 'I' and FechaFin is null

--12. Realice consulta que muestre información de la empresa que nunca ha realizado operación.
 
 select empresa.* from empresa left join Operacion on idEmpresa=Empresa where fechaInicio is null

 --13. Realice consulta que muestre idAsesor y cantidad de asesorías realizadas por cada asesor.

 select idAsesor, count(idAsesor) as asesorias from  asesoria inner join asesor on idAsesor=asesor group by asesor.idAsesor

 --14. Realice consulta que muestre información del país donde no se está realizando operación.

 select pais.* from Pais left join operacion on  idPais=Pais where FechaInicio is null

 --15. Realice consulta que muestre IdVendedor, nombre del vendenor y la cantidad de vendedores que capto.

SELECT idVendedor, Nombres, (SELECT COUNT(*) FROM vendedor WHERE Captador = v.idVendedor) AS CantidadCaptados FROM vendedor v;

 --16. Realice consulta que muestre el máximo y el mínimo objetivo de venta (objVenta) asignado a las empresas.

 select nombre, objVenta, ventaMin from Empresa inner join vendedor on idEmpresa=empresa

 --17. Realice consulta que muestre las empresas cuyo objetivo de venta este entre 25000000 y 50000000.

 select * from Empresa where objVenta >= 25000000 and objVenta <= 50000000

 --18. Realice consulta que muestre información de los primeros 5 vendedores con las ventas mínima (VentaMin) más baja.

 select top 5 * from vendedor order by ventaMin asc

 --19. Realice consulta que muestre información de la ciudad que no es sede de ninguna empresa.

 select ciudad.* from Ciudad left join empresa on idCiudad=Sede where sede is null

--20. Realice consulta que muestre las empresas cuyo objetivo de venta sea 80000000, 40000000 ò 70000000.

select * from empresa where objVenta=80000000 or objVenta = 40000000 or objVenta = 70000000

--21. Realice consulta que muestre las empresas que tiene sede en una ciudad de un país en el cual no estén realizando operación.

select empresa.* from Empresa inner join Ciudad on sede=idCiudad 
inner join pais on pais=idPais 
left join Operacion on idPais=operacion.Pais 
where Operacion.pais is null


--TALLER #2

--2. Realice consulta que muestre por cada empresa la cantidad de vendedores. Ordene las empresas ascendentemente por el nombre

select  Nombre, count(idEmpresa) as cantidad_de_vendedores from vendedor inner join Empresa on idEmpresa=Empresa 
group by Nombre, idEmpresa order by idEmpresa asc

--3. Realice consulta que muestre el valor de venta mínima más alto que tiene asignado un trabajador

select top 1 nombres, ventaMin from vendedor order by ventaMIn asc

--4. Realice consulta me muestre el nombre y la cantidad de asesorías realizada por cada asesor.

select Nombres, count(idAsesor) as asesorias from  asesoria inner join asesor on idAsesor=asesor group by nombres, idAsesor

--5. Realice consulta que muestre información de los primeros 5 países con el menor número de habitantes.
--Mostrar los resultados ordenados ascendentemente por el número de habitantes.

select top 5 * from Pais order by habitantes asc

--6. Realice consulta me muestre por cada país las suma y el promedio de los habitantes de las ciudades que hacen parte de ese país.

select idPais, Pais.Nombre, SUM(Ciudad.habitantes) as suma, AVG(Ciudad.habitantes) as promedio 
from Pais left join Ciudad on idPais=Pais 
group by idPais, pais.nombre

--7. Realice consulta me muestre la cantidad de asesorías realizada por cada asesor en cada uno de las áreas. 
--Ordene descendentemente los asesores por su nombre 

select asesor.nombres, COUNT(idAsesor) as asesorias, Area from Asesor inner join Asesoria on idAsesor=asesor inner join Area on area=idArea 
group by nombres, idAsesor, area order by nombres desc

--8. Realice sentencia SQL que permita habilitar (Estado = A) el asesor identificado con el código 8888

UPDATE asesor SET Estado = 'I' WHERE idAsesor = 8888;

--9. Realice sentencia SQL que permita cambiar la sede de la empresa identificada con código 5050. 
--La nueva sede de la empresa será la ciudad identificada con el código C571


update Empresa set Sede = 'C571' where idEmpresa = '5050';

--10. Realice sentencia SQL que permita actualizar el código de la empresa BBVA por el código 6090 (NO TERMINADO)

INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
select 6090, 'BBVA', FechaIngreso, ObjVenta, sede, estado from Empresa where nombre = 'BBVBA'

update vendedor set Empresa = '6090' where Empresa = 5050

--11. Realice sentencia SQL que permita eliminar la empresa BBVA 

DELETE FROM Empresa WHERE idEmpresa = (SELECT idEmpresa FROM Empresa WHERE nombre = 'BBVA');


--12. Realice sentencia SQL que permita actualizar la fecha de inicio de la asesoría realizada por el asesor 1111 a la empresa 5030 
--en el área 40. La nueva fecha a establecer es 20/10/1998

update asesoria set FechaInicio = '1998/10/20' where asesor = '1111' and Empresa = '5030' and Area = '40';

--13. Realice sentencias que permita cambia la sede de la empresa Jumbo, la nueva sede será la ciudad de Madrid

UPDATE Empresa set sede = (select idCiudad from Ciudad where nombre = 'madrid') where nombre = 'Jumbo';

--14. Realice sentencia SQL que permita obtener la cantidad de operaciones que ha realizado la empresa Easy en Colombia.

select * from Operacion inner join Empresa on Empresa=idEmpresa where nombre = 'Easy' and pais = '57';

--15. Realice sentencia SQL que permita cambiar el código del asesor identificado con código 8888 por el código 9999(NO TERMINADO)

insert into asesor(IdAsesor, Nombres, Apellidos, Telefono, Direccion, Titulo, Estado)
select 9999, Nombres, Apellidos, Telefono, Direccion, Titulo, Estado from asesor where IdAsesor = 8888;

update Asesoria set asesor = 9999 where asesor = (select IdAsesor from asesor where IdAsesor = 8888);

delete from asesor where IdAsesor = 8888;
--16. Realice sentencia SQL que permita eliminar las asesorías realizadas por el asesor 1111 a la empresa 5030

delete from Asesoria where Empresa ='5030'

--17. Realice sentencia SQL que permita cambiar el captador de vendedor 9999, 
--es decir el nuevo captador será el vendedor identificado con el código 2222

update vendedor set captador = '2222' where idVendedor = '9999';

--18. Que solución ofrecería usted, si por alguna razón hubiera la necesidad de reducir en 10000 el número de habitanteS de la ciudad 
--de Medellín, lo cual también implicaría reducir en 10000 el número de habitantes del país a la cual pertenece la ciudad.

select pais.Nombre, pais.habitantes -10000 as Menos_10000, ciudad.Nombre, ciudad.habitantes -10000 as Menos_10000 
from pais inner join ciudad on idPais = pais 

--19. Realice sentencia SQL que permita obtener la sumatoria de las venta mínima (VentaMin) de los empleados de EPM

select empresa.Nombre, SUM(ventaMin) as suma_EMP 
from vendedor inner join empresa on idEmpresa=Empresa where empresa.Nombre = 'EPM' group by Empresa.nombre

--20. Realice sentencia SQL que permita finalizar las operaciones que realiza la empresa 5030 en el país cuyo código es 86.
--La fecha de finalización de operación de la empresa es “15/07/1992”

update Operacion set FechaFin = '15/07/1992' where empresa = '5030' and pais = '86'

--21. Realice sentencia SQL que permita cambiar el vendedor 9999 a la empresa Jumbo. Para realizar esta operación, 
--usted debe crear sentencia que consulte el código de la empresa Jumbo

update vendedor set Empresa = (select IdEmpresa from Empresa where Nombre = 'Jumbo') where idVendedor = 9999;

--22. Realice sentencia SQL que permita eliminar el vendedor 9999

delete from vendedor where idVendedor = 9999;

--23. Realice sentencia SQL que permita finalizar hoy las operaciones que está realizando la empresa identificada con código 4030 en el 
--país identificado con código 57. Para realizar esta operación, usted debe obtener la fecha del sistema, la cual será 
--la fecha de Finalización de operación.

update Operacion set FechaFin = getdate() where Empresa = 4030 and Pais = 57 and FechaFin is NULL

select * from Operacion order by FechaFin desc

--24. Realice sentencia SQL que permita eliminar las operaciones realizadas (finalizadas) por la empresa 5030 en Colombia. Para realizar 
--esta operación, usted debe crear sentencia que consulte si la empresa 5030 realizo operación en Colombia y devolver el código de Colombia.

delete from Operacion where Empresa = 5030 and Pais = (select IdPais from Pais where Nombre = 'Colombia') and FechaFin is NOT NULL
select * from Operacion where Empresa = 5030 and pais = (select IdPais from Pais where Nombre = 'Colombia');

--25. Realice sentencia SQL que permita finalizar hoy todas las operaciones que se iniciaron en 1990 y que aún no se han finalizado. 
--Para realizar esta operación, usted debe obtener la fecha del sistema, la cual será la fecha de Finalización de operación.

update Operacion set FechaFin = getdate() where YEAR(FechaInicio) = 1990 and FechaFin is null
select * from Operacion where YEAR(FechaFin) = 2023

--26. Realice sentencia SQL que permita activar (Estado = A) todas las empresas que estén inactivas y que
--aun estén realizando operación en algún país.

update empresa set estado = 'A' where estado = 'I' and idempresa in (select distinct empresa from operacion)

--27. Realice sentencia SQL que permita desactivar (Estado = I) todas las ciudades que no sean sede de alguna empresa.

update ciudad set estado = 'I' where idciudad not in (select sede from empresa) and estado = 'A';

--28. Realice sentencia SQL que permita eliminar los asesores que no han realizado asesoría.

delete from asesor where idasesor not in (select distinct asesor from asesoria)

--29. Realice sentencia SQL que permita cambiar el código de la empresa 5030 por el código 4070.

insert into Empresa (IdEmpresa, Nombre, FechaIngreso, ObjVenta, Sede, Estado)
select 4070, Nombre+'1', FechaIngreso, ObjVenta, Sede, Estado from Empresa where idempresa = 5030;

update Vendedor set Empresa = 4070 where Empresa = (select IdEmpresa from Empresa where idempresa = 5030);
update Operacion set Empresa = 4070 where Empresa = (select IdEmpresa from Empresa where idempresa = 5030);
update Asesoria set Empresa = 4070 where Empresa = (select IdEmpresa from Empresa where idempresa = 5030);

delete from Empresa where idempresa = 5030;
update Empresa set Nombre = REPLACE(nombre, '1', '') where idempresa = 4070;

select * from Empresa where idempresa = 4070;

--30. Que solución ofrecería usted si por alguna orden de judicial hubiera la necesidad de eliminar el Área identificada con el código 90.
--Tenga presente que la información de las asesorías realizadas por el asesor es de suma importancia para el holding.

insert into area (idarea, nombre, descripcion, estado) values (0, 'hola', null,  'n');
UPDATE Asesoria SET Area = 0 WHERE Area = 90;

DELETE FROM Area WHERE IdArea = 90;

--31. Realice sentencia SQL que permita registrar el vendedor Andrés Martínez identificado con código
--7020, teléfono 3405030, ubicado en la dirección C 75B#74 y VentaMin de 6000000; captado en la
--fecha de hoy por el vendedor identificado con código 2908. Por política del grupo holding, un vendedor
--solo podrá captar vendedores para la misma empresa para la que él trabaja; razón por la cual usted
--debe crear sentencia SQL que consulte el código de la empresa para la que trabaja el captador.

insert into vendedor (idvendedor, nombres, apellidos, telefono, direccion, ventamin, fechacaptacion, captador, empresa, estado)
values (7020, 'Andrés', 'Martínez', '3405030', 'C 75B#74', 6000000, GETDATE(), 2908, (select empresa from vendedor where idvendedor = 2908), 'A')









