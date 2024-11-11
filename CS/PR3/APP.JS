var express = require('express');
var app = express();
app.listen(8000);
app.use(express.static(__dirname + '/Public'));
console.log('Server running at http://localhost:3000/');
