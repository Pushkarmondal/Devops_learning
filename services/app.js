const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from the self-healing microservice!');
});

app.listen(port, () => {
  console.log(`Microservice listening at http://localhost:${port}`);
});
