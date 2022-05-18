--Таблица employees
--Создать таблицу employees
-- id. serial,  primary key,
--employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.


create table employees (
id serial primary key,
employee_name varchar(50) not null
);
select * from employees

insert into employees(employee_name)
values ('Haven Huber'),
       ('Pablo Rivers'),
       ('Paisley Hull'),
       ('Felipe Ramos'),
       ('Ashtyn Shields'),
       ('Armani Smith'),
       ('Rayne Marks'),
       ('Carmen Keith'),
       ('Howard Bush'),
       ('Emilie Gentry'),
       ('Rodolfo Ingram'),
       ('Karissa Crawford'),
       ('Kaiya Russo'),
       ('Ashley Bates'),
       ('Harley Mercer'),
       ('Ace Kent'),
       ('Kenley Holland'),
       ('Marvin Villa'),
       ('Tamia Pope'),
       ('Luis Kane'),
       ('Alannah Golden'),
       ('Alayna Morales'),
       ('Jazlyn Adams'),
       ('Evan Cordova'),
       ('Cordell Scott'),
       ('Leilani Newman'),
       ('Angelique Hernandez'),
       ('Carla Leonard'),
       ('Shayna Shaffer'),
       ('Chaya Moore'),
       ('Peter Mckee'),
       ('Maxwell Santos'),
       ('Morgan Everett'),
       ('Gianna Glass'),
       ('Aisha Church'),
       ('Colton Mcintosh'),
       ('Alicia Shea'),
       ('Sydnee Vang'),
       ('Dominique Michael'),
       ('Kody Mayo'),
       ('Elias Hogan'),
       ('Luciano Rojas'),
       ('Kayley Nichols'),
       ('Hayley Berg'),
       ('Caitlin Hoffman'),
       ('Lyric Bell'),
       ('Victor Gordon'),
       ('Allen Mcgee'),
       ('Presley Powers'),
       ('Damaris Weber'),
       ('Jayda King'),
       ('Yareli Roach'),
       ('Amanda Cuevas'),
       ('Frankie Lewis'),
       ('Jamar Wiley'),
       ('Cedric Leon'),
       ('Jameson Christensen'),
       ('Ean Ramos'),
       ('Maxim Whitaker'),
       ('Kylan Novak'),
       ('Ernesto Forbes'),
       ('Cruz Nolan'),
       ('Rowan Eaton'),
       ('Kade Raymond'),
       ('Anderson Bernard'),
       ('Lilah Estrada'),
       ('Zechariah Farmer'),
       ('Dakota Olsen'),
       ('Colt Chandler'),
       ('Taylor Howell');
 
 --Таблица salary
--Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
--Наполнить таблицу salary 16 строками:1000,1100,1200,1300, ..., 2500.
 
create table salary(
id serial primary key,
monthly_salary Int not null);

insert into salary(monthly_salary)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
 
-- Таблица employee_salary

--Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary(
id serial primary key,
employee_id Int not null unique,
salary_id Int not null);

insert into employee_salary(id,employee_id,salary_id)
values (default,3,7),
       (default,1,4),
       (default,5,9),
       (default,40,13),
       (default,23,4),
       (default,11,2),
       (default,52,10),
       (default,15,13),
       (default,26,4),
       (default,16,1),
       (default,33,7),
       (default,74,1),
       (default,21,5),
       (default,92,12),
       (default,9,2),
       (default,83,7),
       (default,55,16),
       (default,102,6),
       (default,107,8),
       (default,67,4),
       (default,87,7),
       (default,70,3),
       (default,34,9),
       (default,96,4),
       (default,25,15),
       (default,44,5),
       (default,47,14),
       (default,2,12),
       (default,63,8),
       (default,118,11),
       (default,59,10),
       (default,43,7),
       (default,17,2),
       (default,7,16),
       (default,19,1),
       (default,71,12),
       (default,41,11),
       (default,14,7),
       (default,115,3),
       (default,10,1);
      
