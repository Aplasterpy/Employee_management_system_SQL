CREATE DATABASE Employee_management;
SHOW DATABASES;
USE Employee_management;
/*-----------------------Database Details---------------------------------*/

CREATE TABLE tbl_Employee(emp_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
								fname VARCHAR(255) NOT NULL,
								lname VARCHAR(255) NOT NULL,
								gender ENUM('Male', 'Female', 'Others'),
								age INT NOT NULL,
								contact_address INT(11),
								emp_email VARCHAR (255),
								emp_pass VARCHAR(255)
								);
								
SELECT * FROM tbl_Employee;								
/*-------------------------Table 1 (tbl_Employee)----------------------*/		

CREATE TABLE tbl_Users (admin_ID INT PRIMARY KEY AUTO_INCREMENT,
								fname VARCHAR(255) NOT NULL,
								lname VARCHAR(255) NOT NULL,
								gender ENUM('Male', 'Female', 'Others'),
								age INT NOT NULL,
								contact_address INT(11),
								admin_email VARCHAR (255),
								admin_pass VARCHAR(255)
								);	
SELECT * FROM tbl_Users;	

/*-------------------------Table 2 (tbl_JobDepartment)----------------------*/	

CREATE TABLE tbl_JobDepartment(job_ID INT PRIMARY KEY AUTO_INCREMENT,
										 job_dept VARCHAR(30) NOT NULL,
										 job_name VARCHAR(30) NOT NULL,
										 job_description VARCHAR(30) NOT NULL,
										 salary_range VARCHAR(30) NOT null
										 );

SELECT * FROM tbl_JobDepartment;	

/*-------------------------Table 3 (tbl_Salary_or_Bonus)----------------------*/		

CREATE TABLE tbl_Salary_or_Bonus(salary_ID  INT(11) PRIMARY KEY,
											job_ID INT(11),
											amount INT(11),
											annual DATE,
											bonus DATE,
											FOREIGN KEY (job_ID) REFERENCES tbl_JobDepartment(job_ID)
											);	
SELECT * FROM tbl_Salary_or_Bonus;
/*-------------------------Table 4 (tbl_Qualification)----------------------*/

CREATE Table tbl_Qualification(qual_ID  INT(11) PRIMARY KEY,
								emp_ID INT(11),
								position VARCHAR(30) NOT NULL,
								requirements VARCHAR(30), 
								date_in DATE,
								FOREIGN KEY (emp_ID) REFERENCES tbl_Employee(emp_ID));
SELECT * FROM tbl_Qualification;	




/*-------------------------Table 5 (tbl_Payroll)----------------------*/

CREATE Table tbl_Payroll(payroll_ID  INT(11) PRIMARY KEY,
							emp_ID INT(11) NOT NULL,
							job_ID  INT(11) NOT NULL,
							salary_ID  INT(11) NOT NULL,
							leave_ID  INT(11) NOT NULL,
							payroll_date DATE,
							total_amount INT(11),
							FOREIGN KEY (emp_ID) REFERENCES tbl_Employee(emp_ID),
							FOREIGN KEY (job_ID) REFERENCES tbl_JobDepartment(job_ID),
							FOREIGN KEY (salary_ID) REFERENCES tbl_Salary_or_Bonus(salary_ID),
							FOREIGN KEY (leave_ID) REFERENCES leaves_details(leave_ID)
							);
SELECT * FROM tbl_Payroll;



/*-------------------------Table 6 (leaves_details)----------------------*/

CREATE TABLE leaves_details(leave_id INT PRIMARY KEY,
							leave_employee_id INT NOT NULL,
							leave_type ENUM('CL', 'SL', 'PAID'),
							leave_description VARCHAR(255)
							);
SELECT * FROM leaves_details;

/*-------------------------Table 6 (leaves_details)----------------------*/



