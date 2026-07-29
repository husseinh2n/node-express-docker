// Import the Express framework module to handle HTTP requests
const express = require('express');

// Initialize an Express application
const app = express();

// Define the port the server will listen on, defaulting to 3000 if not set in environment variables
const PORT = process.env.PORT || 3000;

// Define a route for the root URL ('/') that responds with a JSON welcome message
app.get('/', (req, res) => {
  res.json({
    message: 'Hello from Node.js and Docker! 🐳',
    status: 'success',
    timestamp: new Date().toISOString()
  });
});

// Start the server and listen for incoming traffic on the specified port
app.listen(PORT, () => {
  console.log(`Server is running smoothly on http://localhost:${PORT}`);
});