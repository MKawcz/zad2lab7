// db_test.js
const { Pool } = require('pg');
const pool = new Pool({
    connectionString: process.env.DATABASE_URL
});

pool.query('SELECT NOW()', (err, res) => {
    if (err) {
        console.error('Database connection failed', err.stack);
        process.exit(1);
    } else {
        console.log('Success: Backend can connect to Database.');
        process.exit(0);
    }
});
