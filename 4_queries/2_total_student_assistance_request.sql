SELECT count(assistance_requests.id) as total_assistances, name
FROM students
JOIN assistance_requests ON student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY name;