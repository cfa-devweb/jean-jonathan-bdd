#!/bin/bash

mysql --local-infile=1 --user=root --host=localhost  -e "USE library; LOAD DATA LOCAL INFILE 'books.csv' INTO TABLE authors FIELDS TERMINATED BY ',' ENCLOSED BY '\"' IGNORE 1 LINES (@Title, @Author) SET Name = @Author;" -proot
mysql --local-infile=1 --user=root --host=localhost  -e "USE library; LOAD DATA LOCAL INFILE 'books.csv' INTO TABLE books FIELDS TERMINATED BY ',' ENCLOSED BY '\"' IGNORE 1 LINES (@Title, @Author, @Genre, @Height, @Publisher) SET Title = @Title, Genre = @Genre, Height = @Height, Publisher = @Publisher;" -proot
# mysql --local-infile=1 --user=root --host=localhost  -e "USE library; LOAD DATA LOCAL INFILE 'books-parse.csv' INTO TABLE books FIELDS TERMINATED BY ',' (@Title, @Genre, @Height) SET Title = @Title, Height = @Height; SET Genre = (SELECT id FROM genres WHERE name = @Genre)" -proot

echo "Executed command"