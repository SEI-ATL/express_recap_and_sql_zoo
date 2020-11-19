<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
### Node Express

## Node Setup

1. Create a repo and clone it to your local machine.

2. Initialize Node Package Manager inside of the created repo.

```
npm init
```

3. Complete the init by entering through all the questions. Another way to do this would be to change the above step from npm init to npm init - y. This will allow you to skip the setup and default all the answers.

4. Create your index file.

## Log inside your terminal

1. Inside your index file, add a console.log with a string ('Hello!'), and then run "node index.js" in your terminal. You should see your messaged displayed there.

```js
console.log('Hello!');
```
```text
node index.js
```

## Express

1. Create a repo and use npm init.

```
npm init
```

2. Install Express

```
npm i express
```

3. Create an index file

```
touch index.js
```

4. Require Express in your index file

```js
let express = require('express');
```

5. Create a route and add a listen

```js
app.get('/', (req, res) => {
  res.send('Hi');
});
app.listen(3000);
```

5. Go to localhost:3000 in your broswer and you should see the "Hi" statement.

## Send to HTML

Use res.render to send data to HTML, and use icecream notation to reference it 

```
<%= example %>
```

