CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    dept VARCHAR2(30),
    income NUMBER(10,2),
    marks NUMBER(5,2) CHECK (marks BETWEEN 0 AND 100),
    email VARCHAR2(100) UNIQUE,
    phone VARCHAR2(15)
);




CREATE TABLE scholarships (
    scholarship_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    category VARCHAR2(30),
    min_marks NUMBER(5,2),
    max_income NUMBER(10,2),
    fund_amount NUMBER(10,2)
);





CREATE TABLE applications (
    app_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    scholarship_id NUMBER,
    apply_date DATE,
    status VARCHAR2(15)
      CHECK (status IN ('submitted','verified','approved','rejected')),
    remarks VARCHAR2(200),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (scholarship_id) REFERENCES scholarships(scholarship_id),
    UNIQUE(student_id, scholarship_id)
);



CREATE TABLE documents (
    doc_id NUMBER PRIMARY KEY,
    app_id NUMBER,
    type VARCHAR2(30),
    file_path VARCHAR2(200),
    verified_status VARCHAR2(15),
    FOREIGN KEY (app_id) REFERENCES applications(app_id)
);







CREATE TABLE disbursements (
    pay_id NUMBER PRIMARY KEY,
    app_id NUMBER,
    amount NUMBER(10,2),
    installment_no NUMBER,
    pay_date DATE,
    status VARCHAR2(15),
    FOREIGN KEY (app_id) REFERENCES applications(app_id)
);





CREATE TABLE renewals (
    renewal_id NUMBER PRIMARY KEY,
    app_id NUMBER,
    year NUMBER(4),
    marks NUMBER(5,2) CHECK (marks BETWEEN 0 AND 100),
    status VARCHAR2(15),
    FOREIGN KEY (app_id) REFERENCES applications(app_id)
);





CREATE TABLE officers (
    officer_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    role VARCHAR2(30),
    email VARCHAR2(100) UNIQUE
);







CREATE TABLE verification_logs (
    log_id NUMBER PRIMARY KEY,
    doc_id NUMBER,
    officer_id NUMBER,
    date_verified DATE,
    remarks VARCHAR2(200),
    FOREIGN KEY (doc_id) REFERENCES documents(doc_id),
    FOREIGN KEY (officer_id) REFERENCES officers(officer_id)
);














INSERT ALL
INTO students VALUES (1,'Ravi','CSE',30000,85,'ravi@mail.com','9000000001')
INTO students VALUES (2,'Priya','ECE',25000,90,'priya@mail.com','9000000002')
INTO students VALUES (3,'Arjun','MECH',40000,70,'arjun@mail.com','9000000003')
INTO students VALUES (4,'Meena','CIVIL',20000,88,'meena@mail.com','9000000004')
INTO students VALUES (5,'Kiran','CSE',35000,76,'kiran@mail.com','9000000005')
INTO students VALUES (6,'Divya','ECE',28000,92,'divya@mail.com','9000000006')
INTO students VALUES (7,'Rahul','MECH',42000,65,'rahul@mail.com','9000000007')
INTO students VALUES (8,'Sneha','CIVIL',22000,81,'sneha@mail.com','9000000008')
INTO students VALUES (9,'Vijay','CSE',31000,79,'vijay@mail.com','9000000009')
INTO students VALUES (10,'Anu','ECE',26000,87,'anu@mail.com','9000000010')
INTO students VALUES (11,'Sanjay','MECH',39000,72,'sanjay@mail.com','9000000011')
INTO students VALUES (12,'Latha','CIVIL',21000,83,'latha@mail.com','9000000012')
INTO students VALUES (13,'Manoj','CSE',33000,91,'manoj@mail.com','9000000013')
INTO students VALUES (14,'Pooja','ECE',27000,86,'pooja@mail.com','9000000014')
INTO students VALUES (15,'Deepak','MECH',41000,69,'deepak@mail.com','9000000015')
INTO students VALUES (16,'Kavya','CIVIL',23000,84,'kavya@mail.com','9000000016')
INTO students VALUES (17,'Hari','CSE',36000,77,'hari@mail.com','9000000017')
INTO students VALUES (18,'Nisha','ECE',24000,89,'nisha@mail.com','9000000018')
INTO students VALUES (19,'Ramesh','MECH',43000,68,'ramesh@mail.com','9000000019')
INTO students VALUES (20,'Asha','CIVIL',20500,82,'asha@mail.com','9000000020')
SELECT * FROM students;


INSERT ALL
INTO scholarships VALUES (1,'Merit Grant','Merit',80,80000,50000)
INTO scholarships VALUES (2,'Income Aid','Income',60,40000,30000)
INTO scholarships VALUES (3,'Sports Quota','Sports',50,90000,25000)
INTO scholarships VALUES (4,'Topper Award','Merit',85,100000,60000)
INTO scholarships VALUES (5,'Rural Support','Income',55,35000,20000)
INTO scholarships VALUES (6,'Athlete Fund','Sports',45,95000,22000)
INTO scholarships VALUES (7,'Gold Merit','Merit',90,120000,70000)
INTO scholarships VALUES (8,'Fee Waiver','Income',65,30000,28000)
INTO scholarships VALUES (9,'State Sports','Sports',50,85000,26000)
INTO scholarships VALUES (10,'Excellence','Merit',88,110000,65000)
SELECT * FROM dual;
SELECT * FROM scholarships;





INSERT ALL
INTO applications VALUES (1,1,1,DATE '2024-01-10','approved','ok')
INTO applications VALUES (2,2,2,DATE '2024-02-11','submitted','pending')
INTO applications VALUES (3,3,3,DATE '2024-03-12','verified','checked')
INTO applications VALUES (4,4,1,DATE '2024-04-13','rejected','income high')
INTO applications VALUES (5,5,4,DATE '2024-05-14','approved','ok')
INTO applications VALUES (6,6,5,DATE '2024-06-15','approved','ok')
INTO applications VALUES (7,7,2,DATE '2024-07-16','rejected','marks low')
INTO applications VALUES (8,8,3,DATE '2024-08-17','approved','ok')
INTO applications VALUES (9,9,6,DATE '2024-09-18','verified','checked')
INTO applications VALUES (10,10,7,DATE '2024-10-19','approved','ok')
INTO applications VALUES (11,11,1,DATE '2024-01-05','submitted','pending')
INTO applications VALUES (12,12,2,DATE '2024-02-06','approved','ok')
INTO applications VALUES (13,13,3,DATE '2024-03-07','approved','ok')
INTO applications VALUES (14,14,4,DATE '2024-04-08','verified','checked')
INTO applications VALUES (15,15,5,DATE '2024-05-09','rejected','income')
INTO applications VALUES (16,16,6,DATE '2024-06-10','approved','ok')
INTO applications VALUES (17,17,7,DATE '2024-07-11','approved','ok')
INTO applications VALUES (18,18,8,DATE '2024-08-12','submitted','pending')
INTO applications VALUES (19,19,9,DATE '2024-09-13','verified','checked')
INTO applications VALUES (20,20,10,DATE '2024-10-14','approved','ok')
INTO applications VALUES (21,1,2,DATE '2024-03-01','approved','ok')
INTO applications VALUES (22,2,3,DATE '2024-03-02','approved','ok')
INTO applications VALUES (23,3,4,DATE '2024-03-03','approved','ok')
INTO applications VALUES (24,4,5,DATE '2024-03-04','approved','ok')
INTO applications VALUES (25,5,6,DATE '2024-03-05','approved','ok')
INTO applications VALUES (26,6,7,DATE '2024-03-06','approved','ok')
INTO applications VALUES (27,7,8,DATE '2024-03-07','approved','ok')
INTO applications VALUES (28,8,9,DATE '2024-03-08','approved','ok')
INTO applications VALUES (29,9,10,DATE '2024-03-09','approved','ok')
INTO applications VALUES (30,10,1,DATE '2024-03-10','approved','ok')
INTO applications VALUES (31,11,2,DATE '2024-03-11','approved','ok')
INTO applications VALUES (32,12,3,DATE '2024-03-12','approved','ok')
INTO applications VALUES (33,13,4,DATE '2024-03-13','approved','ok')
INTO applications VALUES (34,14,5,DATE '2024-03-14','approved','ok')
INTO applications VALUES (35,15,6,DATE '2024-03-15','approved','ok')
INTO applications VALUES (36,16,7,DATE '2024-03-16','approved','ok')
INTO applications VALUES (37,17,8,DATE '2024-03-17','approved','ok')
INTO applications VALUES (38,18,9,DATE '2024-03-18','approved','ok')
INTO applications VALUES (39,19,10,DATE '2024-03-19','approved','ok')
INTO applications VALUES (40,20,1,DATE '2024-03-20','approved','ok')
SELECT * FROM dual;
SELECT * FROM applications;


INSERT ALL
INTO documents VALUES (1,1,'Income Cert','/docs/d1.pdf','verified')
INTO documents VALUES (2,2,'Income Cert','/docs/d2.pdf','pending')
INTO documents VALUES (3,3,'Community Cert','/docs/d3.pdf','verified')
INTO documents VALUES (4,4,'Income Cert','/docs/d4.pdf','rejected')
INTO documents VALUES (5,5,'Marksheet','/docs/d5.pdf','verified')
INTO documents VALUES (6,6,'Income Cert','/docs/d6.pdf','verified')
INTO documents VALUES (7,7,'Community Cert','/docs/d7.pdf','verified')
INTO documents VALUES (8,8,'Marksheet','/docs/d8.pdf','verified')
INTO documents VALUES (9,9,'Income Cert','/docs/d9.pdf','pending')
INTO documents VALUES (10,10,'Marksheet','/docs/d10.pdf','verified')
INTO documents VALUES (11,11,'Income Cert','/docs/d11.pdf','pending')
INTO documents VALUES (12,12,'Community Cert','/docs/d12.pdf','verified')
INTO documents VALUES (13,13,'Marksheet','/docs/d13.pdf','verified')
INTO documents VALUES (14,14,'Income Cert','/docs/d14.pdf','verified')
INTO documents VALUES (15,15,'Income Cert','/docs/d15.pdf','rejected')
INTO documents VALUES (16,16,'Marksheet','/docs/d16.pdf','verified')
INTO documents VALUES (17,17,'Community Cert','/docs/d17.pdf','verified')
INTO documents VALUES (18,18,'Income Cert','/docs/d18.pdf','pending')
INTO documents VALUES (19,19,'Marksheet','/docs/d19.pdf','verified')
INTO documents VALUES (20,20,'Income Cert','/docs/d20.pdf','verified')
INTO documents VALUES (21,21,'Income Cert','/docs/d21.pdf','verified')
INTO documents VALUES (22,22,'Income Cert','/docs/d22.pdf','verified')
INTO documents VALUES (23,23,'Marksheet','/docs/d23.pdf','verified')
INTO documents VALUES (24,24,'Income Cert','/docs/d24.pdf','verified')
INTO documents VALUES (25,25,'Community Cert','/docs/d25.pdf','verified')
INTO documents VALUES (26,26,'Income Cert','/docs/d26.pdf','verified')
INTO documents VALUES (27,27,'Marksheet','/docs/d27.pdf','verified')
INTO documents VALUES (28,28,'Income Cert','/docs/d28.pdf','verified')
INTO documents VALUES (29,29,'Community Cert','/docs/d29.pdf','verified')
INTO documents VALUES (30,30,'Income Cert','/docs/d30.pdf','verified')
INTO documents VALUES (31,31,'Marksheet','/docs/d31.pdf','verified')
INTO documents VALUES (32,32,'Income Cert','/docs/d32.pdf','verified')
INTO documents VALUES (33,33,'Community Cert','/docs/d33.pdf','verified')
INTO documents VALUES (34,34,'Income Cert','/docs/d34.pdf','verified')
INTO documents VALUES (35,35,'Marksheet','/docs/d35.pdf','verified')
INTO documents VALUES (36,36,'Income Cert','/docs/d36.pdf','verified')
INTO documents VALUES (37,37,'Community Cert','/docs/d37.pdf','verified')
INTO documents VALUES (38,38,'Income Cert','/docs/d38.pdf','verified')
INTO documents VALUES (39,39,'Marksheet','/docs/d39.pdf','verified')
INTO documents VALUES (40,40,'Income Cert','/docs/d40.pdf','verified')
SELECT * FROM dual;
SELECT * FROM documents;


INSERT ALL
INTO disbursements VALUES (1,1,25000,1,DATE '2024-02-01','paid')
INTO disbursements VALUES (2,2,15000,1,DATE '2024-02-05','paid')
INTO disbursements VALUES (3,3,12000,1,DATE '2024-02-10','paid')
INTO disbursements VALUES (4,4,0,1,DATE '2024-02-15','stopped')
INTO disbursements VALUES (5,5,30000,1,DATE '2024-03-01','paid')
INTO disbursements VALUES (6,6,20000,1,DATE '2024-03-05','paid')
INTO disbursements VALUES (7,7,0,1,DATE '2024-03-10','stopped')
INTO disbursements VALUES (8,8,18000,1,DATE '2024-03-15','paid')
INTO disbursements VALUES (9,9,22000,1,DATE '2024-04-01','paid')
INTO disbursements VALUES (10,10,26000,1,DATE '2024-04-05','paid')
INTO disbursements VALUES (11,11,10000,1,DATE '2024-04-10','paid')
INTO disbursements VALUES (12,12,14000,1,DATE '2024-04-15','paid')
INTO disbursements VALUES (13,13,17000,1,DATE '2024-05-01','paid')
INTO disbursements VALUES (14,14,19000,1,DATE '2024-05-05','paid')
INTO disbursements VALUES (15,15,0,1,DATE '2024-05-10','stopped')
INTO disbursements VALUES (16,16,21000,1,DATE '2024-05-15','paid')
INTO disbursements VALUES (17,17,24000,1,DATE '2024-06-01','paid')
INTO disbursements VALUES (18,18,13000,1,DATE '2024-06-05','paid')
INTO disbursements VALUES (19,19,16000,1,DATE '2024-06-10','paid')
INTO disbursements VALUES (20,20,28000,1,DATE '2024-06-15','paid')
INTO disbursements VALUES (21,21,20000,1,DATE '2024-07-01','paid')
INTO disbursements VALUES (22,22,21000,1,DATE '2024-07-05','paid')
INTO disbursements VALUES (23,23,22000,1,DATE '2024-07-10','paid')
INTO disbursements VALUES (24,24,23000,1,DATE '2024-07-15','paid')
INTO disbursements VALUES (25,25,24000,1,DATE '2024-08-01','paid')
INTO disbursements VALUES (26,26,25000,1,DATE '2024-08-05','paid')
INTO disbursements VALUES (27,27,26000,1,DATE '2024-08-10','paid')
INTO disbursements VALUES (28,28,27000,1,DATE '2024-08-15','paid')
INTO disbursements VALUES (29,29,28000,1,DATE '2024-09-01','paid')
INTO disbursements VALUES (30,30,29000,1,DATE '2024-09-05','paid')
INTO disbursements VALUES (31,31,30000,1,DATE '2024-09-10','paid')
INTO disbursements VALUES (32,32,15000,1,DATE '2024-09-15','paid')
INTO disbursements VALUES (33,33,16000,1,DATE '2024-10-01','paid')
INTO disbursements VALUES (34,34,17000,1,DATE '2024-10-05','paid')
INTO disbursements VALUES (35,35,18000,1,DATE '2024-10-10','paid')
INTO disbursements VALUES (36,36,19000,1,DATE '2024-10-15','paid')
INTO disbursements VALUES (37,37,20000,1,DATE '2024-11-01','paid')
INTO disbursements VALUES (38,38,21000,1,DATE '2024-11-05','paid')
INTO disbursements VALUES (39,39,22000,1,DATE '2024-11-10','paid')
INTO disbursements VALUES (40,40,23000,1,DATE '2024-11-15','paid')
SELECT * FROM dual;
SELECT * FROM disbursements;






INSERT ALL
INTO renewals VALUES (1,1,2025,88,'approved')
INTO renewals VALUES (2,2,2025,91,'approved')
INTO renewals VALUES (3,3,2025,75,'approved')
INTO renewals VALUES (4,4,2025,70,'rejected')
INTO renewals VALUES (5,5,2025,85,'approved')
INTO renewals VALUES (6,6,2025,93,'approved')
INTO renewals VALUES (7,7,2025,68,'rejected')
INTO renewals VALUES (8,8,2025,82,'approved')
INTO renewals VALUES (9,9,2025,80,'approved')
INTO renewals VALUES (10,10,2025,89,'approved')
INTO renewals VALUES (11,11,2025,74,'approved')
INTO renewals VALUES (12,12,2025,86,'approved')
INTO renewals VALUES (13,13,2025,92,'approved')
INTO renewals VALUES (14,14,2025,88,'approved')
INTO renewals VALUES (15,15,2025,71,'rejected')
INTO renewals VALUES (16,16,2025,84,'approved')
INTO renewals VALUES (17,17,2025,79,'approved')
INTO renewals VALUES (18,18,2025,90,'approved')
INTO renewals VALUES (19,19,2025,73,'approved')
INTO renewals VALUES (20,20,2025,87,'approved')
INTO renewals VALUES (21,21,2025,88,'approved')
INTO renewals VALUES (22,22,2025,89,'approved')
INTO renewals VALUES (23,23,2025,90,'approved')
INTO renewals VALUES (24,24,2025,91,'approved')
INTO renewals VALUES (25,25,2025,92,'approved')
INTO renewals VALUES (26,26,2025,93,'approved')
INTO renewals VALUES (27,27,2025,94,'approved')
INTO renewals VALUES (28,28,2025,95,'approved')
INTO renewals VALUES (29,29,2025,96,'approved')
INTO renewals VALUES (30,30,2025,97,'approved')
INTO renewals VALUES (31,31,2025,78,'approved')
INTO renewals VALUES (32,32,2025,79,'approved')
INTO renewals VALUES (33,33,2025,80,'approved')
INTO renewals VALUES (34,34,2025,81,'approved')
INTO renewals VALUES (35,35,2025,82,'approved')
INTO renewals VALUES (36,36,2025,83,'approved')
INTO renewals VALUES (37,37,2025,84,'approved')
INTO renewals VALUES (38,38,2025,85,'approved')
INTO renewals VALUES (39,39,2025,86,'approved')
INTO renewals VALUES (40,40,2025,87,'approved')
SELECT * FROM dual;
SELECT * FROM renewals;

INSERT ALL
INTO officers VALUES (1,'Kumar','Verifier','kumar@mail.com')
INTO officers VALUES (2,'Anita','Verifier','anita@mail.com')
INTO officers VALUES (3,'Suresh','Verifier','suresh@mail.com')
INTO officers VALUES (4,'Lakshmi','Verifier','lakshmi@mail.com')
INTO officers VALUES (5,'Rajan','Verifier','rajan@mail.com')
INTO officers VALUES (6,'Geetha','Verifier','geetha@mail.com')
INTO officers VALUES (7,'Vikram','Verifier','vikram@mail.com')
INTO officers VALUES (8,'Shalini','Verifier','shalini@mail.com')
INTO officers VALUES (9,'Prakash','Verifier','prakash@mail.com')
INTO officers VALUES (10,'Deepa','Verifier','deepa@mail.com')
SELECT * FROM dual;
SELECT * FROM officers;





INSERT ALL
INTO verification_logs VALUES (1,1,1,SYSDATE-1,'ok')
INTO verification_logs VALUES (2,2,1,SYSDATE-2,'ok')
INTO verification_logs VALUES (3,3,2,SYSDATE-3,'ok')
INTO verification_logs VALUES (4,4,2,SYSDATE-4,'ok')
INTO verification_logs VALUES (5,5,3,SYSDATE-5,'ok')
INTO verification_logs VALUES (6,6,3,SYSDATE-6,'ok')
INTO verification_logs VALUES (7,7,4,SYSDATE-7,'ok')
INTO verification_logs VALUES (8,8,4,SYSDATE-8,'ok')
INTO verification_logs VALUES (9,9,5,SYSDATE-9,'ok')
INTO verification_logs VALUES (10,10,5,SYSDATE-10,'ok')
INTO verification_logs VALUES (11,11,6,SYSDATE-11,'ok')
INTO verification_logs VALUES (12,12,6,SYSDATE-12,'ok')
INTO verification_logs VALUES (13,13,7,SYSDATE-13,'ok')
INTO verification_logs VALUES (14,14,7,SYSDATE-14,'ok')
INTO verification_logs VALUES (15,15,8,SYSDATE-15,'ok')
INTO verification_logs VALUES (16,16,8,SYSDATE-16,'ok')
INTO verification_logs VALUES (17,17,9,SYSDATE-17,'ok')
INTO verification_logs VALUES (18,18,9,SYSDATE-18,'ok')
INTO verification_logs VALUES (19,19,10,SYSDATE-19,'ok')
INTO verification_logs VALUES (20,20,10,SYSDATE-20,'ok')
INTO verification_logs VALUES (21,21,1,SYSDATE-21,'ok')
INTO verification_logs VALUES (22,22,2,SYSDATE-22,'ok')
INTO verification_logs VALUES (23,23,3,SYSDATE-23,'ok')
INTO verification_logs VALUES (24,24,4,SYSDATE-24,'ok')
INTO verification_logs VALUES (25,25,5,SYSDATE-25,'ok')
INTO verification_logs VALUES (26,26,6,SYSDATE-26,'ok')
INTO verification_logs VALUES (27,27,7,SYSDATE-27,'ok')
INTO verification_logs VALUES (28,28,8,SYSDATE-28,'ok')
INTO verification_logs VALUES (29,29,9,SYSDATE-29,'ok')
INTO verification_logs VALUES (30,30,10,SYSDATE-30,'ok')
INTO verification_logs VALUES (31,31,1,SYSDATE-31,'ok')
INTO verification_logs VALUES (32,32,2,SYSDATE-32,'ok')
INTO verification_logs VALUES (33,33,3,SYSDATE-33,'ok')
INTO verification_logs VALUES (34,34,4,SYSDATE-34,'ok')
INTO verification_logs VALUES (35,35,5,SYSDATE-35,'ok')
INTO verification_logs VALUES (36,36,6,SYSDATE-36,'ok')
INTO verification_logs VALUES (37,37,7,SYSDATE-37,'ok')
INTO verification_logs VALUES (38,38,8,SYSDATE-38,'ok')
INTO verification_logs VALUES (39,39,9,SYSDATE-39,'ok')
INTO verification_logs VALUES (40,40,10,SYSDATE-40,'ok')
INTO verification_logs VALUES (41,1,1,SYSDATE-41,'ok')
INTO verification_logs VALUES (42,2,2,SYSDATE-42,'ok')
INTO verification_logs VALUES (43,3,3,SYSDATE-43,'ok')
INTO verification_logs VALUES (44,4,4,SYSDATE-44,'ok')
INTO verification_logs VALUES (45,5,5,SYSDATE-45,'ok')
INTO verification_logs VALUES (46,6,6,SYSDATE-46,'ok')
INTO verification_logs VALUES (47,7,7,SYSDATE-47,'ok')
INTO verification_logs VALUES (48,8,8,SYSDATE-48,'ok')
INTO verification_logs VALUES (49,9,9,SYSDATE-49,'ok')
INTO verification_logs VALUES (50,10,10,SYSDATE-50,'ok')
SELECT * FROM dual;
SELECT * FROM verification_logs;










SELECT DISTINCT s.*
FROM students s
JOIN applications a ON s.student_id = a.student_id
WHERE EXTRACT(YEAR FROM a.apply_date) = 2024
ORDER BY s.student_id;













SELECT * FROM scholarships
WHERE fund_amount > 50000;












SELECT * FROM applications
WHERE status = 'submitted';








SELECT s.name
FROM students s
JOIN applications a ON s.student_id = a.student_id
JOIN scholarships sc ON a.scholarship_id = sc.scholarship_id
WHERE a.status = 'rejected'
AND s.income > sc.max_income;







SELECT student_id
FROM applications
GROUP BY student_id
HAVING COUNT(*) > 2;








SELECT a.app_id, s.student_id, s.name AS student_name, sc.scholarship_id, sc.name AS scholarship_name,a.apply_date,a.status,a.remarks
FROM applications a
JOIN students s ON a.student_id = s.student_id
JOIN scholarships sc ON a.scholarship_id = sc.scholarship_id;










SELECT name
FROM students
WHERE marks < (SELECT AVG(marks) FROM students);








SELECT officer_id
FROM verification_logs
GROUP BY officer_id
HAVING COUNT(*) > 30;






SELECT sc.scholarship_id, sc.name
FROM scholarships sc
JOIN applications a
  ON sc.scholarship_id = a.scholarship_id
WHERE a.status = 'approved'
GROUP BY sc.scholarship_id, sc.name, sc.fund_amount
HAVING COUNT(*) > sc.fund_amount / 10000;










SELECT name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM applications a
    WHERE a.student_id = s.student_id
    AND a.status = 'rejected'
);








SELECT EXTRACT(YEAR FROM pay_date) year,
       SUM(amount) total_amount
FROM disbursements
GROUP BY EXTRACT(YEAR FROM pay_date);











 
SELECT dept, COUNT(*) total
FROM students s
JOIN applications a ON s.student_id = a.student_id
WHERE a.status = 'approved'
GROUP BY dept
ORDER BY total DESC;










SELECT *FROM (
    SELECT dept, COUNT(*) AS total_beneficiaries
    FROM students s
    JOIN applications a ON s.student_id = a.student_id
    WHERE a.status = 'approved'
    GROUP BY dept
    ORDER BY total_beneficiaries DESC
)
WHERE ROWNUM = 1;









SELECT sc.category,ROUND(
           SUM(CASE WHEN a.status = 'approved' THEN 1 ELSE 0 END)/ COUNT(*) * 100, 2  AS approval_percentage FROM applications a
           JOIN scholarships sc ON a.scholarship_id = sc.scholarship_id
           GROUP BY sc.category;









SELECT s.scholarship_id,
       s.name,
       s.min_marks,
       ROUND(AVG(st.marks),2) AS avg_applicant_marks
FROM scholarships s
JOIN applications a ON s.scholarship_id = a.scholarship_id
JOIN students st ON a.student_id = st.student_id
GROUP BY s.scholarship_id, s.name, s.min_marks
HAVING AVG(st.marks) < s.min_marks
ORDER BY s.scholarship_id;














SELECT TO_CHAR(pay_date, 'YYYY-MM') AS month,
       COUNT(pay_id) AS total_transactions,
       SUM(amount) AS total_amount
FROM disbursements
GROUP BY TO_CHAR(pay_date, 'YYYY-MM')
ORDER BY month;













SELECT o.officer_id,o.name,COUNT(v.log_id) AS workload
FROM officers o
JOIN verification_logs v  ON o.officer_id = v.officer_id
GROUP BY o.officer_id, o.name
HAVING COUNT(v.log_id) >
(SELECT AVG(cnt) FROM (SELECT COUNT(log_id) cnt FROM verification_logs GROUP BY officer_id ) )
ORDER BY workload DESC;











SELECT DISTINCT s.student_id, s.name
FROM students s
JOIN applications a ON s.student_id = a.student_id
JOIN renewals r ON a.app_id = r.app_id
WHERE r.marks > s.marks
ORDER BY s.student_id;











SELECT s.name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM applications a
    JOIN scholarships sc ON a.scholarship_id = sc.scholarship_id
    WHERE a.student_id = s.student_id
    AND sc.category <> 'Merit'
);















CREATE VIEW scholarship_summary AS
SELECT s.name AS student_name,
       sc.name AS scholarship_name,
       a.status,
       NVL(SUM(d.amount),0) AS total_fund_received
FROM students s
JOIN applications a 
ON s.student_id = a.student_id
JOIN scholarships sc 
ON sc.scholarship_id = a.scholarship_id
LEFT JOIN disbursements d 
ON d.app_id = a.app_id
GROUP BY s.name, sc.name, a.status;

SELECT * FROM scholarship_summary;



