<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
# hello-express

1. `fork` and `clone` the `hello-express` repo.
2. Type `npm init -y` in command line.
3. Type `npm install express`
4. Type `touch index.js` to make a js file.
5. Type `code .` to open VS Code.
6. Navigate to `index.js` file and type:
```js
const express = require('express');
const app = express();
```
7. Now that the app is connected, to create a route to the root directory type:
```js
app.get('/', function(req, res) {
    res.send('Hello, SEI world');
});

app.listen(8000);
```
8. To make other routes, you can type anything after the '\' like it is shown below:
```js
app.get('/about', function(req, res) {
    res.send('This is the about page.')
});
```
9. Now return to your command line and type `node index.js`
10. Go to chrome and type in `localhost:800` to view the page.