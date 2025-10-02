declare

v_texto := 'El valor del numero es: '

begin

for numero in 1..7 loop
    
    dbms_output.put_line('El numero es: ' || v_contador);
    
end loop;

end;