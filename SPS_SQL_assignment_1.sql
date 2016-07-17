#Name: Richard Pantoliano Jr
#Course: CUNY SPS Summer Bridge – SQL
#Assignment #1

# Question 1
SELECT dest, distance FROM flights where distance = (SELECT MAX(distance) FROM flights) limit 1;

# Question 2
SELECT  MAX(engines), MAX(seats) from planes GROUP BY engines;

# Question 3
SELECT COUNT(*) from flights;

# Question 4
SELECT carrier, COUNT(*) from flights GROUP BY carrier;

# Question 5
SELECT carrier, COUNT(*) from flights GROUP BY carrier ORDER BY COUNT(*) DESC;

# Question 6
SELECT carrier, COUNT(*) from flights GROUP BY carrier ORDER BY COUNT(*) DESC limit 5;

# Question 7
SELECT DISTINCT carrier, COUNT(carrier) from flights WHERE distance >= 1000 group by carrier order by COUNT(carrier) DESC limit 5;

# Question 8
SELECT day, COUNT(day) from flights group by day order by COUNT(day) DESC limit 5;