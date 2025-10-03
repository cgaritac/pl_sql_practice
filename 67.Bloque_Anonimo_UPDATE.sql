declare

v_articulo_esp articulos.especificaciones%type;
j_articulo_esp json_object_t;
v_articulo_esp_actualizado articulos.especificaciones%type;


begin

    select a.especificaciones
    into v_articulo_esp
    from articulos a
    where a.idarticulo = 5;
    
    j_articulo_esp := json_object_t(v_articulo_esp);
    j_articulo_esp.put('redes','3G, 4G y 5G');
    j_articulo_esp.put('test','este es un testeo');
        
     v_articulo_esp_actualizado := j_articulo_esp.stringify;

    update articulos set especificaciones = v_articulo_esp_actualizado
    where idarticulo = 5;

end;