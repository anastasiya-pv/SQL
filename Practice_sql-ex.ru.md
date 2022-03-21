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

