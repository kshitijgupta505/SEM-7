var express = require('express');
var app = express();

app.get('/', function(req, res){
   res.send("Shree Sita Ram");
});

app.listen(3000);

