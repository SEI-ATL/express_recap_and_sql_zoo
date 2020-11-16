<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
# node-express

Node provides a way of using Javascript as a back-end language, and it allows for connecting files together via dependencies. It requires setting up a package.json file that serves as an entry point for the project.

### Importing packages is like importing a set of preexisting tools specifically designed to perform certain tasks.

#### setting up an express app:

```
npm init
```
This creates a package.json file, prompting the user for several different parameters, and creates a set of objects containing those parameters.

```
npm init -y
```

This is a shortcut that fills in default parameters for package.json.

If we create two files, ```index.js``` and ```myModule.js```, we can connect them in the following ways. If we add this to ```myModule.js```:

```js
module.exports.meanGirls = () => "I'm a mouse, duh!"
```
...then we can run that function in ```index.js``` by doing this:

```js
const.myModule = require('./myModule.js');
mymodule.beBasic();
```
If we want to create multiple functions in myModule.js for use in index.js, we can do the following in myModule.js:

```js
function gretchen() {
  let quote = "I don't think my father, the inventor of toaster strudel, would appreciate that."
  return quote;
}

function trustFall () {
  let quote = "It's not your fault you're so gap toothed."
  return quote;
}

function add(num1, num2) {
  return num1 + num2;
}

function subtract(num1, num2) {
  return num2 - num1;
}
function addAgain(num1, num2) {
  return num1 + num2;
}
module.exports = {
  meanGirls,
  trustFall,
  gretchen,
  add,
  subtract
};
```
...and something like this in ```index.js```:

```js
const {meanGirls, gretchen, trustFall} = require('/myModule.js');
console.log(gretchen());
```
**Is there a JS6 issue here? I got messages asking me to revise it. After looking at some of these libraries, it does seem like it's interchangeable with the JS5 format.**

If we want to import an external package to use with our existing ```index.js``` file, we install the package in the main directory and make sure that:
```js
const variable = require('packagename');
```
is included in our ```index.js``` file.

When we add the ```node_modules``` folder to ```.gitignore```, we ensure that every package we're using isn't uploaded in our original repo. As long as the package is installed and appears on the list in the ```package.json``` file, we're good to go.

### Additional topics:

## creating routes within an express app:

**Routing** = how an application responds to a client request to a particular endpoint: URI + an HTTP GET/POST etc. request

```js
const express = require('express'); // connection/dependencies from Express
const app = express();
// These are structured the same way for POST requests, but haven't covered those yet
// There's even a special routing method, app.all(), used to load middleware functions at a path for all HTTP request methods. (express.js site)
app.get('/', function(req, res) { // app.METHOD + a function that renders a request response
  // create one of these for each sub-page (/about, /blog, etc.)
    res.render('index', { myVar: 'woohoo'});
    // this lets you put variables in the HTML. They're written as key-value pairs
    // key-value pairs reference parameters in the JSON file  
});

app.get('/blog', (req, res) => {
    res.render('blog-generic');
})
// IMPORTANT: a way to write this as an arrow function instead:
app.get('/blog/:day', (req, res) => { // this makes the /blog page irrelevant without a date
    // res.sendFile(__dirname + '/views/blog.html');
    // res.status(200);
    const theDateTheyWant = req.params.day;
    res.render('blog', { date: theDateTheyWant }); // remember that "day" isn't the parameter in the json file
});

// a visual indication in the terminal that nodemon has started the server! Helpful to have

app.listen(8000, () => {
    console.log('server started!');
});

```
**Still to come...**

- sending text from the server back to the client:

- sending html to the client using a view template:

- referencing variables in your view templates:
