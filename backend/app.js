var express = require('express');
var app = express();

//setup templating for rendering files in the views folder in frontend/
app.engine('html', require('ejs').renderFile);
app.set('views', __dirname.replace('backend', 'frontend') + '/views');
app.use(express.static(__dirname.replace('backend', 'frontend')));

app.get('/', function(req,res){
  return res.render('index.html');
});

app.listen(1337, function(){
 console.log("App is listening on 1337"); 
});