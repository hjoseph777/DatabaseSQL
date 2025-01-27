# SQL Query Documentation

## Table Structure
SELECT table_name FROM user_tables;
![Database Schema](/Images/Main.png) 


## Queries

### Query 9:Author Listing
```sql
SELECT fname AS "First Name", lname AS "Last Name"
FROM authors;

```
![Database Schema](/Images/Q9.png) 
**Purpose**: Lists authors with their first and last names.

### Query 10: Customer Listing:
```sql
SELECT lastname, firstname, city, state, zip
FROM customers;

ORDER BY c.customer#;
```
![Database Schema](/Images/Q10.png) 
**Purpose**: Lists customers with their last names, first names, cities, states, and zip codes.

### Query 11: Order Details:
```sql
SELECT order#, order_date, ship_date
FROM orders;


```
![Database Schema](/Images/Q11.png)
**Purpose**: Lists orders that haven't been shipped yet (null shipdate).

### Query 12:Promotion Table:
```sql
SELECT gift, minretail, maxretail
FROM promotion
ORDER BY gift;

```
![Database Schema](/Images/Q12.png)

**Purpose**: Shows how many orders each customer has placed, including customers with no orders.

### Query 13: Total Sale of Each Book:
SELECT order#, isbn, (quantity * paideach) AS "Total Sale"
FROM orderitems;

![Database Schema](/Images/Q13.png)



# JLDB Database Entity Relationship Diagram

![Entity Relationship Diagram](/images/entity.png)

erDiagram
    CUSTOMERS {
        number CustomerID PK
        varchar2 LastName
        varchar2 FirstName
        varchar2 Address
        varchar2 City
        varchar2 State
        varchar2 Zip
        number Referred
        char Region
        varchar2 Email
    }

    ORDERS {
        number OrderID PK
        number CustomerID FK
        date OrderDate
        date ShipDate
        varchar2 ShipStreet
        varchar2 ShipCity
        varchar2 ShipState
        varchar2 ShipZip
        number ShipCost
    }

    BOOKS {
        varchar2 ISBN PK
        varchar2 Title
        date PubDate
        number PubID FK
        number Cost
        number Retail
        number Discount
        varchar2 Category
    }

    PUBLISHER {
        number PubID PK
        varchar2 Name
        varchar2 Contact
        varchar2 Phone
    }

    AUTHOR {
        varchar2 AuthorID PK
        varchar2 Lname
        varchar2 Fname
    }

    ORDERITEMS {
        number OrderID PK, FK
        number ItemID PK
        varchar2 ISBN FK
        number Quantity
        number PaidEach
    }

    BOOKAUTHOR {
        varchar2 ISBN PK, FK
        varchar2 AuthorID PK, FK
    }

    PROMOTION {
        varchar2 Gift
        number MinRetail
        number MaxRetail
    }

    ACCTMANAGER {
        char AMID PK
        varchar2 AMFirst
        varchar2 AMLast
        date AMEDate
        number AMSal
        number AMComm
        char Region
    }

    ACCTBONUS {
        char AMID PK
        number AMSal
        char Region
    }

    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--o{ ORDERITEMS : contains
    BOOKS ||--o{ ORDERITEMS : included_in
    PUBLISHER ||--o{ BOOKS : publishes
    BOOKS ||--o{ BOOKAUTHOR : has
    AUTHOR ||--o{ BOOKAUTHOR : writes
    ACCTMANAGER ||--o| ACCTBONUS : receives
