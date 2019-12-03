#!/bin/bash

echo "***	RUNNING HIVE QUERY:"
hive -e "CREATE TABLE movies_from_hive(user_id INT, item_id INT, rating INT, time_stamp INT, id int, PRIMARY KEY (id));"

echo "***	EXPORTING DATA FROM MYSQL:"
sqoop export \
--connect jdbc:mysql://localhost:3306/movielens \
--username maria_dev \
--table movies_from_hive \
-m 1 \
--export-dir /data/movielens/movies
