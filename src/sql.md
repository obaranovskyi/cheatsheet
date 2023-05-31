# Understanding SQL

* __SQL__ stands for Structured Query Language. 
* __Database__ is a container (usually a file or set of files) to store organized data.

Note: Misuse Causes Confusion. People often use the term __database__ to refer to the database software they are running.
This is incorrect and a source of much confusion. Database software is actually called the __Database Management System (DBMS)__.
The database is the container created and manipulated via the DBMS, and exactly what the database is and what form it takes vary from one database to the next.

* __Table__ is a structured list of data of a specific type.
* __Schema__ is an information about database and table layout and properties.
* __Column__ is a single field in a table. All tables are made up of one or more columns.
* __Data Type__ is a type of allowed data. Every table column has an associated datatype that restricts (or allows) specific data  in that column. 
* __Row__ is a record in a table. 

**Note**: Record or Rows? You may hear users refer to database records when referring to rows.
For the most part the two terms are used interchangeably, but row is technically the correct term.

* __Primary key__ is a column (or set of columns) whose values uniquely identify every row in a table. 

---

## Retrieving data

__Keyword__ - is a reserved word that is part of the SQL language. Never name a table or column using a keyword. 

##### Retrieving individual columns:

```sql
SELECT prod_name
FROM products;
```

##### Retrieving multiple columns:

```sql
SELECT prod_id, prod_name, prod_price
FROM products;
```

##### Retrieving all columns:

```sql
SELECT *
FROM products;
```

##### Retrieving distinct rows:

```sql
SELECT DISTINCT vend_id
FROM products;
```

Note: `DISTINCT` can't be partial. It applies to all columns, not just to one it precedes. 

##### Limiting results:

```sql
SELECT TOP 5 prod_name
FROM products;
```

If it is MySQL, PostgreSQL, or SQLite the following statement should be used:

##### Limiting results:

```sql
SELECT prod_name
FROM products
LIMIT 5;
```

To get he next five rows, specify both where to start and the number of rows to retrieve, like this:

```sql
SELECT prod_name
FROM products
LIMIT 5 OFFSET 5;
```

##### One line comment:

```sql
SELECT prod_name -- this is a comment
FROM products;
```

##### Multi line comment:

```sql
/* This is a multi
line comment */
SELECT prod_name
FROM products;
```

---

## Sorting retrieved data

__Clause__ - SQL statements are made up of clauses, some required and some optional.
A clause usually consists of a keyword and supplied data.
An example of this is the `SELECT` statement's `FROM` clause, which you saw in the last lesson. 

##### Sorting:

```sql
SELECT prod_name
FROM products
ORDER BY prod_name;
```

**Caution:** When specifying an `ORDER BY` clause, be sure that it is the last clause in you `SELECT` statement.
If it is not the last clause, an error will be generated.

**Tips:** Sorting by Nonselected columns. It is perfectly legal to sort data by a column that is not retrieved.

##### Sorting by multiple columns:

```sql
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price, prod_name;
```

##### Sorting by column position:

```sql
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY 2, 3;
```

##### Specifying sort direction:

To sort in descending order:

```sql
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price DESC;
```

or:

```sql
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price DESC, prod_name;
```

---

## Filtering data

##### Using the `WHERE` clause:

```sql
SELECT prod_name, prod_price
FROM Products
WHERE prod_price = 3.49;
```

**Caution:** When using both `ORDER BY` and `WHERE` clauses, make sure that `ORDER BY` comes after the `WHERE`.

##### The `WHERE` operators

`=` - Equality  
`<>` - Nonequality  
`!=` - Nonequality  
`<` - Less than  
`<=` - Less than or equal to  
`!<` - Not less than  
`>` - Greater than  
`>=` - Greater than or equal to  
`!>` - Not greater than  
`BETWEEN` - Between two specified values  
`IS NULL` - Is a `NULL` value, (or `IS NOT NULL`)

**Note:** The single quotes are used to delimit a string.

##### Checking for a range of values:

```sql
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;
```

##### Checking for a no value:

```sql
SELECT prod_name, prod_price
FROM Products
WHERE prod_name IS NULL;
```

---

## Advanced data filtering

SQL lets you specify multiple `WHERE` clauses.
These clauses may be used in two ways: as `AND` clauses or as `OR` clauses.

__Operator__  - A special keyword used to join or change clauses within a `WHERE` clause. Also known as logical operators.

##### Using the `AND` operator:

```sql
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE vend_id = 'DLL01' AND prod_price <= 4;
```

##### Using the `OR` operator:

```sql
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';
```

##### Using higher order of evaluation with parentheses:

```sql
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01')
    AND prod_price >= 10;
```

##### Using the `IN` operator:

The `IN` is used to specify the range of conditions, any of which can be matched.

```sql
SELECT prod_id, prod_price
FROM Products
WHERE vend_id IN ('DLL-01', 'BRS01')
ORDER BY prod_name;
```

The biggest advantage of `IN` is that the `IN` operator can contain another `SELECT` statement,
enabling you to build high dynamic `WHERE` clause.

for examples:

```sql
SELECT * 
FROM employees
WHERE job_id IN
    (SELECT job_id FROM jobs WHERE min_salary > 10000);
```

##### Using the `NOT` operator:

```sql
SELECT prod_price
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;
```

---

## Using wildcard filtering

##### Using the `LIKE` operator and `%` sign:

`%` - means match any number of occurrences of any character.

```sql
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE 'Fish%';
```

**Note:** Case Sensitivity. Depending on our DBMS and how it is configured, searches may be case sensitive, in which case 'fish%' would not match Fish.

`%` sign can reside in any place of the pattern, for instance: `%fish%` or in the middle of pattern `F%y`.
Important to understand that `%` sign represents zero, one or more characters. 
Sometimes database might add spaces to the end and in that case if we have added `Fish` to database it will store it as `Fish` plus 46 space characters.
If we search for such a content we would need to add `%` sign to the end like this `LIKE 'Fish%'`.

##### The underscore `_` wildcard:

The `_` is used just like `%`, but instead of matching multiple characters, the underscore matches just a single character.

```sql
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '__ inch teddy bear';
```

##### The brackets `[]` wildcard:

The brackets `[]` wildcard is used to specify a set of characters, any one of which must match a character in the specified position (the location of wildcard).
**Note:** Sets are not commonly used.

To find all contacts whose names begin with the letter J or the letter M, you can do the following:

```sql
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%'
ORDER BY cust_contact;
```

This wildcard can be negated by prefixing the characters with `^` (the caret character).

```sql
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[^JM]%'
ORDER BY cust_contact;
```

---

## Creating calculated fields

##### Concatenating fields:

```sql
SELECT vend_name + '(' + vend_country + ')'
FROM Vendors
ORDER BY vend_name;
```

or

```sql
SELECT vend_name || '(' || vend_country || ')'
FROM Vendors
ORDER BY vend_name;
```

**Note:** SQL Server uses `+` for concatenation. DB2, Oracle, PostgreSQL, and SQLite support `||`. 
And here's what you'll need to do if using MySQL or MariaDB.

```sql
SELECT Concat(vend_name, '(', vend_country, ')')
FROM Vendors
ORDER BY vend_name;
```

##### Removing extra spaces:

```sql
SELECT RTRIM(vend_name) || '(' || RTRIM(vend_country) || ')'
FROM Vendors
ORDER BY vend_name;
```

**Note:** `RTRIM()`, and `LTRIM()` is supported by most DBs.

##### Using Aliases:

When we concatenate columns or modify single column it doesn't have a name and we can't refer to it.
To solve this problem, SQL supports column aliases. An alias is just that, an alternate name for a field or value.

```sql
SELECT RTRIM(vend_name) || '(' || RTRIM(vend_country) || ')' 
    AS vend_title
FROM Vendors
ORDER BY vend_name;
```

And here is the equivalent for use with MySQL and MariaDB.

```sql
SELECT Concat(RTrim(vend_name), ' (',
    RTrim(vend_country), ')') as vent_title
FROM Vendors
ORDER BY vend_name;
```

##### Performing Mathematical Calculations:

```sql
SELECT prod_id, 
    quantity,
    item_price,
    quantity * item_price AS expanded_price
FROM OrderItems
WHERE order_num = 2008;
```

##### How to test calculations:

`SELECT` provides a great way to test and experiment with functions and calculations.
Although `SELECT` is usually used to retrieve data from a table, the `FROM` clause may be omitted to simply access and work with expressions.
For example, `SELECT 2 * 3;` would return _6_, `SELECT Trim('   abc   ');` would return _abc_ and `SELECT Curdate()` uses the `Currdate()` function
to return the current date and time (on MySQL and MariaDB for example, in PostgreSQL is `now()` function).

---

## Using data manipulation functions

**Note:** Functions tend to be very DBMS specific.

##### DBMS Function Differences

Extract part of a string - DB2, Oracle, PostgreSQL, and SQLite use `SUBSTR()`, MariaDB, MySQL, and SQL Server use `SUBSTRING()`.
Oracle uses multiple functions, one for each conversion type. DB2, PostgreSQL, and SQL Server use.  

Datatype conversion - PostgreSQL use `CAST()`. MariaDB, MySQL, and SQL Server use `CONVERT`.  

Get current date - DB2 and PostgreSQL use `CURRENT_DATE`. MariaDB and MySQL use `CURRDATE()`.
Oracle uses `SYSDATE`. SQL Server uses `GETDATE()`. SQLite uses `DATE()`.  

##### Using Functions:

Most SQL implementations support the following types of functions:

- Text functions
- Numeric functions
- Date and time functions
- Formatting functions
- System functions - return information specific to the DBMS being used (for example, returning user login information) 

##### Text Manipulation functions:

```sql
SELECT vend_name, UPPER(vend_name) AS vend_name_upper
FROM Vendors 
ORDER BY vend_name;
```

**Note:** As should be clear by now, SQL functions are not case sensitive.

###### Commonly used text functions:

* `LEFT()` (or use substring function) - Returns characters from left of string  
* `LENGTH()` (also `DATALENGTH()` or `LEN()`) - Returns the length of sting  
* `LOWER()` - Converts string to lowercase  
* `LTRIM()` - Trims white space from left of string  
* `RIGHT()` (or use substring function) - Returns characters form right of string  
* `RTRIM()` - Trims white space form right of string  
* `SUBSTR()`, `SUBSTRING()` - Extracts part of a string  
* `SOUNDEX()` - Returns a string's `SOUNDEX` value  
* `UPPER()` - converts string to uppercase  

#### Date and Time manipulation functions

To retrieve a list of all orders made in 2020 in SQL Server do the following:

```sql
SELECT order_num
FROM Orders
WHERE DATEPART(yy, order_date) = 2020;
```

Here is an example which can be applied to the PostgreSQL:
To retrieve a list of all orders made in 2020 in SQL Server do the following:

```sql
SELECT order_num
FROM Orders
WHERE DATE_PART('year', order_date) = 2020;
```

And here is an example for ORACLE database:

```sql
SELECT order_num
FROM Orders
WHERE EXTRACT(year FROM order_date) = 2020;
```

**Note:** PostgreSQL also supports the `Extract()` function, so this technique will work (in addition to using `Date_Part()` as seen previously)

Another way to accomplish this same task is to use the `BETWEEN` operator:

```sql
SELECT order_num
FROM Orders
WHERE order_date BETWEEN to_date('2020-01-01', 'yyyy-mm-dd')
    AND to_date('2020-12-31', 'yyyy-mm-dd');
```

Here ORACLE's `to_date()` function is used to convert two strings to dates. It also works in the PostgreSQL.

DB2, MySQL, and MariaDB have all sorts of date manipulation functions, but not `DATEPART()`.
DB2, MariaDB and MySQL users can use a function named `YEAR()` to extract the year from a date:

```sql
SELECT order_num
FROM Orders
WHERE YEAR(order_date) = 2020;
```

SQLite is a little trickier:

```sql
SELECT order_name
FROM Orders
WHERE strftime('%Y', order_date) = '2020';
```

##### Numeric manipulation functions:

Commonly used functions:

* `ABS()` - Returns a number's absolute value  
* `COS()` - Returns the trigonometric cosine of a specified angle  
* `EXP()` - Returns the exponential value of a specific number  
* `PI()` - Returns the value of PI  
* `SIN()` - Returns the trigonometric sine of a specified angle  
* `SQRT()` - Returns the square root of a specified number  
* `TAN()` - Returns the trigonometric tangent of a specified angle  

---

## Summarizing data

##### Using aggregate functions:

Aggregate functions are functions that operate on a set of rows to calculate and return a single value.

* `AVG()` - Returns a column average value  
* `COUNT()` - Returns the number or rows in a column  
* `MAX()` - Returns a column's highest value  
* `MIN()` - Returns a column's lowest value  
* `SUM()` - Returns the sum of a column's values  

##### The `AVG()` function:

This is average price for all products:

```sql
SELECT AVG(prod_price) AS avg_price
FROM Products;
```

This is average price for one product:

```sql
SELECT AVG(prod_price) AS avg_price
FROM Products;
WHERE vend_id = 'DLL01';
```

**Note:** Column rows containing `NULL` values are ignored by the `AVG()` function.

##### The `COUNT()` function:

`COUNT()` can be used two ways:

- Use `COUNT(*)` to count the number of rows in a table, whether columns contain values or `NULL` values.  
- Use `COUNT(column)` to count the number of rows that have values in a specific column, ignoring `NULL` values.  

```sql
SELECT COUNT(*) AS num_cust
FROM Customers;
```

or the customers with an email:

```sql
SELECT COUNT(cust_email) AS num_cust
FROM Customers;
```

**Note:** Columns rows with `NULL` values are ignored by the `COUNT()` function if a column name is specified, but not if the asterisk `(*)` is used.

##### The `MAX()` function:

```sql
SELECT MAX(prod_price) AS max_price
FROM Products;
```

**Note:** Column rows with `NULL` values are ignored by the `MAX()` function.

##### The `MIN()` function:

```sql
SELECT MIN(prod_price) AS min_price
FROM Products;
```

**Note:** Column rows with `NULL` values in then are ignored by the `MIN()` function.

##### The `SUM()` function:

```sql
SELECT SUM(quality) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;
```

or in this way:

```sql
SELECT SUM(item_price * quality) AS total_price
FROM OrderItems
WHERE order_num = 20005;
```

**Note:** Column rows with `NULL` values in then are ignored by the `SUM()` function.

##### Aggregates on distinct values:

The five aggregate functions can all be used in tow ways:

- To perform calculations on all rows, specify the `ALL` argument or specify no argument at all (because `ALL` is the default behavior).  
- To include only unique values, specify the `DISTINCT` arguments.  

The following example uses the `AVG()` function to return the average product price offered by a specific vendor.
It is the same `SELECT` statement used above, but here the `DISTINCT` argument is used so that the average only takes into account unique prices:

```sql
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';
```

##### Combining aggregate functions:

```sql
SELECT COUNT(*) AS num_items,
    MIN(prod_price) AS price_min,
    MAX(prod_price) AS price_max,
    AVG(prod_price) AS price_avg,
FROM Products;
```

---

## Grouping data

##### Creating groups:

```sql
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;
```

The `GROUP BY` clause instructs the DBMS to sort the data and group it by `vend_id`.
This causes `num_prods` to be calculated once per `vend_id` rather than once for the entire table.

##### Before you use `GROUP BY`, here are some important rules about its use that you need to know:

* `GROUP BY` clauses can contain as many columns as you want. This enables you to nest groups, providing you with more granular control over how data is grouped.
* If you have nested groups in your `GROUP BY` clause, data is summarized at the last specified group.
  In other words, all the columns specified are evaluated together when grouping is established (so you won't get data back for each individual columns level).
* Every column listed in `GROUP BY` must be a retrieved column or a valid expression (but not an aggregate function). If an expression is used in the `SELECT`,
  that same expression must be specified in `GROUP BY`. Aliases cannot be used.
* Most SQL implementations do not allow `GROUP BY` columns with variable-length datatypes (such as text or memo fields).
* Aside from the aggregate calculation statements, every column in your `SELECT` statement must be present in the `GROUP BY` clause.
* If the grouping column contains a row with a `NULL` will be returned as a group. If there are multiple rows with `NULL` values, they'll all be grouped together.
* The `GROUP BY` clause must come after any `WHERE` clause and before any `ORDER BY` clause.

##### Filtering groups:

The difference between the `WHERE` and `HAVING` is that `WHERE` filters rows and `HAVING` filters groups. 
**Note** All techniques that can be applied to `WHERE` can be applied to `HAVING`.

```sql
SELECT cust_id, COUNT(*) AS orders
FROM Orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;
```

or with the `WHERE`:

```sql
SELECT vend_id, COUNT(*) AS orders
FROM Orders
GROUP BY vend_id
HAVING COUNT(*) >= 2;
```

---

## Working with subqueries

##### Understanding Subqueries:

Suppose you wanted a list of all the customers who ordered item `RGAN01`

```sql
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
                    FROM OrderItems
                    WHERE prod_id = 'RGAN01');
```

Subqueries are always processed starting with the innermost `SELECT` statement and working outward.
When the preceding `SELECT` statement is processed, the DBMS actually performs two operations.

But this information only contains `cust_id` and we need `cust_name` and `cust_contact` which are living in Customers `database`.

```sql
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
                  FROM Orders
                  WHERE order_num IN (SELECT order_num
                                      FROM OrderItems
                                      WHERE prod_id = 'RGAN01'));
```

**Caution**: Single Column Only.
Subquery `SELECT` statements can only retrieve a single column. Attempting to retrieve multiple columns will return an error.

**Caution**: Subqueries and Performance.
The code shown here works, and it achieves the desired result. However, using subqueries is not always the most efficient way to perform this type of data retrieval.

##### Using Subqueries as Calculated Fields:

Suppose you wanted to display the total number of orders placed by every customer in your `Customers` table.

```sql
SELECT cust_name,
       cust_state
       (SELECT COUNT(*)
        FROM Orders
        WHERE Orders.cust_id = Customers.cust_id)
AS orders
FROM Customers
ORDER BY cust_name;
```

**Note**: A good rule is that if you are ever working with more than one table in a `SELECT` statement,
then use fully qualified column names to  avoid any and all ambiguity.

---

## Joining tables

`JOIN` combines data from two tables.

`JOIN` typically combines rows with equal values for the specified columns. **Usually**, one table contains a **primary key**,
which is a column or columns that uniquely identify rows in the table (the cat_id column in the cat table).
The other table has a column or columns that **refer to the primary key columns** in the first table (the cat_id column in
the toy table). Such columns are **foreign keys**. The JOIN condition is the equality between the primary key columns in
one table and columns referring to them in the other table.

##### Join

`JOIN` returns all rows that match the `ON` condition.
`JOIN` is also called `INNER JOIN`

```sql
SELECT *
FROM toy
JOIN cat
    ON toy.cat_id = cat.cat_id;
```


There is also another, older syntax, but it **isn't recommended.**

List joined tables in the `FROM` clause, and place the conditions in the `WHERE` clause.

```sql
SELECT *
FROM toy, cat
WHERE toy.cat_id = cat.cat_id;
```

##### Join conditions

The `JOIN` condition doesn't have to be an equality - it can be any condition you want.

`JOIN` doesn't interpret the `JOIN` condition, it only checks if the rows satisfy the given condition.



To refer to a column in the `JOIN` query, you have to use the full column name: first the table name, then a dot (`.`) and the column name:

```sql
ON cat.cat_id = toy.cat_id;
```

You can omit the table name and use just the column name if the name of the column is unique within all columns in the joined tables.

##### Natural join

If the table have columns with the same name, you can use `NATURAL JOIN` instead of `JOIN`.

```sql
SELECT *
FROM toy
NATURAL JOIN cat;
```

The common column appears only once in the result table.

**Note:** `NATURAL JOIN` is rarely used in real life.



##### LEFT JOIN

`LEFT JOIN` returns all rows from the **left table** with matching rows from the right table. Rows without a match are filled with `NULL`s. `LEFT JOIN` is also called `LEFT OUTER JOIN`.

```sql
SELECT *
FROM toy
LEFT JOIN cat
    ON toy.cat_id = cat.cat_id;
```



##### RIGHT JOIN

`RIGHT JOIN` returns all rows from the **right table** with matching rows from the left table. Rows without a match are filled with `NULL`s. `RIGHT JOIN` is also called `RIGHT OUTER JOIN`.

```sql
SELECT *
FROM toy
RIGHT JOIN cat
    ON toy.cat_id = cat.cat_id;
```


##### FULL JOIN

`FULL JOIN` returns all rows from the **left table** and all rows from the **right table**. It fills the non-matching rows with `NULL`s. `FULL JOIN` is also called `FULL OUTER JOIN`.

```sql
SELECT *
FROM toy
FULL JOIN cat 
    ON toy.cat_id = cat.cat_id;
```


##### CROSS JOIN

`CROSS JOIN` returns **all possible combinations** of rows from the left and right tables.

```sql
SELECT *
FROM toy
CROSS JOIN cat;

-- other syntax
SELECT * 
FROM toy, cat;
```

##### Column and table aliases

Aliases give a temporary name to a **table** or a **column** in a table.

A **column alias** renames a column in the result. A **table alias** renames a table within the query. If you define a table alias, you must use it instead of the table name everywhere in the query. The `AS` keyword is optional in defining aliases.

```sql
SELECT
    o.name AS owner_name,
    c.cat_name
FROM cat AS c
JOIN owner AS o
    ON c.owner_id = o.id;
```

##### Self JOIN

You can join a table to itself, for example, to show a parent-child relationship.

Each occurrence of the table must be given a **different alias**. Each column reference must be preceded with an **appropriate table alias**.

```sql
SELECT 
    child.cat_name AS child_name,
    mom.cat_name AS mom_name
FROM cat AS child
JOIN cat AS mom
    ON cat.cat_id = mom.cat_id;
```

##### NON-EQUI SELF JOIN

you can use a **non-equality** in the `ON` condition, for example, to show **all different pairs** of rows.

```sql
SELECT 
    a.toy_name AS toy_a,
    b.toy_name AS toy_b
FROM toy a
JOIN toy b
    ON a.cat_id < b.cat_id;
```

##### Multiple JOINs

You can join more than two tables together. First, two tables are joined, then the third tale is joined to the result of the previous joining.

##### Join with multiple conditions

you can use multiple `JOIN` conditions using the `ON` keyword once and the `AND` keywords as many times as you need.

```sql
SELECT 
    cat_name,
    o.name AS owner_name,
    c.age AS cat_age,
    o.age AS owner_age
FROM cat c
JOIN owner o
    ON c.owner_id = o.id
    AND c.age < o.age;
```

[SQL JOIN Cheat Sheet | LearnSQL.com](https://learnsql.com/blog/sql-join-cheat-sheet/)
