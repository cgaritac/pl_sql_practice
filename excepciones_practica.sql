declare
     
v_id_usuario number;
v_apodo varchar2(100);
v_email varchar2(100) := 'pedro@mailejemplo.com';
 
begin
 
    select u.idusuario, u.apodo
    into v_id_usuario, v_apodo
    from usuario u
    where u.email = v_email;
    
    dbms_output.put_line('Id: '||v_id_usuario||' - Apodo: '||v_apodo);
    
exception when NO_DATA_FOUND then
 
    dbms_output.put_line('No hay ningun usuario con el email '||v_email);
     
end;

declare
     
v_id_usuario number;
v_apodo varchar2(100);
v_email varchar2(100) := 'familiaperez@mailejemplo.com';
 
begin
 
    select u.idusuario, u.apodo
    into v_id_usuario, v_apodo
    from usuario u
    where u.email = v_email;
    
    dbms_output.put_line('Id: '||v_id_usuario||' - Apodo: '||v_apodo);
    
exception 
 
when NO_DATA_FOUND then
 
    dbms_output.put_line('No hay ningun usuario con el email '||v_email);
    
when TOO_MANY_ROWS then
 
    dbms_output.put_line('Hay mas de un usuario con el email '||v_email);
     
end;

declare
     
v_id_usuario number;
v_apodo varchar2(100);
v_email varchar2(100) := 'pedromailejemplo.com';
email_sin_arroba exception;
 
begin
 
    if v_email not like '%@%' then
        raise email_sin_arroba;
    end if;
 
    select u.idusuario, u.apodo
    into v_id_usuario, v_apodo
    from usuario u
    where u.email = v_email;
    
    dbms_output.put_line('Id: '||v_id_usuario||' - Apodo: '||v_apodo);
    
exception 
 
when NO_DATA_FOUND then
 
    dbms_output.put_line('No hay ningun usuario con el email '||v_email);
    
when TOO_MANY_ROWS then
 
    dbms_output.put_line('Hay mas de un usuario con el email '||v_email);
    
when email_sin_arroba then
    
        dbms_output.put_line('El email tiene un formato invalido');
     
end;

