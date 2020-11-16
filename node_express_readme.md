<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
## To use express
# Step 1

require express and use ejs if wanted
```js
const express = require('express');
const app = express();

app.set('view engine', 'ejs')
```

# Step 2
use .get to create the route so for example use
```js
app.get('/', function(req, res){
    // res.sendFile(__dirname + '/views/index.html');
    // res.status(200)
    res.render('index', { myVar: "woohoo"})
});
```

__dirname grabs the directory of the root repo

# Step 3 to send html
Use res.sendFile  to send a file to the route such as an html file
```js
   // res.sendFile(__dirname + '/views/index.html')
   ```
   
# Step 3 to send text use

```js
res.send()
```

# Step 4 to reference variables use icecream cone notation
```html
<%= myVar %>
```
