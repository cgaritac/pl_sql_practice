create or replace function pedidos_pendientes return varchar2
is

v_cantidad number;

begin

select count(*)
into v_cantidad
from pedidos
where fechaentregado is null;

return v_cantidad;

end;

select pedidos_pendientes()
from dual;

select * from pedidos where fechaentregado is null;