const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());

// In-memory user data storage
const users = [
    { email: "admin@example.com", password: "admin123", role: "admin" },
    { email: "user@example.com", password: "user123", role: "user" },
    { email: "farmer@example.com", password: "farmer123", role: "farmer" }
];

// Sign Up Endpoint
app.post('/signup', (req, res) => {
    const { name, email, password } = req.body;
    if (users.find(user => user.email === email)) {
        return res.status(400).json({ message: "User already exists." });
    }
    users.push({ name, email, password });
    res.status(201).json({ message: "User registered successfully." });
});

// Login Endpoint
app.post('/login', (req, res) => {
    const { email, password } = req.body;
    const user = users.find(user => user.email === email && user.password === password);
    if (user) {
        return res.status(200).json({ message: `Welcome ${user.role}!` });
    }
    res.status(401).json({ message: "Invalid credentials." });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
