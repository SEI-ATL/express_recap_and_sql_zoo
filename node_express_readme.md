<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
# node-express

Node provides a way of using Javascript as a back-end language, and it allows for connecting files together via dependencies. It requires setting up a package.json file that serves as an entry point for the project.

### Importing packages is like importing a set of preexisting tools specifically designed to perform certain tasks.

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
- setting up an express app


- creating routes within an express app


- sending text from the server back to the client


- sending html to the client using a view template


- referencing variables in your view templates
