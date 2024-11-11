const express = require('express');
const session = require('express-session');							
const passport = require('passport');								
const WebAppStrategy = require('ibmcloud-appid').WebAppStrategy;
const app = express();
var port = 3000;
app.use(session({
	secret: '123456',
	resave: true,
	saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());


passport.serializeUser((user, cb) => cb(null, user));
passport.deserializeUser((user, cb) => cb(null, user));

passport.use(new WebAppStrategy({
	tenantId: "9226bf7e-f7e7-4146-a38a-56998d80352b",
	clientId: "680bc435-78e9-4cc1-9f3b-1d1cad77062f",
	secret: "ZjhkNjk2NGQtMzUxOC00YWU5LWFlYTItNGE4OThmYjNiNjhm",
	oauthServerUrl: "https://au-syd.appid.cloud.ibm.com/oauth/v4/9226bf7e-f7e7-4146-a38a-56998d80352b",
	redirectUri: "http://localhost:3000/appid/callback"
}));


app.get('/appid/login', passport.authenticate(WebAppStrategy.STRATEGY_NAME, {
	successRedirect: '/',
	forceLogin: true
}));

//
// Handle callback
app.get('/appid/callback', passport.authenticate(WebAppStrategy.STRATEGY_NAME, { keepSessionInfo: true }));
//app.use(passport.authenticate(WebAppStrategy.STRATEGY_NAME));
app.use('/api', (req, res, next) => {
	if (req.user){
		next();
	} else {
		res.status(401).send("Unauthorized");
	}
});

app.get('/api/user', (req, res) => {
	//console.log(res);
console.log(req.session[WebAppStrategy.AUTH_CONTEXT]);
	res.json({
		user: {
			name: req.user.name
		}
	});
 
});


app.get("/appid/logout", function(req, res) {
	req.logout(function(err) {
	  if (err) { console.log(err); }
	  res.redirect("/");
	});
  });




// Serve static resources

app.use(express.static('./public'));
app.listen(port);