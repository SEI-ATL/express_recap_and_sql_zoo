<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->

## Express
[Instructions](https://romebell.gitbook.io/sei-1019/node-express/00readme-1/01intro-to-express)
1. Create a repo and `clone` in local server
2. Type `npm i express` in terminal to install express
3. Create a index.js
4. Add code to `index.js` to import the express module and create an express application
```js
const express = require('express');
const app = express();
```
5. Add code to `index.js` to create a home route. 
- .get() is an express method that takes in two parameters:
    1. a URL Pattern
    2. a callback function that tells the app what to do when this route is reached
- res.send() sends back a simple string
```js
app.get('/', function(req, res) {
    res.send('Hello, World!');
});
```
6. Add `app.listen(8000);` to `index.js` to tell the application to listen to port 8000
7. Type `nodemon index.js` or `node index.js` in terminal to run
8. Type `localhost:8000` in browser to visit your application

## EJS: Embedded Javascript
[Instructions](https://romebell.gitbook.io/sei-1019/node-express/00readme-1/01intro-to-express/04templates)
1. Type `npm install ejs` in terminal to add ejs to project
2. Add `app.set('view engine', 'ejs');` to `index.js` before the routes and after creating application.
3. Rename the .html files to .ejs files and place in a `views` folder
4. Change route to:
```js
app.get('/(filename)', function(req, res) {
  res.render('(filename)', object);
});
```
5. The render function can take in an object as a parameter and access the values stored in it as variables inside the ejs template
6. Use `<%= (embedded js goes here) %>` to embed any javascript in ejs files
