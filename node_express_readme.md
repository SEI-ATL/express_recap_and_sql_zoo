# Node + Express notes

> Nitish Dayal, Web & Mobile Applications Developer  
> Last commit date: Nov 16th, 2020  

# Initialize node app

1.  Set up NPM so we can install third-party libs and publish to NPM
    -   `npm init -y` (uses defaults) creates a `package.json` file
2.  Create application entry point
    -   `touch index.js` or whatever you called your entry file in your `package.json`
3.  Run files in terminal
    -   `node index.js`

# Create and use modules

1.  Export functions/objects/constants via a `module.exports` object:
    ```js
    // myModule.js
    module.exports = { hello: 'Hello World' }
    ```
2.  Import via `require` statement:
    ```js
    //index.js
    const myModule = require('./myModule.js')
    ```

# `.gitignore`

1.  Make life simple. Use the [Gitignore CLI](https://docs.gitignore.io/install/command-line).

# Express set-up

1.  Install express: `npm i express`
2.  Import express and initialize app: `const express = require('express'), app = express()`
3.  Create a basic route:
    ```js
    app.get('/', (req, res) => {
      res.send('Hello world')
    })
    ```
4.  Tell server which port to listen to requests on:
    ```js
    app.listen(5500, () => console.log(`Listening on Port 5500`))
    ```
5.  Set a view engine: `app.use('view engine', '<yourViewEngineOfChoice>')`
6.  Install view engine: `npm i <viewEngine>`
7.  Create view template:
    ```ejs
    <h1> Serving view template. <=% hello =></h1>
    ```
8.  Serve view template from route:
    ```js
    app.get('/', (req, res) => {
      res.render('index', { hello: 'hello world' })
    })
    ```
