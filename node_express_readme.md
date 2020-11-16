<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->

# Node + Express + EJS Instructions
## [Node](#Node)<br>
## [Express](#Express)<br>
## [EJS](#EJS)<br>


<br>

## Node

1. Create a repo and `clone` to local machine.
```bash
git clone https://github.com/edgerees/hello-express.git
```
2. Open the the file location using your terminal.

3. Create your JS file which will be called `index.js`
```bash
touch index.js
```
4. In terminal, whichin the project folder, initialize the node command.
```bash
npm init
```

5. Give the package name, ours will be `node_practice`.

6. Since it is the 1st version it will be listed as 
```bash
1.0.0
```
7. Click `enter` when it states the license and click `Yes` when it asks if it is OK.

8. Now execute the JS file using a NPM command in terminal.

In the package.json file created, add the following code:
```json
"start" : "node index.js"
```
Then run the node start command in the terminal.
```bash
$ node start
(this will run the code you have written in the js file.)
```
9. Add someones interesting NPM package. Find an interesing NPM pacakge

[https://www.npmjs.com/package/@ultraq/array-utils]

10.  Run the insall code in your terminal 
```bash
npm i @ultraq/array-utils
```
11. Now add a `.gitignore` in the Node Modules folder.
        1. Open terminal and go to the node_modules fodler.
        2. Run the following code.
            ```bash
                npm i create-gitignore
            ```
12. `Commit` and `Push` to GitHub!
```bash
git add .
git commit -m'[Node_Modules]Setup node modules.'
git push
```

## Express
1. Create a repo and `clone` to local machine.
```bash
git clone https://github.com/edgerees/hello-express.git
```
2. Type `npm i express` in terminal to install express
```bash
npm i express
```
3. Create a app.js
```bash
touch app.js
```
4. Add code to `app.js` to import the express module and also create an express application
```js
const express = require('express');
const app = express();
```
5. Insert code to `app.js` to create a home route. 
```js
app.get('/', function(req, res) {
    res.send('Hello, World!');
```
6. Now tell the application to listen to the specified port. Type in `app.js`..
```js
app.listen(8000);
```
7. Type `nodemon index.js` in terminal to run program in server.

8. Open your internet browser and type `localhost:8000` in url bar to view your application. 


## EJS:
1. Open terminal and type the following in file location to install ejs
```bash
npm install ejs
```
2. Open `app.js` and enter in the following before routes.
```js
app.set('view engine', 'ejs');
```
3. Place the .html files in a folder you made named `views` and rename the file type to `.ejs` instead of `.html`

4. Change route to:
```js
app.get('/(filename)', function(req, res) {
  res.render('(filename)', object);
});
```
5. The render function can take in an object as a parameter and access the values stored in it as variables inside the ejs template
6. The correct syntax for emedding javascript code into the ejs files is written as...
```js
<%= (embedded js goes here) %>
```