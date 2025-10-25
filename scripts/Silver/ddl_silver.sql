/*
===========================
Capa Silver
explicacion:
Cuidado del uso:
============================

1. Analisis de la data:

	verificar tabla por tabla
	ver top1000
	Para ver

2. Codficacion

	creacion de ddl para tablas

	creación de nuevas columnas para ver:
	a.	Créate_date: el grabado de momento de la carga
	b.	Update_date: el momento grabado de la ultima actualización
	c.	Source_system: el origen del dato
	d.	File_location: la carpeta fuente del dato grabado.

	FUENTE DE ADUNAS
	if object_id ('Mes_EneroX', 'U') is not null
		drop table Mes_EneroX;

	CREATE TABLE Mes_EneroX
		aduana
		fecha_ing
		etc..
		dwh_dato_creado datetime2 default getdate() -- para agregar una columna que indique cuando se creo el dato

	);

	scritp guardado

	crear las semanas necesarias
	crear las tablas base a relacionar

3. Testeo de calificación

	a. seleccionar todos los datos
		select from
	b. buscar duplicados
		select nombre_columna count(*) from bronce.nombretabla 
		group by nombre_columna 
		having count(*) > 1 or nombre_columna is null
	c. Los duplicados deben ser limpiados con cuidado, usando los mas recientes y elimando el resto
		select * from (
		select *,
		row_number() over (partition by nombre_columna order by nombre_de_columna_filtro desc) as flag_last
		from bronce.nombre_tabla
		) t where flag_kast = 1 and nombre_columna = numero_posicion


-- estandirización & consistencia

	como detectar los espacios dentro de la celda no deseados

	select nombrecolumna1
	from bronce.nombrecolumna2
	where nombrecolumna1 != trim (nombrecolumna1)

	como detectar resumen de valores
	select distinct nombrecolumna1
	froom nombretabla

	corregir los datos
 
	eliminando espacios
	insert into Mes.Enero
		nombrecolumna1
		nombrecolumna2
		nombrecolumna3
		nombrecolumna4
		nombrecolumna5
	select
	nombrecolumna1
	nombrecolumna2
	trim(nombrecolumna3) as nombrecolumna3  -- elimina espacios no deseados
	trim(nombrecolumna4) as nombrecolumna4 
		case when upper(nombrecolumna5) = 'F' then 'female'
			when upper (nombrecolumna5) = 'M' then 'Male'
			Else 'n/a'
		end nombrecolumna5

	dentro de una tabla hay muchos codigos y se quiere extraer una parte de la celda
	select
	replace(substring(nombrecolumna6,1,5) as nombrenuevacoluma1
	substring(nombrecolumna6, 7, len(nombrecolumna6)) as nombrenuevacoluma2

	calidad de los numeros

	select nombrecolumna7
	from nombretabla
	where nombrecolumna7 < 0

	isnull(nombrecolumna7,0) as nombrecolumna7

	dentro de la tabla las columnas de star_time debe ser menor a end_time
	puede haber nulls que comlican las cosas
	Posiciones en cadena de star y end time entre filas continuas tambien deben de tener cuidad

	solucion:
	verificar que los startime sean correlativos y son nulls
	lead (funcion para buscar dentro de la tabla otro valor)

	cast (nombrecolumna8 as date) as nombrecolumna8
	lead(nombrecoluman8) over (partition nombrecolumna7 order by nombrecoluman7)-1 as nombrecolumna9
	where nombrecolumna8 in ('dato1', 'dato2')

	como verificar que entre 3 columnas distintas sus filas tengan fechas coherentes por ejemplo
	fecha de ingreso > fechadeproceso > fechadesalia

	select *
	from nombretabla
	where nombrecolumna1 > nombrecolumna2 or nombrecolumna1 > nombrecolumna3

	como crear columnas derivadas
	basado en calculo o transformacion de nuevas columnas de existentes

	si tenemos fechas malogradas

		case
		whem nombrecoluman10 = 0 or len(nombrecoluma10) != 8 then null
		else cast(cast(nombrecoluma10 as varchar) as date)
		end as nombredecolumna10

	regla del negocio
	verificar que la venta sea iguala costo*cantidad
	
	select distinct
	colVenta
	ColCantidad
	ColPrecio
	from nombretabla
	where colventa != colcantidad*colprecio
	or colventa is null or colcantidad is null or colprecio is null
	or colventa <= 0 or colcantidad  <= 0 or colprecio  <= 0
	order by colVenta, ColCantidad, ColPrecio

	puede haber negativos, no calculados por multiplicacion, etc.

	solución
		select distint
		colventa as viejaventa
		colcantidad
		colprecio as viejoperico
		case when colventa is null or colventa <=0 or colventa != colcantidad*ABS(colprecio)
			then colcantidad* ABS(colprecio=
			else colventa
		end as colventa
		case when colprecio is null or colprecio <= 0
			then colvetna/nullif(colcantidad,0)
			else colprecio
		end as colprecio
		from bronce.tabla1
		where colventa != colcantidad*colprecio



	codigos diferentes entre tablas a relacionar

	select
	nombrecol11
		case when nombrecol11 like 'yyy%' then substring (nombrecol11, 4, len (nombrecol11))
		else nombrecol11
		end as nombrecol11
	col12,
	col13
	from bronce.tabla1

	si por error la fecha de nacimiento es a futuro entonces

	case when colnacimiento > getdate() then null
		else colnacimiento
	end as colnacimiento

	reemplazar un valor dentro de una celda que no corresponde

	select
	replace (col13, '-', '') col13,
	from tabla1 

	nombres resumen o nombres completos caso de paises

	case when trim(col14= 'de' then germany
		when trim(8col14) in ('us','usa') then 'united states'
		when trim (col14) = '' or col14 is null then 'n/a'
		else triim(col14)
	end as col14
	from tabal1

	crer todo esta script como un procedure stored


4. Documentar y versionar

*/

