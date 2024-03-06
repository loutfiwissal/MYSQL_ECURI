Enter password: ***********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.36 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bd_vol             |
| centre_formation   |
| djallabasoft       |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| performance_schema |
| sakila             |
| stordb             |
| sys                |
| test1              |
| tramway            |
| world              |
+--------------------+
14 rows in set (0.01 sec)

mysql> create database ecuri;
Query OK, 1 row affected (0.03 sec)

mysql> use ecuri;
Database changed
mysql> create table personnes (
    -> ID_PER int primary key,
    -> nom_per varchar (20),
    -> prenom_per varchar (20),
    -> tele int ,
    -> adresse_per varchar(20),
    -> fonction varchar (20),
    -> ID_PERSONNE_SUP int );
Query OK, 0 rows affected (0.08 sec)

mysql> create table cheval(
    -> ID_CH int primary key,
    -> nom_chev varchar(20),
    -> num_tatto int,
    -> couleur_chev varchar(20),
    -> num_cheva_mere int,
    -> num_chev_pere int,
    -> nom_race varchar (10),
    -> nump_eleve int );
Query OK, 0 rows affected (0.09 sec)

mysql> create table proprietaire(
    -> ID_PER int ,
    -> ID_CH int ,
    -> prix_ch float,
    -> date_pro date,
    -> primary key (ID_PER,ID_CH)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table concours (
    -> nom_con varchar(20),
    -> annee year ,
    -> nb_participant int,
    -> primary key (nom_con,annee)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> create table participation (
    -> ID_CH int ,
    -> nom_con varchar(20),
    -> annee year,
    -> nombr_particip int,
    -> place varchar(20),
    -> primary key (ID_CH,nom_com)
    -> );
ERROR 1072 (42000): Key column 'nom_com' doesn't exist in table
mysql> create table participation (
    ->  ID_CH int ,
    -> nom_con varchar(20),
    -> annee year,
    ->  nombr_particip int,
    ->  place varchar(20),
    -> primary key (ID_CH,nom_com)
    -> );
ERROR 1072 (42000): Key column 'nom_com' doesn't exist in table
mysql> create table participation (
    -> ID_CH int ,
    ->  nom_con varchar(20),
    -> annee year,
    -> nombr_particip int,
    -> place varchar(20),
    -> primary key (ID_CH,nom_con)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create table croissance (
    -> ID_CRO int,
    -> mois int,
    -> taille_cro float,
    -> poids_cro float,
    -> ID_CH int,
    -> primary key (ID_CRO)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create table race (
    -> NOM_RACE int primary key,
    -> poids_type float,
    -> taille_type float);
Query OK, 0 rows affected (0.03 sec)

mysql> alter table participation
    -> drop column place;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    -> drop nombre_particip;
ERROR 1091 (42000): Can't DROP 'nombre_particip'; check that column/key exists
mysql>  alter table participation
    -> drop nombr_particip;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table participation
    -> add primary key (annee);
ERROR 1068 (42000): Multiple primary key defined
mysql> desc personnes;
+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| ID_PER          | int         | NO   | PRI | NULL    |       |
| nom_per         | varchar(20) | YES  |     | NULL    |       |
| prenom_per      | varchar(20) | YES  |     | NULL    |       |
| tele            | int         | YES  |     | NULL    |       |
| adresse_per     | varchar(20) | YES  |     | NULL    |       |
| fonction        | varchar(20) | YES  |     | NULL    |       |
| ID_PERSONNE_SUP | int         | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> desc propriaitaire;
ERROR 1146 (42S02): Table 'ecuri.propriaitaire' doesn't exist
mysql>  desc propriaitair ;
ERROR 1146 (42S02): Table 'ecuri.propriaitair' doesn't exist
mysql> desc proprietaire;
+----------+-------+------+-----+---------+-------+
| Field    | Type  | Null | Key | Default | Extra |
+----------+-------+------+-----+---------+-------+
| ID_PER   | int   | NO   | PRI | NULL    |       |
| ID_CH    | int   | NO   | PRI | NULL    |       |
| prix_ch  | float | YES  |     | NULL    |       |
| date_pro | date  | YES  |     | NULL    |       |
+----------+-------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> desc cheval;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| ID_CH          | int         | NO   | PRI | NULL    |       |
| nom_chev       | varchar(20) | YES  |     | NULL    |       |
| num_tatto      | int         | YES  |     | NULL    |       |
| couleur_chev   | varchar(20) | YES  |     | NULL    |       |
| num_cheva_mere | int         | YES  |     | NULL    |       |
| num_chev_pere  | int         | YES  |     | NULL    |       |
| nom_race       | varchar(10) | YES  |     | NULL    |       |
| nump_eleve     | int         | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> desc concours;
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| nom_con        | varchar(20) | NO   | PRI | NULL    |       |
| annee          | year        | NO   | PRI | NULL    |       |
| nb_participant | int         | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> descparticipation;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'descparticipation' at line 1
mysql> desc participation ;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| ID_CH   | int         | NO   | PRI | NULL    |       |
| nom_con | varchar(20) | NO   | PRI | NULL    |       |
| annee   | year        | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc croissance ;
+------------+-------+------+-----+---------+-------+
| Field      | Type  | Null | Key | Default | Extra |
+------------+-------+------+-----+---------+-------+
| ID_CRO     | int   | NO   | PRI | NULL    |       |
| mois       | int   | YES  |     | NULL    |       |
| taille_cro | float | YES  |     | NULL    |       |
| poids_cro  | float | YES  |     | NULL    |       |
| ID_CH      | int   | YES  |     | NULL    |       |
+------------+-------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> desc race;
+-------------+-------+------+-----+---------+-------+
| Field       | Type  | Null | Key | Default | Extra |
+-------------+-------+------+-----+---------+-------+
| NOM_RACE    | int   | NO   | PRI | NULL    |       |
| poids_type  | float | YES  |     | NULL    |       |
| taille_type | float | YES  |     | NULL    |       |
+-------------+-------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql>  alter table personnes
    ->  add foreign key (ID_PERSONNE_SUP) references personnes (ID_PER);
Query OK, 0 rows affected (0.16 sec)
Records: 0  Duplicates: 0  Warnings: 0


mysql> insert into personnes values
    -> (10,'meryam','amzil',0612345645,'marrakech','directrice',10),
    -> (20,'farah','saiza',063456789,'agadir','secretaire',20),
    -> (30,'wissal','loutfi',0678543298,'rabat','comptable',30),
    ->  (40,'rihab','kabadj',0678976543,'casa','proprietaire',40);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into race values
    -> ('ARABIAN',100.0,1.60),
    -> ('MUSTANG',200.0,1.80),
    -> ('ANDALOU',150.0,1.50);
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> insert into cheval values
    -> (1,'bavan',100,'black',1,1,'ARABIAN',10),
    -> (2,'kabour',200,'white',1,2,'MUSTANG',20),
    ->  (3,'masaoud',300,'brown',3,2,'ANDALOU',30),
    ->  (4,'avaar',400,'white',3,1,'ARABIAN',40);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into proprietaire values
    -> (10,1,10000,20000111),
    -> (20,2,20000,20000212),
    -> (30,3,30000,20000313),
    -> (40,4,40000,20000414);
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into concours values
    -> ('DRESSAGE',2022,10,'RABTA'),
    -> ('JUMPING',2024,20,'CASA'),
    -> ('TOURNAMENT',2000,30,'KECH'),
    -> ('SHOW',2015,40,'AGADIR');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> insert into participation values
    -> (1,'DRESSAGE',2022,50),
    -> (2,'JUMPING',2024,40),
    -> (3,'SHOW',2015,30),
    -> (4,'TOURNAMENT',2000,20);
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0


mysql> insert into croissance values
    -> (1,01,10,100,1),
    -> (2,02,20,200,2),
    -> (3,03,30,300,3),
    -> (4,04,40,400,4);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from personnes;
+--------+---------+------------+-----------+-------------+--------------+-----------------+
| ID_PER | nom_per | prenom_per | tele      | adresse_per | fonction     | ID_PERSONNE_SUP |
+--------+---------+------------+-----------+-------------+--------------+-----------------+
|     10 | meryam  | amzil      | 612345645 | marrakech   | directrice   |              10 |
|     20 | farah   | saiza      |  63456789 | agadir      | secretaire   |              20 |
|     30 | wissal  | loutfi     | 678543298 | rabat       | comptable    |              30 |
|     40 | rihab   | kabadj     | 678976543 | casa        | proprietaire |              40 |
+--------+---------+------------+-----------+-------------+--------------+-----------------+
4 rows in set (0.00 sec)

mysql> select * from cheval;
+-------+----------+-----------+--------------+----------------+---------------+----------+------------+
| ID_CH | nom_chev | num_tatto | couleur_chev | num_cheva_mere | num_chev_pere | nom_race | nump_eleve |
+-------+----------+-----------+--------------+----------------+---------------+----------+------------+
|     1 | bavan    |       100 | black        |              1 |             1 | ARABIAN  |         10 |
|     2 | kabour   |       200 | white        |              1 |             2 | MUSTANG  |         20 |
|     3 | masaoud  |       300 | brown        |              3 |             2 | ANDALOU  |         30 |
|     4 | avaar    |       400 | white        |              3 |             1 | ARABIAN  |         40 |
+-------+----------+-----------+--------------+----------------+---------------+----------+------------+
4 rows in set (0.00 sec)
mysql> select * from proprietaire;
+--------+-------+---------+------------+
| ID_PER | ID_CH | prix_ch | date_pro   |
+--------+-------+---------+------------+
|     10 |     1 |   10000 | 2000-01-11 |
|     20 |     2 |   20000 | 2000-02-12 |
|     30 |     3 |   30000 | 2000-03-13 |
|     40 |     4 |   40000 | 2000-04-14 |
+--------+-------+---------+------------+
4 rows in set (0.00 sec)

mysql> select * from participation;
+-------+------------+-------+------+
| ID_CH | nom_con    | annee | rant |
+-------+------------+-------+------+
|     1 | DRESSAGE   |  2022 |   50 |
|     2 | JUMPING    |  2024 |   40 |
|     3 | SHOW       |  2015 |   30 |
|     4 | TOURNAMENT |  2000 |   20 |
+-------+------------+-------+------+
4 rows in set (0.00 sec)

mysql> select * from concours;
+------------+-------+----------------+--------+
| nom_con    | annee | nb_participant | place  |
+------------+-------+----------------+--------+
| DRESSAGE   |  2022 |             10 | RABTA  |
| JUMPING    |  2024 |             20 | CASA   |
| SHOW       |  2015 |             40 | AGADIR |
| TOURNAMENT |  2000 |             30 | KECH   |
+------------+-------+----------------+--------+
4 rows in set (0.00 sec)

mysql> select * from croissance;
+--------+------+------------+-----------+-------+
| ID_CRO | mois | taille_cro | poids_cro | ID_CH |
+--------+------+------------+-----------+-------+
|      1 |    1 |         10 |       100 |     1 |
|      2 |    2 |         20 |       200 |     2 |
|      3 |    3 |         30 |       300 |     3 |
|      4 |    4 |         40 |       400 |     4 |
+--------+------+------------+-----------+-------+
4 rows in set (0.00 sec)

mysql> select * from race;
+----------+------------+-------------+
| NOM_RACE | poids_type | taille_type |
+----------+------------+-------------+
| ANDALOU  |        150 |         1.5 |
| ARABIAN  |        100 |         1.6 |
| MUSTANG  |        200 |         1.8 |
+----------+------------+-------------+
3 rows in set (0.00 sec)

mysql> select nom_chev
    -> from cheval
    -> where  nom_race = 'ARABIAN'
    -> order by nom_chev DESC;
+----------+
| nom_chev |
+----------+
| bavan    |
| avaar    |
+----------+
2 rows in set (0.00 sec)
mysql> select poids_type,taille_type
    -> from race
    ->  where NOM_RACE = 'ARABIAN';
+------------+-------------+
| poids_type | taille_type |
+------------+-------------+
|        100 |         1.6 |
+------------+-------------+
1 row in set (0.00 sec)



mysql> update personnes
    -> set  ID_PERSONNE_SUP = null
    -> where   ID_PER = 10;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
mysql> select * from personnes;
+--------+---------+------------+-----------+-------------+--------------+-----------------+
| ID_PER | nom_per | prenom_per | tele      | adresse_per | fonction     | ID_PERSONNE_SUP |
+--------+---------+------------+-----------+-------------+--------------+-----------------+
|     10 | meryam  | amzil      | 612345645 | marrakech   | directrice   |            NULL |
|     20 | farah   | saiza      |  63456789 | agadir      | secretaire   |              20 |
|     30 | wissal  | loutfi     | 678543298 | rabat       | comptable    |              30 |
|     40 | rihab   | kabadj     | 678976543 | casa        | proprietaire |              40 |
+--------+---------+------------+-----------+-------------+--------------+-----------------+
4 rows in set (0.00 sec)
mysql> select nom_per,prenom_per from personnes
    ->  where ID_PERSONNE_SUP is null;
+---------+------------+
| nom_per | prenom_per |
+---------+------------+
| meryam  | amzil      |
+---------+------------+
1 row in set (0.00 sec)

mysql> select nom_con from concours
    -> where annee = 2015 ;
+---------+
| nom_con |
+---------+
| SHOW    |
+---------+
1 row in set (0.00 sec)

