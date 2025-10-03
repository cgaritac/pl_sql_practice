select * from articulos_sucursales;

create or replace procedure ordenar_a_fabrica is 

cursor articulos is 
select a.idarticulo, a.stock,a.idsucursal
from articulos_sucursales a;

v_mejor_precio number;
v_idfabricante number;
v_siguiente_id number;

begin

    for art in articulos loop
    
        if art.stock = 0 then
        
        select min(precio)
        into v_mejor_precio
        from articulos_fabricantes af
        where af.idarticulo = art.idarticulo        
        group by idarticulo;
        
        select idfabricante
        into v_idfabricante
        from articulos_fabricantes af
        where af.idarticulo = art.idarticulo and
        af.precio = v_mejor_precio;
        
        select max(idpedidofabrica)+1
        into v_siguiente_id
        from pedido_fabrica;
        
        insert into pedido_fabrica(idpedidofabrica, idsucursal, idarticulo, idfabricante, fechapedido, cantidad)
        values(v_siguiente_id, art.idsucursal,art.idarticulo,v_idfabricante,sysdate,10);
        
        end if;
    
    end loop;

end;

begin

    ordenar_a_fabrica();

end;

select * from pedido_fabrica;