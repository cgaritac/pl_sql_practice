declare
 
cursor cur_opiniones is
select o.*
from opinion o
inner join pelicula p on o.idpelicula = p.idpelicula
where o.idpelicula = 5;
 
begin
 
    for op in cur_opiniones loop
    
        dbms_output.put_line(op.opinion);
    
    end loop;
 
end;

declare
 
cursor cur_opiniones(p_id_usuario number) is
select o.opinion, p.titulo
from opinion o
inner join pelicula p on o.idpelicula = p.idpelicula
where o.idusuario = p_id_usuario;
 
begin
 
    for op in cur_opiniones(1) loop
        
        dbms_output.put_line(upper(op.titulo));
        dbms_output.put_line(op.opinion);
    
    end loop;
 
end;


declare
 
cursor cur_opiniones(p_id_pelicula number) is
select o.*, u.apodo
from opinion o
inner join usuario u on o.idusuario = u.idusuario
where o.idpelicula = p_id_pelicula;
 
v_afectadas number;
v_nueva_opinion varchar(140);
 
begin
 
    for op in cur_opiniones(4) loop
        
      v_nueva_opinion:= op.apodo||': '||op.opinion;
      
      update opinion set opinion = v_nueva_opinion
      where idopinion = op.idopinion;
      
      v_afectadas:= sql%rowcount;
      
      dbms_output.put_line('Afectadas: '||v_Afectadas);
    
    end loop;
 
end;