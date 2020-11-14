<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
 Node-Express

Export info from one js file so that it can be accessed in another js file.
example

```js
module.exports = {
    beBasic, 
    add,
    subtract
}
```
Is going to export three functions created in js file called myModule.js . (beBasic, add and subtract)

```js
const { add, subtract, beBasic } = require('./myModule')
```
Will import those 3 functions to a new js file so they can be used.

Now instead of using browser to check console updates, just type node (document name) to view in terminal. ie. node index.js

Add a gitignore file to stop certain files to be uploaded to github when you push.
To add a git ignore file just enter ```touch .gitignore``` into the directory you need. then in the gitignore file add the names of the files that you dont want pushed to github.

## Express

Create a directory and initialize node inside the directory `node.init`
Afterwards install express by entering `npm i express`
Add a js file, ie `touch index.js`
Import the Express module by entering 
```javascript 
const express = require('express');
```
in the js file

Create an instance of an express app by adding 
```javascript 
const app = express();
```

Test making a home route  
```javascript 
app.get('/', function(req, res) {
    res.send('Hello, World!);
});

app.listen(8000);
```

Run node on the js file in terminal, or run nodemon. Then visit `localhost8000` in browser

Add different routes to the url path

```javascript 
app.get('/about', function(req, res) {
    res.send('This is the about page');
});

app.listen(8000);
```


 Create a views folder inside your project directory. Inside this folder, create three HTML files:
index.html (this is the standard filename for the view associated with the base URL)
about.html
blog-directory.html

in your routes, replace the 
```javascript 
res.send(<message>) 
```
with 
```javascript
res.sendFile(<absolute file path>)
```
absolute path = `__dirname + '/views/index.html'`

## embedded javascript (EJS)

install ejs into directory

`npm install ejs`


Above your routes, add an app.set(name, value) statement docs where the name is the view engine property and the value is ejs.

`app.set('view engine', 'ejs');`

Adapt your routes to ejs
1. Rename the .html files to .ejs files.
2. Replace your `res.sendFile(<absolute path>)` statements with `res.render(<file name>)` statements.
3. Ejs assumes a lot about the path to the template files, so as long as they are nested in a views folder and have .ejs extensions, you can simply pass the filename (no extension, though it wont break it if you include it) into res.render().


Your home route should look like this:

`app.get('/', function(req, res) {
  res.render('index.ejs');
});`


Templating with variables means we can pass in an object to res.render() and access the values stored in it as variables inside the ejs template.
This is best demonstrated with an example. Create an object with at least one key-value pair and pass that object in as the second argument to the render function in one of your routes:
index.js

`app.get('/', function(req, res) {
  res.render('index', {name: "Sterling Archer", age: 35});
});`

We now have access to a name variable inside our index.ejs file! We can access this variable by embedding it into the html using this notation: `<%= embedded js goes here %>`