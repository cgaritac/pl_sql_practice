--Bloque de codigo de tipo anonimo

DECLARE 
-- AQUI VAN LAS VARIABLES
mi_texto varchar(20);

BEGIN

mi_texto := 'Hola mundo!';

dbms_output.put_line(mi_texto);

--EXCEPTION

END;

DECLARE 

nombre VARCHAR(20) := 'Carlos';
edad number not null := 16; --Si se declara como not null obligatoriamente hay que inicializarla
f_nacimiento constant date := date'1999-03-01'; --Esto hace que la variable sea constante y por lo tanto no se pueda cambiar
acepta_terminos boolean;

BEGIN

nombre := 'Juan';
edad := 25;
acepta_terminos := true;

--Se concatena con ||

dbms_output.put_line('Nombre: '||nombre);
dbms_output.put_line('Edad: '||edad);
dbms_output.put_line('Fecha de nacimiento: '||f_nacimiento);

END;

DECLARE 

nombre VARCHAR(20);
edad number not null := 16; --Si se declara como not null obligatoriamente hay que inicializarla
f_nacimiento constant date := date'1999-03-01'; --Esto hace que la variable sea constante y por lo tanto no se pueda cambiar
acepta_terminos boolean;

BEGIN

nombre := &mivalor; --Esto hace que se solicite un valor para la variable en la ejecuion
edad := 25;
acepta_terminos := true;

--Se concatena con ||

dbms_output.put_line('Nombre: '||nombre);
dbms_output.put_line('Edad: '||edad);
dbms_output.put_line('Fecha de nacimiento: '||f_nacimiento);

END;