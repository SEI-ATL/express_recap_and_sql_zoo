# Node-express
Node express
## Creating Node
1. You go to your `Github' and create `Repo`.
2. Once you create that `Repo` go into your terminals to `clone` it locally.
3. once you `Clone` your repo
4. Be sure to go into your `repo folder` to start the process.
5. Two options you have are `npm intit` which will ask you details on your prohect if you want to ve more descriptive, like...
```iterm2
My-first-node-project git:(main) npm init
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (my-first-node-project) my-first-node-project
version: (1.0.0)
description: "This is my first node project"
entry point: (index.js) npm init -y
test command: touch index.html
git repository: (https://github.com/canourrea23/My-first-node-project.git)
keywords: [],
author: Carolina Urrea
license: (ISC) "ICS",
Sorry, license should be a valid SPDX license expression (without "LicenseRef"), "UNLICENSED", or "SEE LICENSE IN <filename>".
license: (ISC)
About to write to /Users/carolinaurrea/Desktop/SEI1019/unit_two/codealong/My-first-node-project/package.json:

{
  "name": "my-first-node-project",
  "version": "1.0.0",
  "description": "\"This is my first node project\"",
  "main": "npm init -y",
  "scripts": {
    "test": "touch index.html"
  },
  "repository": {
    "type": "git",
    "url": "git+https://github.com/canourrea23/My-first-node-project.git"
  },
  "keywords": [
    "[]"
  ],
  "author": "Carolina Urrea",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/canourrea23/My-first-node-project/issues"
  },
  "homepage": "https://github.com/canourrea23/My-first-node-project#readme"
}


Is this OK? (yes) yes
```

6. or `npm init -y` which will defailt all the settings to yes and blank

```
 My-first-node-project git:(main) ✗ touch index.js
We added the index.js and module.js
opened index.js 
All files are linked from one js file to an other

```javaScript
const { add, subtract } = require("./myModule");

let name = 'Carolina Urrea'
console.log(name)

function printName(person) {
    return `Hello, ${person}`;
}
console.log(printName(name));

console.log(add(50, 5));
console.log(subtract(5, 15));
```

```javaScript
const beBasic = () => "That's so fetch!"
function add(num1, num2){
    return num1+ num2;
}

function subtract(num1, num2) {
    return num2 - num1;
}
module.exports = {
    beBasic,
    add,
    subtract,
}
```

6. After adding the modules make sure you don't push that to github. you can hide the modules bu creating .gitignore and place the module file

```
node_modules
```
Create a views folder inside your project directory. Inside this folder, create three HTML files:
index.html (this is the standard filename for the view associated with the base URL)
about.html
blog-directory.html

Put some basic HTML in these files so you can test them.

In your routes, replace the res.send(<message>) with res.sendFile(<absolute file path>)

```js
app.get('/', function(req, res) {
  res.sendFile(__dirname+'/views/index.html');
});
```

Add EJS to your personal website project using npm:

```iTerm
~ [npm install ejs]
```
After you set-up view engine

```js
app.set('view engine', 'ejs');
```
Adapt your routes to ejs
1. Rename the .html files to .ejs files.
2. Replace your res.sendFile(<absolute path>) statements with res.render(<file name>) statements.
3. Ejs assumes a lot about the path to the template files, so as long as they are nested in a views folder and have .ejs extensions, you can simply pass the filename (no extension, though it wont break it if you include it) into res.render().


Your home route should look like this:
```js
app.get('/', function(req, res) {
  res.render('index.ejs');
});
```
### index.js
Templating with variables means we can pass in an object to res.render() and access the values stored in it as variables inside the ejs template.
This is best demonstrated with an example. Create an object with at least one key-value pair and pass that object in as the second argument to the render function in one of your routes:

```index.js
app.get('/', function(req, res) {
  res.render('index', {name: "Sterling Archer", age: 35});
});
```

We now have access to a name variable inside our index.ejs file! We can access this variable by embedding it into the html using this notation: <%= embedded js goes here %>.
For example: 
```index.ejs
<!DOCTYPE html>
<html>
  <head>
    <title>Home Page</title>
  </head>
  <body>
    <h1>Hello, <%= name %>!</h1>
  </body>
</html>
```
### Partails

Partials can be used to modularize views and reduce repetition. A common pattern is to move the header and footer of a page into separate views, or partials, then render them on each page.
Create the partials

In the main directory of your project, create a partials folder that includes a header.ejs file.
```partials/header.ejs
  <header>
    <img src="http://placekitten.com/500/500">
  </header>
  ```
