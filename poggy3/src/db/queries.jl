module queries

pgdb_c_c = "CREATE TABLE hb8(name VARCHAR(100), group VARCHAR(100) );"
hb3_s_f = "SELECT name FROM hb3;"
hb3_i_f = "INSERT INTO pgdb1.hb3 (name) VALUES (suchi);"
hb3_desc = "DESCRIBE pgdb1.hb3;"
hb3_sh_c = "SHOW COLUMNS FROM pgdb1.hb3;"

export pgdb_c_c,hb3_s_f,hb3_i_f,hb3_desc,hb3_sh_c

end
