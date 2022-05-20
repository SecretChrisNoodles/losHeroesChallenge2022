
/*
Soluciones

Pregunta A
*/

select distinct 
empresas.id,
empresas.nombre 
from (empresas,licencias_medicas) 
where empresas.id=licencias_medicas.id_empresa 
order by empresas.id asc limit 10 ; 

/*
Pregunta B
*/

select distinct
sucursales.id ,
sucursales.nombre,
comuna.nombre
from sucursales,licencias_medicas,comuna,region
where sucursales.id = licencias_medicas.id and sucursales.id_region = region.id and region.id = comuna.id_region
order by sucursales.nombre
limit 10
;


/*
Pregunta C
*/

select distinct
licencias_medicas.n_veces_reiniciado,
tipo_licencia_medica.tipo 
from licencias_medicas,tipo_licencia_medica
where tipo_licencia_medica.id=licencias_medicas.id_tipo_licencia 
order by licencias_medicas.n_veces_reiniciado desc
;


/*
pregunta D
*/

/*
pregunta  E
*/