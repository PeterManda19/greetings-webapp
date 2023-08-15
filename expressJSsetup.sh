#!/bin/bash

# Initialise the Node.js module
npm init -y

# Add "type": "module" to package.json
echo '{ "type": "module" }' >> package.json

# Add .gitignore to ignore node_modules
echo "node_modules/" >> .gitignore
echo "coverage/" >> .gitignore
echo "18" >> .node-version

# Install Express
npm install express --save

# Install Mocha
npm install mocha --save

# Install Express Handlebars
npm install express-handlebars --save

# Install Body Parser as local dependencies
npm install body-parser --save

# Create a test directory and a sample test file
mkdir test

# Create the views folder and home.handlebars template
mkdir views
echo "<h1>This is my home page</h1>" > views/home.handlebars

# Create the layouts folder and main.handlebars file
mkdir views/layouts
echo "{{{body}}}" > views/layouts/main.handlebars

# Create the public folder for static resources
mkdir public

# Update index.js to include bodyParser middleware and static middleware
echo "import express from 'express';" > index.js
echo "import { engine } from 'express-handlebars';" >> index.js
echo "import bodyParser from 'body-parser';" >> index.js
echo "" >> index.js
echo "const app = express();" >> index.js
echo "" >> index.js
echo "// Set up Handlebars view engine" >> index.js
echo "app.engine('handlebars', engine());" >> index.js
echo "app.set('view engine', 'handlebars');" >> index.js
echo "app.set('views', './views');" >> index.js
echo "" >> index.js
echo "// Serve static resources from the 'public' folder" >> index.js
echo "app.use(express.static('public'));" >> index.js
echo "" >> index.js
echo "// Parse application/x-www-form-urlencoded and application/json" >> index.js
echo "app.use(bodyParser.urlencoded({ extended: false }));" >> index.js
echo "app.use(bodyParser.json());" >> index.js
echo "" >> index.js
echo "// GET route '/'" >> index.js
echo "app.get('/', function(req, res) {" >> index.js
echo "  res.render('home');" >> index.js
echo "});" >> index.js
echo "" >> index.js
echo "// POST route '/settings'" >> index.js
echo "app.post('/settings', function(req, res) {" >> index.js
echo "  // Handle your settings route logic here..." >> index.js
echo "  res.redirect('/');" >> index.js
echo "});" >> index.js
echo "" >> index.js
echo "const PORT = process.env.PORT || 3011;" >> index.js
echo "" >> index.js
echo "app.listen(PORT, function() {" >> index.js
echo "  console.log('App started at port:', PORT);" >> index.js
echo "});" >> index.js

# Update package.json to add "test" script for running mocha tests
echo "\"scripts\": {" >> package.json
echo "  \"test\": \"mocha\"" >> package.json
echo "}" >> package.json

# Display a success message
echo "Setup completed successfully!"
