var db = require("../models");
var axios = require("axios");


module.exports = function (app) {
  // Load index page
  app.get("/", function (req, res) {
    res.render("index", {
    });
  });

  app.get("/dm/:id", (req, res) => {
    db.NPC.findAll({}).then(dbNpcs => {
      res.render("dmUser", {
        npcs: dbNpcs
      });
    });
  });
  app.get("/dm/:id", (req, res) => {
    db.Locale.findAll({}).then(dbLocales => {
      res.render("dmUser", {
        locales: dbLocales
      });
    });  
  });
  app.get("/dm/:id", (req, res) => {
    var thisId = req.params.id;
    db.User.findOne({ where: {user_id: thisId}  }).then(dbUser => {
      res.render("dmUser", {
        user: dbUser.id,
        userName : dbUser.username
      });
    });  
  });
  app.get("/player/:id", (req, res) => {
    var thisId = req.params.id;
    db.User.findOne({ where: {id: thisId}  }).then(dbUser => {
      res.render("player", {
        user: dbUser.id,
        userName : dbUser.username
      });
    });  
  });

  app.get("/player/:user", (req, res) => {
    var thisUser = req.params.user;
    db.Char.findAll({ where: {id: thisUser} }).then(dbChars => {
      res.render("player", { 
        chars: dbChars
      });
    });
  });
  

  app.get("/player/:user", (req, res) => {
    db.Post.findAll({ where: {username: thisUser}
    }).then(dbPost => {
      res.render("player", { 
        Post: dbPost
      });
    });   
  });

  app.get("/dm/:id", (req, res) => {
    db.Post.findAll({}).then(dbPost => {
      res.render("dm", { 
        Post: dbPost
      });
    });
    
  });


  app.get('/search/:category/:search', (req, res) => {
    var queryURL = "http://dnd5eapi.co/api/" + req.params.category + '/' + req.params.search;
    axios.get(queryURL).then(function (response) {
      res.json(response.data);
    }).catch(err => {
      console.log(err);
    });

  });


  // Render 404 page for any unmatched routes
  app.get("*", function (req, res) {
    res.render("404");
  });
};

