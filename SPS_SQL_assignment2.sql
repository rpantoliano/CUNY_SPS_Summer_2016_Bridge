#Name: Richard Pantoliano Jr
#Course: CUNY SPS Summer Bridge – SQL
#Assignment #2

# Remove previous versions of the tables
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS videos;

# Create tables
CREATE TABLE videos (
	vid int PRIMARY KEY AUTO_INCREMENT,
	title text,
	runtime int,
	url text
);
  
CREATE TABLE reviews (
	rid int AUTO_INCREMENT PRIMARY KEY,
    vid int NOT NULL,
    FOREIGN KEY(vid)  REFERENCES videos(vid),
    username varchar(255),
    nrating int,
    trating text    
);


#insert test values
INSERT INTO videos (title, runtime, url)
    VALUES
		('Introduction to MySQL Workbench','12','https://www.youtube.com/watch?v=RSHevYMwCVw'),
        ('How Indexes Work in MySQL', '49', 'https://www.youtube.com/watch?v=1hAp8tNcZLA'),
        ('How to Work With MySQL Using PHP', '58', 'https://www.youtube.com/watch?v=viyEfnAdb2Y');

INSERT INTO reviews (vid, username, nrating, trating)
	VALUES
		('1', 'bob1','4','great!!!'),
        ('1', 'jess3','0','useless and a waste of time'),
        ('3', 'rpantoliano','3','I hate php'),
        ('2', 'bjarne','5','mysql should be written in C++');
        
# Pull info from tables using a join statement
SELECT videos.vid, videos.title, videos.runtime, videos.url, reviews.username, reviews.nrating, reviews.trating FROM videos LEFT JOIN reviews ON videos.vid = reviews.vid;
