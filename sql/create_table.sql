USE ${hivevar:database};
DROP TABLE ${database}.employee;
CREATE TABLE IF NOT EXISTS ${database}.employee (
 id int,
 name string,
 age int,
 gender string )
 COMMENT 'Employee Table'
 ROW FORMAT DELIMITED
 FIELDS TERMINATED BY ',';

SET hivevar:table=employee;

INSERT INTO ${hivevar:database}.${hivevar:table} VALUES
(11,'Ram',50,'M');
INSERT INTO employee VALUES
(13,'Mari',51,'M'),
(14,'Pat',34,'F'),
(18,'Mari',30,'M');
-- to include header
SET hive.cli.print.header=true;
SELECT * FROM ${hivevar:database}.${hivevar:table}
where name = '${hivevar:name}'
AND age = ${hivevar:age}