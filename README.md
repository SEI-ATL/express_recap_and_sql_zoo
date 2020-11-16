# node-express

## Node and NPM basics
- make sure you have both node and npm installed 
    - `node -v`
    - `npm -v`

- `npm init` to create a json package 
    - this will let you pick specific details like description and author name
- `npm init -y` will create json with all default values

To run any javascript in the command line type `node index.js`
- index.js is the defualt file name used by npm

In order to use anything that is not in index.js you have to link that via the `require()` function 
___
## Example
the `add` and `minus` functions are declared in the myModule.js file. To run them in index.js you have to include the first line of the following code

```js
const { add, minus } = require("./myModule");

console.log(add(5, 23));

console.log(minus(6, 9));
```

In order for that to work, in `myModule.js`, you have to assign the functions you want to include to the `module.exports` variable 

```js
const beBasic = () => "That's so fetch!";

function add(num1, num2) {
    return num1 + num2;
}

function minus(num1, num2) {
    return num1 - num2;
}

module.exports = {
    beBasic, 
    add, 
    minus
}
```

# Using Express.js
First things first, after installing express assign it to a variable
```js
const express = require('express');
const app = express();
```

## The get method
The first method to get aquainted with is the `.get()` method. Instead of retreiving a value, in this case we want to use a callback function that responds to the selected path
```js
app.get('/', function(req, res) {
    res.render('index', { myVar: 'ahhh'});
});
```
Now when someone goes to base url '/', a `response (res)` is rendered which is the `index.ejs` file in this case

## The ejs file type
EJS is like HTML but allows for more functionality
- For example with the use of `ice cream cone tags: <% %>` you can insert javascript into your ejs file
    - this is helpful if you want to pass information garnered from reqs (the counterpart to res from our callback function (res, req)) into the ejs that is displayed on the page

EXAMPLE: the ejs tags allowed us to pass in the myVar key from the previous .get() method
```html
<body>
    <%- include('nav') %>
    <h1>YOOOOOOOOOOOOOO I'm an html file</h1>
    <%= myVar %>  
</body>
```
One more cool thing about ejs is that it allows you to insert other ejs files inside itself. This is what is happening in the above code snippet `<%- include('nav') %>`

Lastly, to set your port with express use the .listen() method

```js
app.listen(8000, () => {
    console.log('server started');
});
```
