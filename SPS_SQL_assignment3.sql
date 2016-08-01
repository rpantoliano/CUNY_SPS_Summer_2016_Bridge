# Author: Richard Pantoliano Jr.
# Assignment: SPS Summer Bridge 2016 SQL HW#3

# Drop & create schema used by HW
DROP SCHEMA IF EXISTS hw3;
CREATE SCHEMA hw3;

# Create necessary tables
CREATE TABLE hw3.rooms(
    rname varchar(100) PRIMARY KEY
);

CREATE TABLE hw3.groups(
	gname varchar(100) PRIMARY KEY
);

CREATE TABLE hw3.users(
    uname varchar(100) PRIMARY KEY
);

CREATE TABLE hw3.group_access(
	grid int PRIMARY KEY AUTO_INCREMENT,
	gname varchar(100) REFERENCES hw3.groups(gname),
	rname varchar(100) REFERENCES hw3.rooms(rname)
);

CREATE TABLE hw3.group_assignment(
	gaid int PRIMARY KEY AUTO_INCREMENT,
    gname varchar(100) REFERENCES hw3.groups(gname),
    uname varchar(100) REFERENCES hw3.users(uname)
);

# Insert data for individual users, groups, and rooms
INSERT hw3.rooms (rname)
	VALUES ("101"), ("102"), ("Auditorium A"), ("Auditorium B");
INSERT hw3.groups (gname)
	VALUES ("I.T."), ("Sales"), ("Operations"), ("Administration");
INSERT hw3.users (uname)
	VALUES ("Christopher"), ("Cheong woo"), ("Modesto"), ("Ayine"),
            ("Salut"), ("Heidy");

# Build relationships between users & groups, and groups & rooms
INSERT hw3.group_access (gname, rname)
	VALUES	("I.T.", "101"), ("I.T.", "102"),
			("Sales", "102"), ("Sales", "Auditorium A");
	
INSERT hw3.group_assignment (uname, gname)
	VALUES	("Modesto", "I.T."), ("Ayine", "I.T."),
			("Christopher", "Sales"), ("Cheong woo", "Sales"),
            ("Salut", "Administration");


# Show all groups and the users in each group, even if there is no one in the group.
SELECT hw3.groups.gname AS 'Group Name', hw3.group_assignment.uname as 'User'
	FROM  hw3.groups
    LEFT JOIN hw3.group_assignment
    ON hw3.groups.gname = hw3.group_assignment.gname;

# Show all rooms and the groups assigned, even if no group assigned
SELECT hw3.rooms.rname AS 'Room', hw3.group_access.gname as 'Group Access'
	FROM  hw3.rooms
    LEFT JOIN hw3.group_access
    ON hw3.rooms.rname = hw3.group_access.rname;

# Show all users, the groups they belong to, and rooms to which they are assigned.
# Sort by user, then group, then room.
SELECT hw3.users.uname AS 'User', hw3.group_assignment.gname AS 'Group', hw3.group_access.rname AS 'Room'
	FROM hw3.users
    LEFT JOIN hw3.group_assignment ON hw3.users.uname = hw3.group_assignment.uname
    LEFT JOIN hw3.group_access ON hw3.group_assignment.gname = hw3.group_access.gname
    ORDER BY User, 'Group', Room;
#    LEFT JOIN hw3.group_access
#    ON hw3.groups.gname = hw3.group_access.gname;
    
