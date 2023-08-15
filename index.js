import express from 'express';
import { engine } from 'express-handlebars';
import bodyParser from 'body-parser';

const app = express();

// Set up Handlebars view engine
app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.set('views', './views');

// Serve static resources from the 'public' folder
app.use(express.static('public'));

// Parse application/x-www-form-urlencoded and application/json
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// GET route '/'
app.get('/', function(req, res) {
  res.render('home');
});

// POST route '/settings'
app.post('/settings', function(req, res) {
  // Handle your settings route logic here...
  res.redirect('/');
});

const PORT = process.env.PORT || 3011;

app.listen(PORT, function() {
  console.log('App started at port:', PORT);
});
