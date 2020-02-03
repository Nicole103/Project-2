var db = require("../models");
var axios = require("axios");


module.exports = function (app) {
    // Load index page
    app.get("/", function (req, res) {
        res.render("index", {
        });
    });
    app.get("/dm/:id", (req, res) => {
        db.NPC.findAll({})
            .then(dbNpcs => {
                db.Locale.findAll({})
                    .then(dbLocales => {
                        db.Post.findAll({}).then(dbPost => {
                            console.log(dbNpcs);
                            res.render("dmUser", {
                                locales: dbLocales,
                                npcs: dbNpcs,
                                npcName: dbNpcs.fullname,
                                Post: dbPost
                            });
                        });
                    });
            });
    });
    app.get("/player/:id", (req, res) => {
        db.Char.findAll({ where: { userId: req.params.id } })
        .then(dbChars => {
            db.Post.findAll({})
            .then(dbPost => {
                res.render("player", {
                    Char: dbChars,
                    Post: dbPost
                });
            });
        });
    });


    app.post("/search/5e", (req, res) => {
        var queryURL = "http://dnd5eapi.co/api/" + req.body.searchType + '/' + req.body.searchContent;
        console.log(queryURL);
        axios.get(queryURL).then(function (response) {
            res.json(response.data);
        }).catch(err => {
            res.json({});
        });

    });


    // Render 404 page for any unmatched routes
    app.get("*", function (req, res) {
        res.render("404");
    });
};

