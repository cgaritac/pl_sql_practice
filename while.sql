declare

v_contador number := 0;

begin

while v_contador < 7 loop
    v_contador := v_contador+1;
    
    dbms_output.put_line('El numero es: ' || v_contador);
    
end loop;

end;