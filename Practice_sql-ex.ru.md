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





