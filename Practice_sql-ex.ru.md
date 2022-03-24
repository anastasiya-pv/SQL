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
**ON **pc.model=product.model  
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
