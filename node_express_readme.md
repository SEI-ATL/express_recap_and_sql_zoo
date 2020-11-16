<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
# node-express

First you will need to create a node in the terminal with the command `npm init -y` if you want to use all the default settings (recommended) or you can create custom responses using `npm init`

After the json file has been created, you will need to create the main js file that connects the node. In this case, I went with the default `index.js`

Then I created a second js file to hold the functions I wanted to export named `myModule.js`. This is what I will be using to hold the functions and export them to my `index.js` file.

Creating functions in the js file for Node, you would export them by using `module.exports` and set that equal to the functions to you want to export into another javascript file. 

Ex: 

```javascript
module.exports = {
    beBasic,
    add,
    subtract
}
```
Once you have defined your code and exported it on the same js file, you can then import it in another javascript file using: 

```javascript
const { add, subtract } = require("./myModule");
```

Once this is done, you can call the functions into your terminal using `node index.js`

In order for you to hide the `node_modules` file, you need to create a file called `.gitignore` 

```txt
touch .gitignore
```

Once inside the .gitignore file, input the name of the package folders. Mine was `node_modules`. It will ignore any correctly spelled files inside of it. 

##Adding Express

1. Install Express locally onto your project with: 

```txt
npm i express
```

2. Set up expres in your project with: 

```js
const express = require('express')
const app = express();
app.set('view engine', 'ejs')
```

3. You can use `render` to set up routes from the app to the port. ALL .HTML FILES NEED TO BE .EJS Ex: 

```js
app.get('/about', function(req, res){
    res.render('about')
    
});
```
Inside the `about.ejs` files looks like: 

```html
<h1>ABOUT ME</h1>
```

4. To set up an easy templace (like a nav bar) or other things you want to change (and not have to change across all the files), you need a template. That template needs to also be an `.ejs` file with the code to carry across all files. 

Ex: 

```html
<header>
    <nav>
        <ul>
            <li>home</li>
            <li>about</li>
            <li>blog</li>
            <li>here</li>
        </ul>
    </nav>
</header>
```

Once this file is set up, you need to link it to every single file as so: `<%- include('nav') %> `

5. In order to reference variables inside of your ejs files, you have to use the "ice cream" bracets to reference variables. 

```html
<%- include('nav') %> 
<h1>BLOGGER</h1>
<div>You're lookin at the blog entry for</div>
<%= date %> 
```
```js
app.get('/blog/:date', (req, res) => {
    console.log(req)
    res.render('blog', {date: req.params.date})
});
```