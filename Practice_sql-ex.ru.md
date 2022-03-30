**Exercise 1**- *Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd*:  
**SELECT** model,speed,hd **FROM** PC  
**WHERE** price<500
---
**Exercise 2**- *Найдите производителей принтеров. Вывести: maker*:    
**SELECT DISTINCT** maker **FROM** product  
**WHERE** type = 'Printer'  
---
**Exercise 3**- *Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.*:     
**SELECT** model,ram,screen **FROM** laptop  
**WHERE** price>1000  
---
**Exercise 4**- *Найдите все записи таблицы Printer для цветных принтеров.*:     
**SELECT** * **FROM** printer  
**WHERE** color ='y'  
---
**Exercise 5**- *Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.*:   
**SELECT** model,speed,hd **FROM** PC  
**WHERE** ((cd='12x' OR cd='24x') and (price<600))  
---
**Exercise 6**- *Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.*:  
**SELECT DISTINCT** maker,speed **FROM** laptop   
**JOIN** product  
**ON** product.model=laptop.model  
**WHERE** hd >=10  
---
**Exercise 7**- *Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).*:    
**SELECT** product.model, price **FROM** laptop  
**JOIN** product  
**ON** laptop.model=product.model  
**WHERE** maker='B'  
**UNION**  
**SELECT** product.model, price **FROM** printer  
**JOIN** product  
**ON** printer.model=product.model  
**WHERE** maker='B'  
**UNION**  
**SELECT** pc.model, price **FROM** pc  
**JOIN** product  
**ON** pc.model=product.model  
**WHERE** maker='B'  
---
**Exercise 8**- *Найдите производителя, выпускающего ПК, но не ПК-блокноты.*:   
**SELECT DISTINCT** maker **FROM** product  
**WHERE** type='PC' and maker **NOT IN**(**SELECT** maker **FROM** product **WHERE** type='laptop')  
---
**Exercise 9**- *Найдите производителя, выпускающего ПК, но не ПК-блокноты.*:   
**SELECT DISTINCT** maker **FROM** PC  
**JOIN** product  
**ON**pc.model=product.model  
**WHERE** type='pc' and speed >=450  
---
**Exercise 10**- *Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price*:   
**SELECT** model,price **FROM** printer  
**WHERE** price=(**SELECT MAX**(price) **FROM** printer)  
---
**Exercise 11**- *Найдите среднюю скорость ПК.*:   
SELECT AVG(speed) FROM PC  
---
**Exercise 12**- *Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.*:  
SELECT AVG(speed) FROM laptop  
where price>1000  
---
**Exercise 13**- *Найдите среднюю скорость ПК, выпущенных производителем A.*:  
SELECT AVG(speed) FROM PC  
JOIN product  
ON pc.model=product.model  
WHERE maker = 'A'  
---
**Exercise 14**- *Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.*:  
SELECT ships.class,ships.name,country FROM Ships  
JOIN classes  
ON classes.class=ships.class  
WHERE numGuns >= 10  
---
**Exercise 15**- *Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD*:  
SELECT hd FROM pc GROUP BY hd HAVING COUNT(*) >=2  
---
**Exercise 16**- *Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.*:  
SELECT DISTINCT pc_1.model, pc_2.model, pc_1.speed, pc_1.ram FROM pc pc_1, pc pc_2  
WHERE pc_1.speed = pc_2.speed AND pc_1.ram = pc_2.ram AND pc_1.model > pc_2.model  
---
**Exercise 17**- *Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed*:  
SELECT DISTINCT type, laptop.model, speed FROM laptop  
JOIN product  
ON product.model = laptop.model  
WHERE speed < ALL (SELECT speed FROM pc)  
---
**Exercise 18**- *Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price*:  
SELECT maker, price FROM printer   
JOIN product  
ON product.model= printer.model  
WHERE price = (SELECT MIN(price) price FROM printer WHERE color ='y')AND color ='y'  
GROUP BY maker, price  
---
**Exercise 19**- *Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.*:  
SELECT  maker, AVG(screen) avg_screen FROM laptop   
JOIN product  
ON product.model=laptop.model  
GROUP BY maker  
---
**Exercise 20**- *Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.*:  
SELECT maker, COUNT(model)model FROM product  
WHERE type='pc'  
GROUP BY maker  
HAVING COUNT(model) >=3  
---
**Exercise 21**- *Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.*:  
SELECT maker, MAX(price) max_price FROM pc  
JOIN product  
ON product.model=pc.model  
GROUP BY maker  
---
**Exercise 22**- *Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.*:  
SELECT speed, AVG(price) avg_price FROM pc  
WHERE speed > 600  
GROUP BY speed  
---
**Exercise 23**- *Найдите производителей, которые производили бы как ПК  
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.  
Вывести: Maker*:  
SELECT maker FROM pc  
JOIN product  
ON product.model=pc.model  
WHERE speed >=750 AND maker IN(SELECT maker FROM laptop JOIN product ON product.model=laptop.model WHERE speed >=750)  
GROUP BY maker  
---
**Exercise 24**- *Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.*:  
SELECT model  
FROM (  
 SELECT model, price FROM pc  
 UNION    
 SELECT model, price FROM Laptop    
 UNION  
 SELECT model, price FROM Printer) t1  
WHERE price = (SELECT MAX(price)FROM (  
  SELECT price FROM pc 
  UNION  
  SELECT price FROM Laptop  
  UNION  
  SELECT price FROM Printer) t2  
 )  
---
**Exercise 25**- *Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker*:  
SELECT DISTINCT maker FROM pc  
JOIN product  
ON product.model=pc.model  
WHERE maker  
IN(SELECT DISTINCT maker FROM product  
WHERE type='printer') AND speed= (SELECT MAX(speed) FROM pc  
WHERE ram =(SELECT MIN(ram) FROM pc)) AND  
ram=(SELECT MIN(ram) FROM pc)  
---
**Exercise 26**- *Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.*:    
SELECT SUM(prices) / SUM(models) avg_price FROM  
(SELECT COUNT(pc.model)models, SUM(price) prices FROM pc  
JOIN product  
ON product.model=pc.model  
WHERE maker ='A'  
UNION  
SELECT COUNT(laptop.model), SUM(price) FROM laptop  
JOIN product  
ON product.model=laptop.model  
WHERE maker ='A') t1  
---
**Exercise 27**- *Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.*:    
SELECT maker, AVG(hd) avg_hd FROM pc  
JOIN product   
ON product.model=pc.model  
WHERE maker IN(SELECT DISTINCT maker FROM product WHERE TYPE = 'printer')  
GROUP BY maker  
---
**Exercise 28**- *Используя таблицу Product, определить количество производителей, выпускающих по одной модели.*:      
SELECT COUNT(maker)FROM product  
WHERE maker IN(SELECT maker FROM product  
GROUP BY maker  
HAVING COUNT(model) = 1  
)  
---
**Exercise 29**- *В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o*:  
SELECT table1.point, table1.date, inc, out  
FROM income_o table1 LEFT JOIN outcome_o table2 ON table1.point = table2.point  
AND table1.date = table2.date  
UNION  
SELECT table2.point, table2.date, inc, out  
FROM income_o table1 RIGHT JOIN outcome_o table2 ON table1.point = table2.point  
AND table1.date = table2.date  
---
Exercise 30- В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
:    
SELECT point, date, SUM(sum_out), SUM(sum_inc) FROM  
(SELECT point, date, SUM(inc) as sum_inc, null as sum_out FROM Income GROUP BY point, date   
UNION  
SELECT point, date, null as sum_inc, SUM(out) as sum_out FROM Outcome GROUP BY point, date ) t1  
GROUP BY point, date order by point  
---  
Exercise 31-Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.   
SELECT class, country FROM Classes  
WHERE bore >= 16  
---
Exercise 32-Одной из характеристик корабля является половина куба калибра его главных орудий (mw). С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.  
SELECT country,cast(avg(power(bore,3)/2) as NUMERIC(6,2)) weight FROM(SELECT country,bore,name FROM Classes    
JOIN Ships   
On classes.class=ships.class  
UNION  
SELECT country, bore, ship FROM Classes   
JOIN Outcomes   
ON classes.class=outcomes.ship) t1  
Group by country  
---
Exercise 33-Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.  
SELECT ship FROM Outcomes
WHERE battle = 'North Atlantic' and result = 'sunk'
---
Exercise 34-По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей.    
SELECT name from classes,ships   
WHERE launched >=1922 AND displacement>35000 AND type='bb' AND ships.class = classes.class  
---
