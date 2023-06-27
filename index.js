const express = require('express');
const { Pool } = require('pg');

const app = express();

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'employees',
  password: '123',
  port: 5432,
});

app.use(express.json());

app.post('/data', async (req, res) => {
  try {
    const {first_name, last_name, email, department_id} = req.body;
    console.log('Request Body:', req.body);
    const query = 'INSERT INTO employees (first_name, last_name, email, department_id) VALUES ($1, $2, $3, $4) RETURNING *';
    const result = await pool.query(query, [first_name, last_name, email, department_id]);
    console.log(result);

    res.status(200).json({ message: 'Data inserted successfully', data: {employees: result.rows[0]} });
  } catch (error) {
    res.status(500).json({ error: 'An error occurred' });
  }
});

app.get('/data', async (req, res) => {
  try {
    const query = 'SELECT * FROM employees';
    const results = await pool.query(query);

    res.status(200).json(results.rows);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred' });
  }
});

// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});