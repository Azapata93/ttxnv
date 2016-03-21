var express = require('express');
var app = express();
var port = process.env.PORT || 1337;
var bodyParser = require('body-parser');
app.use( bodyParser.json() );
app.use( bodyParser.urlencoded({ extended: true }) );

//Set up to render the views correctly from the views folder
app.engine('html', require('ejs').renderFile);
app.set('views', __dirname.replace('backend', 'frontend') + '/html');
app.use(express.static(__dirname.replace('backend', 'frontend')));

//Application to get requests
app.get('/', function(req,res){
  console.log('app/requested');
  return res.status(200).send("hi there programmer");
});
app.get('/hi', function(req,res){
  console.log('app/requested');
  return res.status(200).send("hi there programmer");
});
//Set up to use all the routes from router.js
var router = require('./c35_modules/router');
app.use('/', router);

app.listen(port, function(){
  console.log("Application is running:")
  console.log("Listening on " + port);
});
