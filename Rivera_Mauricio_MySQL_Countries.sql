USE world;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

/*
1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? 
Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
*/

SELECT name, code FROM country WHERE name = 'Slovenia';
SELECT * FROM countrylanguage WHERE countrycode = 'SVN';

SELECT p.name AS Nombre_Pais, l.language AS Idioma, l.percentage AS Porcentaje_idioma FROM country p 
JOIN countrylanguage l ON p.code = l.countrycode
WHERE l.language = 'Slovene'
ORDER BY Porcentaje_idioma DESC; 

/* 
2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? 
Su consulta debe devolver el nombre del país y el número total de ciudades. 
Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)
 */
 
 SELECT COUNT(name), countrycode FROM city 
 GROUP BY countrycode
 ORDER BY COUNT(name) DESC;
 
 SELECT p.name AS Nombre_Pais, COUNT(c.name) AS Cantidad_Ciudades FROM country p
 JOIN city c ON p.code = c.countrycode
 GROUP BY Nombre_Pais
 ORDER BY Cantidad_Ciudades DESC;
 
 /* 
 3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? 
 Tu consulta debe organizar el resultado por población en orden descendente. (1)
 */
 
 SELECT code FROM country WHERE name = 'Mexico';
 
 SELECT name AS Nombre_Ciudad, population AS Población FROM city 
 WHERE countrycode = 'MEX' AND population > 500000
 ORDER BY population DESC;
 
 /* 
 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
 Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
 */
 
 SELECT countrycode, language, percentage FROM countrylanguage 
 WHERE percentage > 89 ORDER BY percentage DESC;
 
 SELECT p.name AS Nombre_Pais, l.language AS Idioma, l.percentage AS Porcentaje FROM country p
 JOIN countrylanguage l ON p.code = l.countrycode
 WHERE l.percentage > 89 ORDER BY Porcentaje DESC;
 
 /* 
 5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
 */
 
 SELECT name AS Nombre_Pais, surfacearea AS Área_Superficie, population AS Población FROM country
 WHERE surfacearea < 501 AND population > 100000;
 
 /*
 6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 
 y una esperanza de vida superior a 75 años? (1)
 */
 
 SELECT name AS Nombre_Pais, governmentform AS Forma_Gobierno, capital AS Capital, lifeexpectancy AS Esperanza_Vida FROM country
 WHERE governmentform = 'Constitutional Monarchy' AND capital > 200 AND lifeexpectancy > 75;
 
 /* 
 7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? 
 La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
 */
 
 SELECT code FROM country WHERE name = "Argentina";
 SELECT * FROM city WHERE countrycode = 'ARG' AND district = 'Buenos Aires' AND population > 500000;
 
 SELECT p.name AS Nombre_Pais, c.name AS Nombre_Ciudad, c.district AS Distrito, c.population AS Población FROM country p
 JOIN city c ON p.code = c.countrycode 
 WHERE p.code = 'ARG' AND c.district = 'Buenos Aires' AND c.population > 500000;
 
 /* 
 8. ¿Qué consulta harías para resumir el número de países en cada región? 
 La consulta debe mostrar el nombre de la región y el número de países. 
 Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)
 */
 
 SELECT region, COUNT(name) FROM country
 GROUP BY region ORDER BY COUNT(name) DESC;
 