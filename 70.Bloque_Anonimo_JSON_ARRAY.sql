declare

v_articulo_esp articulos.especificaciones%type;
j_articulo_esp json_object_t;
v_articulo_esp_actualizado articulos.especificaciones%type;
j_apps_array json_array_t;

begin

    select a.especificaciones
    into v_articulo_esp
    from articulos a
    where a.idarticulo = 5;
    
    j_articulo_esp := json_object_t(v_articulo_esp);
    j_apps_array := json_array_t(j_articulo_esp.get('apps_preinstaladas'));
           
    dbms_output.put_line('Tamaño: '||j_apps_array.get_size);
    
    for indice in 0..j_apps_array.get_size-1 loop
        dbms_output.put_line(j_apps_array.get_string(indice));
    end loop;
    
    dbms_output.put_line('Agregamos Snapchat');
    j_apps_array.append('Snapchat');
    dbms_output.put_line(j_apps_array.stringify);
      
    dbms_output.put_line('Agregamos Telegram');
    j_apps_array.put(1,'Telegram');
    dbms_output.put_line(j_apps_array.stringify);
    
    dbms_output.put_line('Removimos Telegram');
    j_apps_array.remove(1);
    dbms_output.put_line(j_apps_array.stringify);
    
    v_articulo_esp_actualizado := j_articulo_esp.stringify;
     
    update articulos set especificaciones = v_articulo_esp_actualizado
    where idarticulo = 5;

end;