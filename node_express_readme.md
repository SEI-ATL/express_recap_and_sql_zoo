<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->


# node-express
## NODE
### Function modules

1. After navigating to your project directory in terminal, enter `npm init` to create json pkg OR enter `npm init -y` to create pkg and autofill form
2. Fill out form
3. Create `index.js` file
4. Create `module.js` file
5. Export your functions from your `module.js` by creating an object
```js
module.exports = {
    add,
    subtract
}
```
6. In your main Javascript file (i.e. `main.js`), `require` your functions
```js
const { add, subtract } = require("./module");
```

### Create and Import Node Modules
1. Determine if the `npm` you need is something that should be installed gloablly on your machine, or if you only need it for the app currently at hand.
2. Global install: `npm i -g [name of npm]` | Local install: `npm i [name of npm]`
3. `require` the npm in your main Javascript file (i.e. `index.js`)
```js
const luxon = require('luxon');
```
4. Log anything from the npm in your terminal with the command, `node index.js`, or `node` + [`name of your main js file`]
5. Add a `.gitignore` file and include your `node_modules/` folders so that they do not push to github along with your other files

## EXPRESS

1. Install Express locally in your project directory.

    `npm i express`

2. `require` Express in your main js file.
    
    ```js
    const app = express();
    ```

3. Create a home route using `'/'` as the first argument in the `.get`.

    ```js
    app.get('/', function(req, res) {
    })
    ```

4. To send test text to the server, use `res.send`.

    ```js
    app.get('/', function(req, res) {
        res.send('hi')
    });
    ```

5. Build a view template using `.sendFile` within your `.get`
    - Replace your file path with `__dirname`

    ```js
    app.get('/', function (req, res) {
        res.sendFile(__dirname + '/index.html')
    });
    ```

    - If you have multiple `html` files, make a view template for each, and include the name of your `html` file in the route

    ```js
    app.get('/about', function(req, res) {
        res.sendFile(__dirname + '/about.html')
    });
    ```

6. To reference variables in your view templates, switch from `html` to `ejs`.
    - Install ejs

        `npm i ejs` in terminal
    - Instruct your `html` to use `ejs` with `.set`
    ```js
    app.set('view engine', 'ejs');
    ```
    - Change `res.sendFile()` to `res.render()`
    - Remove `__dirname` leaving just the name of your `html` file (`ejs` assumes the `__dirname` and `/views/`)
        ```js
        res.render('index')
        ```
    - Change file names from `.html` to `.ejs`
    - Pass `.render` a second argument in the form of an object
        ```js
        app.get('/', function(req, res) {
            res.render('index', { myVar: 'woo' })
        })
        ```
    - In your `ejs` file, wrap your key from your new object, `myVar`, in scriplet tags: `<% %>`
    - Scriptlet tags with a `=` output to the html, `<%= %>`, tags without `=` do not
    - You are now free to write javascript in your `ejs` file if you wrap each line with scriptlets