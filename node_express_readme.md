<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->


# Create Module
create your module file `myModule.js`.

In Node, `module.exports` is an object that will hold code to be exported.

For examples

```js

module.exports.beBasic = () => "That's so fetch!"

```

Now the module.exports object has `beBasic` ad the key and the function as the value.

# Import the module in `index.js`

This is where `require` function, specific to Node, comes into play. This function takes one argument: the path to the file that contains the module we are exporting.

Inside `index.js` we can put the following code.

```js 
const myModule = require('./myModule.js');

console.log(myModule.beBasic());
```

Now if we run `index.js` via the command line: 

`node index.js`


We have successfully create and imported a module.

# Create Route With Express

```j
app.get('/', (req, res) => {
    res.send('Hello, world');
});

app.listen(8000);
```
more examples of how our index.js files would look with the routes

```js
const express = require('express');
const app = express();

app.set('view engine', 'ejs')

app.get('/', function(req, res) {
    res.render('index', {myVar: 'woohoo'})
});

app.get('/about', function(req, res){
    res.render('about')
});

app.get('/blog/:date', (req, res) => {
    console.log(req)
    res.render('blog', { date: req.params.date })
});

app.listen(8000, () => {
    console.log('server started');
});
```
