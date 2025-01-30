/*question 13*/
SELECT order#, isbn, (quantity * paideach) AS "Total Sale"
FROM orderitems;
