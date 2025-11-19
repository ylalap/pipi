const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors({
    origin: ['http://localhost:3000', 'https://*.app.github.dev'],
    credentials: true
}));
app.use(bodyParser.json());
app.use(express.static('public'));

// Initialize SQLite Database
const db = new sqlite3.Database(':memory:');

// Create tables and sample data
db.serialize(() => {
    // Cars table
    db.run(`CREATE TABLE cars (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        brand TEXT NOT NULL,
        model TEXT NOT NULL,
        year INTEGER,
        price DECIMAL(10,2),
        color TEXT,
        available BOOLEAN DEFAULT true
    )`);

    // Buyers table
    db.run(`CREATE TABLE buyers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT,
        phone TEXT,
        address TEXT
    )`);

    // Sales table
    db.run(`CREATE TABLE sales (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        car_id INTEGER,
        buyer_id INTEGER,
        sale_date DATE,
        sale_price DECIMAL(10,2),
        FOREIGN KEY(car_id) REFERENCES cars(id),
        FOREIGN KEY(buyer_id) REFERENCES buyers(id)
    )`);

    // Insert sample data
    const insertCar = db.prepare(`INSERT INTO cars (brand, model, year, price, color) VALUES (?, ?, ?, ?, ?)`);
    insertCar.run('Toyota', 'Camry', 2023, 25000, 'White');
    insertCar.run('Honda', 'Civic', 2023, 22000, 'Blue');
    insertCar.run('Ford', 'Mustang', 2023, 35000, 'Red');
    insertCar.run('BMW', 'X5', 2023, 60000, 'Black');
    insertCar.run('Mercedes', 'C-Class', 2023, 45000, 'Silver');
    insertCar.finalize();

    const insertBuyer = db.prepare(`INSERT INTO buyers (name, email, phone, address) VALUES (?, ?, ?, ?)`);
    insertBuyer.run('John Smith', 'john@email.com', '+1234567890', '123 Main St');
    insertBuyer.run('Sarah Johnson', 'sarah@email.com', '+1987654321', '456 Oak Ave');
    insertBuyer.finalize();
});

// API Routes

// Get all cars
app.get('/api/cars', (req, res) => {
    db.all('SELECT * FROM cars', (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

// Get car by ID
app.get('/api/cars/:id', (req, res) => {
    const id = req.params.id;
    db.get('SELECT * FROM cars WHERE id = ?', [id], (err, row) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(row);
    });
});

// Add new car
app.post('/api/cars', (req, res) => {
    const { brand, model, year, price, color } = req.body;
    db.run('INSERT INTO cars (brand, model, year, price, color) VALUES (?, ?, ?, ?, ?)',
        [brand, model, year, price, color],
        function(err) {
            if (err) {
                res.status(500).json({ error: err.message });
                return;
            }
            res.json({ id: this.lastID, message: 'Car added successfully' });
        });
});

// Get all buyers
app.get('/api/buyers', (req, res) => {
    db.all('SELECT * FROM buyers', (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

// Get all sales
app.get('/api/sales', (req, res) => {
    db.all(`
        SELECT s.*, c.brand, c.model, b.name as buyer_name 
        FROM sales s 
        JOIN cars c ON s.car_id = c.id 
        JOIN buyers b ON s.buyer_id = b.id
    `, (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

// Health check
app.get('/api/health', (req, res) => {
    res.json({ status: 'OK', message: 'Auto Dealer API is running' });
});

// Serve manifest.json
app.get('/manifest.json', (req, res) => {
    res.json({
        name: "Auto Dealer",
        short_name: "AutoDealer",
        start_url: "/",
        display: "standalone",
        background_color: "#ffffff",
        theme_color: "#000000",
        icons: []
    });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Auto Dealer backend running on port ${PORT}`);
    console.log(`Access it from: http://localhost:${PORT}`);
});