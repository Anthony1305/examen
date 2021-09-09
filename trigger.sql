create or replace function preciopelicula() returns trigger
as $$ declare
		pedido date;
		valoralquiler int;
begin
select fechaprestamo into pedido from alquiler where idalquiler = new.idalquiler;		
select into valoralquiler extract(days from (new.FECHAENTREGA::date)) - extract(days from (pedido ::date));		
update alquiler set valor=valoralquiler where idalquiler = new.idalquiler;    
return new;	
end;
$$
language plpgsql;

create trigger preciopeliculaT after update on alquiler for each row WHEN (pg_trigger_depth() = 0)
execute procedure preciopelicula();

--prueba
update alquiler set fechaentrega='25/09/2021'  where idalquiler=2;
