set serveroutput on;

Declare

v_contador number := 0;

begin

loop
    v_contador := v_contador+1;
    
    dbms_output.put_line('El numero es: ' || v_contador);
    
    if v_contador = 7 then
        exit;
    end if;
end loop;

end;

Declare

v_contador number := 0;

begin

loop
    v_contador := v_contador+1;
    
    dbms_output.put_line('El numero es: ' || v_contador);

    exit when v_contador = 7;
end loop;

end;


Declare

v_contador number := 0;

begin

loop
    v_contador := v_contador+1;
    
    continue when v_contador = 3;
    
    dbms_output.put_line('El numero es: ' || v_contador);

    exit when v_contador = 7;
end loop;

end;