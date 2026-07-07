-- Q1
SELECT *
FROM book;

-- Q2
SELECT *
FROM book
WHERE publication_year > '2000-12-31';

-- Q3
SELECT *
FROM student
ORDER BY name ASC;

-- Q4
SELECT bo.title, at.name
FROM book bo
	INNER JOIN author at
		ON bo.id_author = at.id;

-- Q5
SELECT st.name, bo.title, lo.loan_date
FROM loan lo
	INNER JOIN student st
		ON lo.id_student = st.id
	INNER JOIN book bo
		ON lo.id_book = bo.id;

-- Q6
SELECT *
FROM loan
WHERE status = 'borrowed' AND expected_return_date < CURRENT_DATE;

-- Q7
SELECT at.name, COUNT(bo.id_author) as quantity
FROM book bo
	INNER JOIN author at
		ON bo.id_author = at.id
GROUP BY at.name;

-- Q8
SELECT at.name
FROM book bo
	INNER JOIN author at
		ON bo.id_author = at.id
GROUP BY at.name
HAVING COUNT(bo.id_author) > 2;
