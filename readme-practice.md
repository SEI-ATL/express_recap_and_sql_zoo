# Express

## Set up
We will start by setting up our express node in the command line

```text
npm init -y
```
this will prepare our package.json file

```text
npm install express
```
to launch the express node for the prject we are currently working on.

```text
nodemon index.js
```
optional - runs nodemon to reflect changes we envoke
```tex
touch index.js
```
this is going to be our main file to connect all components

```js
const express = require('express');
```
imports our express node module into our project

```js
const app = express()
```
envokes express and ties it to the app variable

## Returnig Text

```js
app.get('/', function(req, res){
    res.send('Helo, SEI World!');
});
```
initial set up to return text
```js
app.get
```
using the get method (command) to retrieve information from the server

```js
'/'
``` 
is our path

```js
function(req, res){
    res.send('Helo, SEI World!');
}
```
The function that returns our text - hard coded for now

We use the same principle to create more paths - such as 'about' and 'blog'

```js
app.get('/about', function(req, res){
    res.send('This is the about page');
})

app.get('/blog', (req,res) => {
    res.send("Welcome to my Blog");
})
```
now we connect our express app to a port - in tis case localhost:5000
```js
app.listen(5000);
```
if nodemon is running we can simply go into our browser type: localhost:5000 - refresh to see our changes

without nodemaon we have to run
```text
node index.js
``` 
in our command line to start listening for the server

## Sending HTML

first we will create 'index.html' 'about.html and 'blog.html' and move them to a new folder we'll call 'views' for better file structure <br/>

we will be sending these files with our response <br/>

modifying 'send' method in 'sendFile' to attach html. We will use __dirname within our file path to make sure the path works on the server. We will also attach 'status 200 code' to our response 

```js
app.get('/', function(req, res){
    res.sendFile(__dirname + 'views/index.html');
    res.status(200)
});
```
doing the same for the 'about' and 'blog' page

```js
app.get('/about', function(req, res){
    res.sendFile(__dirname + 'views/about.html');
    res.status(200);
})

app.get('/blog', (req,res) => {
    res.sendFile(__dirname + 'views/blog.html');
    res.status(200);
})
```
## Referencing variables in our view templates

installing ejs to our project folder 

``` text
npm install ejs
```
importing it into our index.js file

```js
app.set('view engine', 'ejs')
```
convert all html files in our view folder into ejs format to enable coding in javaScript and html at the same time <br/>

in index.html we will change 'sendFile' method into 'render'

```js
app.get('/', function(req, res){
    res.render('index');
  
});

app.get('/about', function(req, res){
    res.render('about');
    
})

app.get('/blog', (req,res) => {
    res.render('blog');
  
})
```

adding variables to our render method

```js
app.get('/', function(req, res){
    res.render('index', {myVar:'Hello'});
```
example where we hard code the value of the variable <br/>

on our index.ejs file we will add it in using the newly available synthax

```js
<h1>Hello from Index.ejs</h1>
<%= myVar %>
```
the '=' after the '%' ensures our passes variable will be rreflected int he html nody

adding functionality to variable <br/>
```js
app.get('/blog/:date', (req,res) => {
    res.render('blog');
  
})
```
added ':date' to our path - where 'date' is a placeholder <br/>
 
 insert our place holder into blog.ejs 

 ```js
<h1>Blog</h1>
<p>You are lookin at the blog entry for <%= date %></p>
```

passing parameters into our render method
```js
app.get('/blog/:date', (req,res) => {
    res.render('blog', {date: req.params.date});
  
})
```
