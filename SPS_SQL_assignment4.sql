# Author: Richard Pantoliano Jr.
# Assignment: SPS Summer Bridge 2016 SQL HW#4

# Drop & create schema used by HW
DROP SCHEMA IF EXISTS hw4;
CREATE SCHEMA hw4;

# Create Employee Table
CREATE TABLE hw4.Employees(
    id int, 					# ID of employee
    emp_name varchar(255),		# Name of Employee
    emp_title  varchar(255),	# Title of Employee
    s_id int					# ID of Supervisor
);

#CREATE VIEW names

INSERT hw4.Employees (id, emp_name, emp_title, s_id)
	VALUES	(1, "Steve Jobs", "CEO", NULL),
			(2, "Tim Cook", "COO", 1),
            (3, "Jeff Williams", "SVP Ops", 1),
            (4, "John Ive", "SVP Ind Des", 1),
            (5, "John Couch", "VP Ed", 2),
            (6, "John Brandon", "VP Iphone Sales", 2),
            (7, "Joel Podolny", "VP HR", 1),
            (8, "Will Frederick", "VP Fullfilment", 3),
            (9, "Rita Lane", "VP Ops", 3);
            
SELECT Personnel.emp_name as 'Name', Personnel.emp_title as 'Title', Managers.emp_name as 'Manager'
	FROM hw4.Employees as Personnel
    LEFT JOIN hw4.Employees as Managers
		ON Personnel.s_id = Managers.id
	ORDER BY Managers.id;
    