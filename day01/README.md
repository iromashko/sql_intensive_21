# Day 01 - Piscine SQL


## _First steps working with sets and JOINs in SQL_

Resume: Today you will see how to get needed data based on sets constructions and simple JOINs


## Rules of the day

- Please make sure you have an own database and access for it on your PostgreSQL cluster. 
- Please download a script (model.sql) with Database Model here and apply the script to your database (you can use command line with psql or just run it through any IDE, for example DataGrip from JetBrains or pgAdmin from PostgreSQL community). 
- All tasks contain a list of Allowed and Denied sections with listed database options, database types, SQL constructions etc. Please have a look at the section before you start.
- Please take a look at the Logical View of our Database Model.

1. **pizzeria** table (Dictionary Table with available pizzerias)
- field id - primary key
- field name - name of pizzeria
- field rating - average rating of pizzeria (from 0 to 5 points)
2. **person** table (Dictionary Table with persons who loves pizza)
- field id - primary key
- field name - name of person
- field age - age of person
- field gender - gender of person
- field address - address of person
3. **menu** table (Dictionary Table with available menu and price for concrete pizza)
- field id - primary key
- field pizzeria_id - foreign key to pizzeria
- field pizza_name - name of pizza in pizzeria
- field price - price of concrete pizza
4. **person_visits** table (Operational Table with information about visits of pizzeria)
- field id - primary key
- field person_id - foreign key to person
- field pizzeria_id - foreign key to pizzeria
- field visit_date - date (for example 2022-01-01) of person visit 
5. **person_order** table (Operational Table with information about persons orders)
- field id - primary key
- field person_id - foreign key to person
- field menu_id - foreign key to menu
- field order_date - date (for example 2022-01-01) of person order 


## Exercise 00 - Let’s make UNION dance

| Exercise 00: Let’s make UNION dance |                  |
|---------------------------------------|------------------|
| Turn-in directory                     | ex00             |
| Files to turn-in                      | `day01_ex00.sql` |
| **Allowed**                               |                  |
| Language                        | ANSI SQL         |

Please write a SQL statement which returns menu’s identifier and pizza names from `menu` table and person’s identifier and person name from `person` table in one global list (with column names are presented on a sample below) ordered by object_name column.

| object_id | object_name |
| ------ | ------ |
| 2 | Andrey |
| 1 | Anna |
| 8 | cheese pizza |
| ... | ... |


## Exercise 01 - UNION dance with subquery

| Exercise 01: UNION dance with subquery|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day01_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please modify a SQL statement from “exercise 00” by removing the object_id column then change ordering by object_name for part of data from the `person` table and then by `menu` table (like presented on a sample below). Please save duplicates!

| object_name |
| ------ |
| Andrey |
| Anna |
| ... |
| cheese pizza |
| cheese pizza |
| ... |


## Exercise 02 - Duplicates or not duplicates

| Exercise 02: Duplicates or not duplicates|                                                       |
|---------------------------------------|-------------------------------------------------------|
| Turn-in directory                     | ex02                                                  |
| Files to turn-in                      | `day01_ex02.sql`                                      |
| **Allowed**                               |                                                       |
| Language                        | ANSI SQL                                              |
| **Denied**                               |                                                       |
| SQL Syntax Construction                        | `DISTINCT`, `GROUP BY`, `HAVING`, any type of `JOINs` |

Please write a SQL statement which returns unique pizza names from the menu table and orders by pizza_name column in descending mode. Please pay attention to the Denied section.


## Exercise 03 - “Hidden” Insights

| Exercise 03: “Hidden” Insights |                     |
|---------------------------------------|---------------------|
| Turn-in directory                     | ex03                |
| Files to turn-in                      | `day01_ex03.sql`    |
| **Allowed**                               |                     |
| Language                        | ANSI SQL            |
| **Denied**                               |                     |
| SQL Syntax Construction                        | any type of `JOINs` |

Please write a SQL statement which returns common rows for attributes order_date, person_id from `person_order` table from one side and visit_date, person_id from `person_visits` table from other side (please see a sample below). Other words, let’s find persons' identifiers which visited and then ordered some pizza on the same day. Actually, please add ordering by action_date in ascending mode and then by person_id by descending mode.

| action_date | person_id |
| ------ | ------ |
| 2022-01-01 | 6 |
| 2022-01-01 | 2 |
| 2022-01-01 | 1 |
| ... | ... |


## Exercise 04 - Difference? Yep, let's find the difference between multisets.

| Exercise 04: Difference? Yep, let's find the difference between multisets. |                     |
|---------------------------------------|---------------------|
| Turn-in directory                     | ex04                |
| Files to turn-in                      | `day01_ex04.sql`    |
| **Allowed**                               |                     |
| Language                        | ANSI SQL            |
| **Denied**                               |                     |
| SQL Syntax Construction                        | any type of `JOINs` |

Please write a SQL statement which returns a difference (minus) of person_id column with saving duplicates between `person_order` table and `person_visits` table for order_date and visit_date are for 7th of January of 2022


## Exercise 05 - Did you hear about Cartesian Product?

| Exercise 05: Did you hear about Cartesian Product? |                  |
|---------------------------------------|------------------|
| Turn-in directory                     | ex05             |
| Files to turn-in                      | `day01_ex05.sql` |
| **Allowed**                               |                  |
| Language                        | ANSI SQL         |

Please write a SQL statement which returns all possible combinations between `person` and `pizzeria` tables and please set ordering by person identifier and then by pizzeria identifier columns. Please take a look at the result sample below. Please be aware column's names can be different for you.

| person.id | person.name | age | gender | address | pizzeria.id | pizzeria.name | rating |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| 1 | Anna | 16 | female | Moscow | 1 | Pizza Hut | 4.6 |
| 1 | Anna | 16 | female | Moscow | 2 | Dominos | 4.3 |
| ... | ... | ... | ... | ... | ... | ... | ... |


## Exercise 06 - Lets see on “Hidden” Insights

| Exercise 06: Lets see on “Hidden” Insights |                  |
|---------------------------------------|------------------|
| Turn-in directory                     | ex06             |
| Files to turn-in                      | `day01_ex06.sql` |
| **Allowed**                               |                  |
| Language                        | ANSI SQL         |

Let's return our mind back to exercise #03 and change our SQL statement to return person names instead of person identifiers and change ordering by action_date in ascending mode and then by person_name by descending mode. Please take a look at a sample of data below.

| action_date | person_name |
| ------ | ------ |
| 2022-01-01 | Irina |
| 2022-01-01 | Anna |
| 2022-01-01 | Andrey |
| ... | ... |


## Exercise 07 - Just make a JOIN

| Exercise 07: Just make a JOIN |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day04_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please write a SQL statement which returns the date of order from the `person_order` table and corresponding person name (please rename an output calculated column to person_information) which made an order from the `person` table like the next sample below. Add a sort by both columns in ascending mode.

| order_date | person_information |
| ------ | ------ |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Andrey (age:21) |
| 2022-01-01 | Anna (age:16) |
| ... | ... |


## Exercise 08 - Migrate JOIN to NATURAL JOIN

| Exercise 08: Migrate JOIN to NATURAL JOIN |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day04_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| SQL Syntax Construction                        | `NATURAL JOIN`                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Construction                        | other type of  `JOINs`                                                                                              |

Please rewrite a SQL statement from exercise #07 by using NATURAL JOIN construction. 


## Exercise 09 - IN versus EXISTS

| Exercise 09: IN versus EXISTS |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex09                                                                                                                     |
| Files to turn-in                      | `day04_ex10.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please write a 2 SQL statements which returns a list of pizzerias names which have not been visited by persons by using IN for 1st one and EXISTS for the 2nd one.


## Exercise 10 - Global JOIN

| Exercise 10: Global JOIN |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex10                                                                                                                     |
| Files to turn-in                      | `day04_ex10.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please write a SQL statement which returns a list of the person names which made an order for pizza in the corresponding pizzeria. The sample result (with named columns) is provided below and yes ... please make ordering by 3 columns in ascending mode.

| person_name | pizza_name | pizzeria_name | 
| ------ | ------ | ------ |
| Andrey | cheese pizza | Dominos |
| Andrey | mushroom pizza | Dominos |
| Anna | cheese pizza | Pizza Hut |
| ... | ... | ... |

