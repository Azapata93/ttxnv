'use strict'

/*

 Here is where you will configure the routes of your application.
 This how you can make urls that will render your views pages you put in the views folder.

 This is also known as making a GET request
 An example of this looks like:
 router.get('string with your route', function(req,res){
 return res.render('path to your views in the views folder')
 });

 You can also setup POST request for something that will send something to a database.
 router.post('string with your route', function(req,res){
 executeDBFunction();
 //you can then send a response with res.send();
 return res.send("success");
 });

*/

var router = require('express').Router();
var database = require('../c35_modules/database');

module.exports = function() {

  router.get('/helloworld', function (req, res) {
    return res.render('helloworld.html');
  });

  router.post('/trains', function(req,res){
    var query = "INSERT INTO trains (name,inService,numberOfAvailable) VALUES ('" + req.body.nameOfTrain +
        "'," + req.body.inService  +
        "," + req.body.availableTrains + ")";

    database.executeQuery(query);
    return res.send("success");
  });

  return router
}();