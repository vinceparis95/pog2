module queries

sq1c = "USE pgdb1"
sq2 = "SHOW TABLES;"
q3 = "CREATE TABLE hb8(name VARCHAR(100), group VARCHAR(100) );"
sq2bb = "USE hb3; SHOW COLUMNS"

sq4b = "SELECT first_name, last_name FROM pgdb1;"
dropb = "DROP TABLE USERS;"

f = "INSERT INTO pgdb1.hb3 (name) VALUES (suchi);"
desc3 = "DESCRIBE pgdb1.hb3;"

sq6c = "SHOW COLUMNS FROM pgdb1.hb3;"
sq6d = "SHOW COLUMNS FROM databases;"

addcol = "INSERT INTO hb3 (b1, b2, b3, b4, b5, b6, b7);"
addcol = "INSERT INTO hb3 (b1, b2, b3, b4, b5, b6, b7);"

addcol3= "INSERT INTO hb3 (b1);"


export f, sq1d, sq1c, sq2, q3, sq3b, sq2bb, sq4b, dropb, sq6c, addcol,desc3, addcol3

end
