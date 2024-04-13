const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = 3000;

const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

app.get('/', async (req, res) => {
    const { rows } = await pool.query('SELECT NOW() as now');
    res.send(`Backend response at ${rows[0].now}`);
});

app.listen(port, () => {
    console.log(`Backend running on http://localhost:${port}`);
});
