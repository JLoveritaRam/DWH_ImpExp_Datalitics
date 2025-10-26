
===========================
Capa Gold
explicacion: relacionando las tablas
Cuidado del uso:
============================


Modelo de datos conceptual y logico:

		TB_mes (Varios)
		TB_base (Varios)

Model de datos fisico:


		TB_mes (Varios)
		TB_base (Varios)

		tener en cuenta la diferencia entre dato dimensional o de hecho
		dimensional= que describe un dato (nombre, apellido, etc)
		hecho = tiene unua definicion mas exacta en 
		BUSCAR codigos diferente entre tablas

		select disctint
		a.columnaa
		b.columnab
		from schema.tabla1 a
		left join schema.tabala2 b
		on a.columna2a = b.columna2b
		left join schema.tabla3 c
		on a.columna2a = c.columna2b
		order by 1,2


modiificando las celdas que estan incorrectas, para eso se debe preguntar a la fuente cual es la correcta

		select disctint
		a.columnaa
		b.columnab
		case when a.columnaa != 'n/a' then a.columnaa - considerando esta fuente es al corecta
			else coalesce(b.columnab, 'n/a')
		end as nuevacolumnab
		from schema.tabla1 a
		left join schema.tabala2 b
		on a.columna2a = b.columna2b
		left join schema.tabla3 c
		on a.columna2a = c.columna2b
		order by 1,2

creando VIEW DE clientes (dimension clientes)

		CREATE VIEW SCHEMAGOLD.CUSTOMERS AS
		Select
			row number() over (order by columnaa) as customer_key,
			a.columnaa as customer_Id,
			a.columnac as customer_number,
			a.columnad as first_name,
			a.columnae as last_name,
			b.columnaf as country
			a.columnag as marital status
			case when a.columnaa != 'n/a' then a.columnaa -- dato de la fuente correcta
				else coalesce(b.columnab, 'n/a')
			end as columnab,
			b.columnah as birthdate,
			a.columnai as createdate,
		from schema.tabla1 a
		left join schema.tabala2 b
		on a.columnac = b.columnaj
		LEFT JOIN schema.tablak c

creando VIEW DE productos (dimension productos)

creando VIEW DE ventas (HECHOS DE VENTAS)

evaluando la integridad de foreign key (dimenciones)

		select*
		from gold.factsales f
		left join gold.dim_customers c
		on c.customer_key = f.customer_key
		left join gold.dim_products p
		on p.product_key = f.prodcuto_key
		where c.customer_key is null

no aparecen ningun cruze de infromación (aparece vacio la respuesta)

DATA CATALOGO
Un libro pequeño que explica tablas y calculos creados en la capa gold

