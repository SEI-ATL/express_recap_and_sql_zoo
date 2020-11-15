<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
# node-express

Notes:

## Creating Node
1. You go to your `Github` and create a `Repo`.
2. Once you create that `Repo` go into your terminals to `clone` it locally.
3. Once you `clone` you repo.
4. Be sure to go into your `repo folder` to start the process.
5. Two options you have are `npm init` which will ask you details on your project if you want to be more descriptive, or `npm init -y` which will default all the settings to yes and blank.
Questions it will ask for `npm init`: ( It will also show you what is default if you hit enter. )
```text
{
  "name":
  "version": "1.0.0",
  "description":
  "main": "index.js",
  "scripts": {
    "test": 
  },
  "repository": {
    "type": "git",
    "url": 
  },
  "author": 
  "license": "ISC",
  "bugs": {
    "url": 
  },
  "homepage":
}
```
6. If you did the previous steps correctly, you should be able to `ls` to see you now have a `package.json` file along with you `README.md` file.
7. To check what is in the `package.json` file, type in `cat package.json` in your terminal. This will display the content.
8. Be sure to check what you `"main"`. Your `.js` file mus have that same name.
9. Now if you try to write `code` that will usually show up in the console, you can simple type `node index.js` (name if your .js file) and it will show in your terminal.
10. Go ahead and type in `console.log('Hello')` into your `index.js`. Then in your terminal type `node index.js`.

Good Job! You did it!

## Importing Exporting

When creating functions in other `.js` files, you must be sure to export them to be used outside that file. In this case my `.js` file is called `myModule.js`
For example:
```js
const beBasic = () => "That's so fetch!";

function add(num1, num2) {
    return num1 + num2;
}

function subtract (num1, num2) {
    return num2 - num1;
}

module.exports = { // functions you want to export go here.
    beBasic, 
    add, 
    subtract
}
```

Now when called in other `.js` files, you can use the following to use.
```js
const {add, subtract, beBasic} = require ('./myModule') //This line pulls the functions from our other .js file (myModule.js)

let name = 'Ruben Cedeno';
console.log(name);

function printName (person) {
    return `hello, ${person}`;
}

console.log(printName(name));
console.log(beBasic());
console.log(add(5,50));
console.log(subtract(10,20));
```
### Now once again check your terminal using node. You're Done!

## Creating .gitIgnore file
1. First thing you want to do it make sure you are in the correct `repo` in your terminal.
2. Next you want to type `touch .gitIgnore` make sure you add the "." as this wont work with out it.
3. Once you created that file go ahead and open it using the terminal by typing `code .`.
4. In here you want too type in all the first and folders that you want hidden. Be sure to spell the file name exactly how they are spelled, otherwise it will not work.

Example Below:
https://i.imgur.com/ZYxXIZA.png

You are now done congrats!

# Express App
### Setting up an express app 
To start a project using node express you must first install it to you project by typing `npm i express` or `npm install express` in your terminal. Once you download it, it will pop up in your node_modules folder along with other nodes, or make a new directory called node_modules.

Next go into you index.js folder and import it using `const express = require('express');` and `const app = express();`.

### Creating routes within an express app
Now you can use .js markup like below to send user to different routes then they alter the web address that you link below when you go to `localhost:3000` and alternating between `localhost:3000/about` and `localhost:3000/blog` as well in the web address. This is how you create routes.
```js
app.get('/', function (req, res) {
  res.send('Testing');
});

app.get('/about', function (req, res) {
  res.send('Testing');
});

app.get('/blog', function (req, res) {
  res.send('Testing');
});

app.listen(3000);
```
### Sending text from the server back to the client
But now that you care traveling to those pages you arent seeing anything change since all the pages are blank and the same. This is where we can add more info so the user can see the follwing under your routes. 

```js
app.get('/', function (req, res) {
  res.send('Home Testing'); //CHANGE THIS TEXT
});

app.listen(3000);
```
Once you get to the page you should see the text 'Home Testing' on the page. This is how you can alter what the euser sees when they visit the routes.

To create more routes on the page you can configure what will lead where. For instance, you can link pages. But you can also take it once step. You can also send status code by using the line of code:
```js
app.get('/', function (req, res) {
  res.send('Home Testing');
  res.status(200) //THIS LINE HERE
});

app.listen(3000);
```
### Sending html to the client using a view template
Lets take it one step folder and install ejs to better link html files. Go into the terminal and install it by typing `npm install ejs`. Let's also go to the index.js file and set a new const at the top `app.set('view engine','ejs')`
Now lets alter some of the js code to the following below. We will also go ahead and change 'index.html' to 'index.ejs' and make two new .ejs files: 'about.ejs' and 'blog.ejs'. Now we can send .html files that we altered to .ejs files to the client. (.html = .ejs)
```js
app.get('/', function (req, res) {
  res.render('index');
  res.status(200)
});

app.get('/about', function (req, res) {
  res.render('about');
  res.status(200)
});

app.get('/blog', function (req, res) {
  res.render('about');
  res.status(200)
});

app.listen(3000);
```

### Referencing variables in your view templates
Another thing we can do is reference variables that we set in index.js files in the new .ejs files. For instance, in a blog, if you wanted someone to go to a certain day of you blog what you can do do it set parameters in the .js file. For instance, the code below will take you to a date in the blog by setting a variable in the .js file and then calling it in the .ejs file.
```js
app.get('/', function (req, res) {
  res.render('blog', {date: req.params.date }); //THIS LINE
  res.status(200)
});

app.listen(3000);
```

Now you can enter the code below in the .ejs files for the client to be linked to that blog page and date.
```js
<%= date %>
```