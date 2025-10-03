create or replace procedure agregar_articulo (p_idarticulo in number, p_idpedido in number, p_cantidad in number, p_mensaje out varchar2) is 

v_idsucursal number;
v_stock number;
v_idpedidosarticulos number;

begin

    select p.idsucursal
    into v_idsucursal
    from pedidos p
    where p.idpedido = p_idpedido;
    
    select a.stock
    into v_stock
    from articulos_sucursales a
    where a.idarticulo = p_idarticulo and a.idsucursal = v_idsucursal;
    
    if v_stock >= p_cantidad then
    
    select max(idpedidosarticulos+1)
    into v_idpedidosarticulos
    from pedidos_articulos;
    
    insert into pedidos_articulos(idpedido,idarticulo,cantidad,idpedidosarticulos)
    values (p_idpedido,p_idarticulo,p_cantidad,v_idpedidosarticulos);
    
    p_mensaje := 'Articulo agregado al pedido';
    
    else
        p_mensaje := 'No hay stock suficiente';
        
    end if;

end;

declare

v_mensaje varchar2(50);

begin

    agregar_articulo(8,3,2,v_mensaje);
    dbms_output.put_line(v_mensaje);

end;

select * from pedidos_articulos;