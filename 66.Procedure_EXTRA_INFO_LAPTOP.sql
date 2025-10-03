create or replace procedure extra_info_laptop(p_id_articulo in number, p_procesador out varchar2, p_placa_madre out varchar2,
p_almacenamiento out varchar2, p_memoria_ram out varchar2, p_placa_grafica out varchar2, p_meses_garantia out number)
is

v_articulo_especificaciones articulos.especificaciones%type;
j_articulo_especificaciones json_object_t;
json_nulo exception;
json_no_existe_key exception;
pragma exception_init(json_nulo,-30625);
pragma exception_init(json_no_existe_key,-40565);

begin

    select a.especificaciones
    into v_articulo_especificaciones
    from articulos a
    where a.idarticulo = p_id_articulo;

    j_articulo_especificaciones := json_object_t(v_articulo_especificaciones);
    j_articulo_especificaciones.on_error(1);

    p_procesador := j_articulo_especificaciones.get_string('procesador');
    p_placa_madre := j_articulo_especificaciones.get_string('placa_madre');
    p_almacenamiento := j_articulo_especificaciones.get_string('almacenamiento');
    p_memoria_ram := j_articulo_especificaciones.get_string('memoria_ram');
    p_placa_grafica := j_articulo_especificaciones.get_string('placa_grafica');
    p_meses_garantia := j_articulo_especificaciones.get_number('meses_garantia');

    exception 
    when json_nulo then
        dbms_output.put_line('El articulo no tiene informacion sobre especificaciones');
        p_procesador := '-';
        p_placa_madre := '-';
        p_almacenamiento := '-';
        p_memoria_ram := '-';
        p_placa_grafica := '-';
        p_meses_garantia := 0;

    when json_no_existe_key then
        dbms_output.put_line('Los datos no corresponden a una laptop');
        p_procesador := '-';
        p_placa_madre := '-';
        p_almacenamiento := '-';
        p_memoria_ram := '-';
        p_placa_grafica := '-';
        p_meses_garantia := 0;

    when OTHERS then
        dbms_output.put_line('Error: '||sqlcode||' - '||sqlerrm);
 dbms_output.put_line('Los datos no corresponden a una laptop');
        p_procesador := '-';
        p_placa_madre := '-';
        p_almacenamiento := '-';
        p_memoria_ram := '-';
        p_placa_grafica := '-';
        p_meses_garantia := 0;
end;