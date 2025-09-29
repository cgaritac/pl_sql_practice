select * from employees
where employee_id = 100

update employees set first_name = 'Juan'
where employee_id = 100

insert into regions(region_id, region_name)
values(5,'Oceania')

select * from regions

commit --Confirmar el registro en la DB

rollback --Es para deshacer cambios antes de hacer un commit