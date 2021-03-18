#!/bin/bash

mysql --local-infile=1 --user=root --host=localhost  -e "USE library; LOAD DATA LOCAL INFILE 'books.csv' INTO TABLE genres FIELDS TERMINATED BY ',' (@Title, @Auhtor, @Genre) SET Name = @Genre;" -proot
# mysql --local-infile=1 --user=root --host=localhost  -e "USE library; LOAD DATA LOCAL INFILE 'books.csv' INTO TABLE books FIELDS TERMINATED BY ',' (@Title, @Genre, @Height) SET Title = @Title, PageNumber = @Height; SET Genre = (SELECT id FROM genres WHERE name = @Genre)" -proot

echo "Commande execute"