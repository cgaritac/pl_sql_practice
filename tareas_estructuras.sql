declare
 
v_id_opinion number;
v_id_pelicula number;
v_puntuacion number;
v_calificacion varchar(10);
v_titulo varchar(50);
 
begin
 
    v_id_opinion := 16;
    
    select puntuacion,idpelicula
    into v_puntuacion, v_id_pelicula
    from opinion
    where idopinion = v_id_opinion;
    
    select titulo
    into v_titulo
    from pelicula
    where idpelicula = v_id_pelicula;
    
    
    if v_puntuacion in(1,2) then
        v_calificacion := 'Mala';
    elsif v_puntuacion in(3,4) then
        v_calificacion := 'Buena';
    elsif v_puntuacion in(5) then
        v_calificacion := 'Excelente';
    end if;
    
    
    dbms_output.put_line(v_titulo||': '||v_calificacionDaCal);
 
end;


declare
 
v_base number;
v_exponente number;
v_resultado number;
v_contador number;
 
begin
 
    v_base := 2;
    v_exponente := 4;
    v_resultado := 1;
    
    v_contador := 1;
    
    while(v_contador <= v_exponente) loop
        
        v_resultado := v_resultado*v_base;
        v_contador := v_contador+1;
        
    end loop;
    
    dbms_output.put_line('Resultado: '||v_resultado);
 
end;