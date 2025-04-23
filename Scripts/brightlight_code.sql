--
SELECT* 
FROM VIEWERSHIP AS V
Full JOIN USERPROFILES AS U ON V.USERID = U.USERID;

select gender,
count(*)as gender_count
from userprofiles
where  gender != 'None'
group by gender;

SELECT Channel2, COUNT(*) AS Views
FROM Viewership
GROUP BY Channel2
ORDER BY Views DESC
LIMIT 10;

select province,
count(*)as province_count
from userprofiles
where province != 'None'
group by province
order by province_count desc;

--Count users by gender and province
select gender,province, 
        COUNT(*)as gender_count
from userprofiles
where province != 'None' AND gender != 'None'
group by gender,province
order by gender_count desc;

select gender,
case
    WHEN Age BETWEEN 0 AND 17 THEN  '0-17'
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age >= 46 THEN '46+'
     END AS age_group,
    COUNT(*) AS user_count
FROM userprofiles
where province NOT IN ('None','null') 
AND gender NOT IN ('None','null')
AND age_group NOT IN ('None','null')
AND Age > 0 
GROUP BY Gender, age_group
ORDER BY user_count desc;


SELECT 
    race,
    ROUND(SUM(CASE WHEN gender = 'female' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS female_percentage,
    ROUND(SUM(CASE WHEN gender = 'male' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS male_percentage,
    COUNT(*) AS total_users
FROM userprofiles
WHERE race NOT IN ('None', 'null', '') 
AND gender NOT IN ('None', 'null', '')
GROUP BY race
ORDER BY total_users DESC;

SELECT 
    DAYNAME(TO_TIMESTAMP(recorddate2, 'YYYY/MM/DD HH24:MI')) AS DayOfWeek,
    COUNT(*) AS TotalViews
FROM Viewership
GROUP BY DayOfWeek
ORDER BY TotalViews DESC;

SELECT 
    u.Gender,
    v.Channel2,
    COUNT(*) AS Views
FROM 
    Viewership v
JOIN 
    UserProfiles u ON v.UserID = u.UserID
WHERE 
    u.Gender NOT IN ('None', 'null')
GROUP BY 
    u.Gender, v.Channel2
ORDER BY 
    u.Gender, Views DESC;

--Repeat Viewers (Loyal Users)
SELECT 
    v.UserID,
    COUNT(*) AS NumberOfViews
FROM 
    Viewership v
GROUP BY 
    v.UserID
HAVING 
    COUNT(*) > 1
ORDER BY 
    NumberOfViews DESC;

