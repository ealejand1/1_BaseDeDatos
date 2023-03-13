select Name,Continent,d.Language,d.IsOfficial from Country c join CountryLanguage d on c.Code = d.CountryCode order by Continent,Name,Language;

select c.Name,c.Population,d.Name,d.Continent from City c join Country d on c.CountryCode = d.Code order by d.Continent,d.Name,c.Name;

select p.Name,c.Name from Country p join Country c on p.Code != c.Code and p.Name like concat("%",c.Name,"%");

select a.Name,a.Code,a.Population from Country a join Country b on b.Name like "Spain" and a.SurfaceArea > b.SurfaceArea;

select (a.LifeExpectancy - b.LifeExpectancy) as Anios from Country a join Country b on a.Name like "Japan" and b.Name like "Spain";

select a.Name,a.Continent,a.SurfaceArea,b.Name,b.Continent,b.SurfaceArea as Continentes from Country a join Country b on a.Code != b.Code and abs(a.SurfaceArea - b.SurfaceArea) <= 5 and a.Continent != b.Continent and b.Name > a.Name;

select truncate((b.Population * a.Percentage/100000),2) as hab,a.Language from CountryLanguage a join Country b on a.CountryCode like "CHE" and a.IsOfficial like "T" and b.Code like "CHE";

select truncate((sum((b.Percentage/100)*a.Population/100000)),3) from Country a join CountryLanguage b on b.Language like "Spanish" and a.Code=b.CountryCode group by b.Language;

select round(sum(Percentage*Population/100000000),2) as a from Country join CountryLanguage on CountryCode=Code and Language like "Spanish" and Continent like "%America%";

select a.Language,round(sum((a.Percentage/100)*b.Population/1000000),3) as millones from CountryLanguage a join Country b on a.CountryCode = b.Code group by a.Language order by millones desc limit 5;



