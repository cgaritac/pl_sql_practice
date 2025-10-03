declare

v_id_articulo number(5);
v_procesador varchar2(255);
v_placa_madre varchar2(255);
v_almacenamiento varchar2(255);
v_memoria_ram varchar2(255);
v_placa_grafica varchar2(255);
v_meses_garantia number(5);

begin

    v_id_articulo := 45;
    
    extra_info_laptop(v_id_articulo,v_procesador,v_placa_madre,v_almacenamiento,v_memoria_ram,
    v_placa_grafica,v_meses_garantia);
    
    dbms_output.put_line('Procesador: '||v_procesador);
    dbms_output.put_line('Placa madre: '||v_placa_madre);
    dbms_output.put_line('Almacenamiento: '||v_almacenamiento);
    dbms_output.put_line('Memoria RAM: '||v_memoria_ram);
    dbms_output.put_line('Placa Grafica: '||v_placa_grafica);
    dbms_output.put_line('Meses garantia: '||v_meses_garantia);

end;