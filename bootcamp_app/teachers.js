const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const text = `
SELECT DISTINCT(teachers.name) as teacher, cohorts.name as cohort, count(assistance_requests.id) as total_assistances 
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
GROUP BY teacher, cohorts.name
ORDER BY teacher;
`
const cohort_name = process.argv[2];
const values = [`%${cohort_name}%`];

pool.query(text, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));