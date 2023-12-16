Q1: Find students who are in 3rd grade and have 5 points for all their courses.
The output should consist of the student names only in alphabetical order

best_student = "SELECT s.name
FROM Students s
INNER JOIN Student_Subject ss
	ON s.student_id = ss.student_id
WHERE s.grade = 3
GROUP BY s.name
HAVING AVG(result) = 5
ORDER BY s.name;"

--------------------------

Q2: Find four students with the most achievement points and list their
names in alphabetical order with their scores. The student's year is not critical.
The output should have only the name and the bonus point column.
The output should be in descending order of the bonus point column.

achievement_point = "select s.name, sum(a.bonus) as [bonus point]
from Students s
Join Student_Achievement sa on s.student_id = sa.student_id
join Achievement a on a.achievement_id = sa.achievement_id
group by s.name
Order by sum(a.bonus) desc
limit 4;"


------------------------------

Q4: If the student's average is over 3.5 points for courses, output above average in the best column.
Otherwise, print below average. Order the results in alphabetical order by name.

average_student = "SELECT
    s.name,
    CASE
        WHEN AVG(ss.result) > 3.5 THEN 'above average'
        ELSE 'below average'
    END AS best
FROM
    students s
JOIN
    Student_Subject ss ON s.student_id = ss.student_id
GROUP BY
    s.name
ORDER BY
    s.name ASC;"

---------------------------------

Q5:You have to find the best students. The course averages of these students are above 4.5 points.
The result should be in ascending order by name, with their names and which department they are in.

best_of_department = "SELECT s.name, d.department_name
FROM Students s
JOIN Student_Subject ss ON s.student_id = ss.student_id
JOIN Department d ON s.department_id = d.department_id
GROUP BY s.name, d.department_name
HAVING AVG(ss.result) > 4.5;"