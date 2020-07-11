//1. count number of cemployees

SELECT COUNT(employee_id) FROM employee;

//2. show employee with specific id

SELECT (employee_name) FROM employee WHERE employee_id = 11;

//3. show customer info and info about the package

SELECT customer_id, customer_name, package_id, package_info 
FROM customer 
JOIN package 
ON customer_id = fk_customer_id;

//4. Join 3 tables to show info about customer, package and the recipent

SELECT customer_id, customer_name, package_id, package_info, recipent_id, recipent_name 
FROM customer 
JOIN package 
ON customer_id = fk_customer_id 
JOIN recipent 
ON recipent_id = fk_recipent_id;

//5. Join 5 tables to show previous info + the time it was deposited and delivered

SELECT customer_id, customer_name, package_id, package_info, recipent_id, recipent_name, deposit_time, delivery_time
FROM customer 
JOIN package 
ON customer_id = fk_customer_id 
JOIN recipent 
ON recipent_id = fk_recipent_id
JOIN deposit
ON package_id = fk_package_id
JOIN delivery 
ON delivery_id = fk_delivery

//6. Join 3 tables to show info about the company, the employees, and the order, processed by individual employee

SELECT ms_id, ms_name, employee_id, employee_name, process_id
FROM mail_service
JOIN employee 
ON ms_id = fk_ms_id 
JOIN processing_system
ON employee_id = fk_employee_id