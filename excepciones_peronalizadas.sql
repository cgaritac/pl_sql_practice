declare

v_job_id varchar(25);
v_afectadas number;
job_no_encontrado exception;

begin

v_job_id := 'IT_PROG';

update employees
set salary = salary*1.5
where JOB_ID = v_job_id;

v_afectadas := sql%rowcount;

if v_afectadas = 0 then
    raise job_no_encontrado;
end if;

dbms_output.put_line('Afectadas: '||v_afectadas);

EXCEPTION

when job_no_encontrado then
    dbms_output.put_line('Error');

end;