create or replace function calcular_valor_pedido(p_idpedido number) return number is --se pueden agregar mas parametros con una coma

cursor articulos(v_pedido number) is
select pa.cantidad,a.precio
from pedidos_articulos pa
inner join articulos a on a.idarticulo = pa.idarticulo
where pa.idpedido = v_pedido;

v_total number := 0;
v_porcentaje_costo_entrega number;
v_costo_entrega number;

begin

    select c.costoentrega
    into v_porcentaje_costo_entrega
    from canales_venta c
    inner join pedidos p on c.idcanalventa = p.idcanalventa
    where p.idpedido = p_idpedido;
    
    for art in articulos(p_idpedido) loop
        v_total := v_total+(art.precio*art.cantidad);
    end loop;
    
    v_costo_entrega := (v_porcentaje_costo_entrega*v_total)/100;
    
    v_total := v_total+v_costo_entrega;
    
    return v_total;
    
exception
    when others then
    
    dbms_output.put_line('Hubo un error...');    
end;

select calcular_valor_pedido(2) from dual;

select p.*, calcular_valor_pedido(p.idpedido) from pedidos p