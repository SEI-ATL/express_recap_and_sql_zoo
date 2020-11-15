<!-- When you're finished updating your node & express readme, copy-paste it into here for submission! -->
# Setting up an express app

To get started with an express app, there are few different ways you can go so I'll list just one. 

You can first use ```npm install express-generator -g``` to install the Express generator as a global package and you can now run the express command in Terminal.

```express myapp``` creates a new Express project called myapp. Make sre you're creating it in your desired directory.

You can use ```npm install``` to download all dependencies for the project. 

You can use ```npm start``` to begin running the server, but this can also be done differently with PostgreSQL

# Creating routes/sending text within an express app

There are a few different HTTP methods for routes.

We learned the GET method for setting up a route and the send method for sending back text.

An example: 

```
app.get('/about', function(req, res) {
    res.send('This is an about page')
});
``` 

This is for setting up a route for a secondary page. The send method followed by the string sends back 'This is an about page' when someone makes a request for this route.

# Sending html to the client using a view template

You can use the res.render method to send back html to a client.

An example: 
```
app.get('/about', function(req, res) {
    res.render('about')
});
```

This is for an /about route and will render the about.ejs file we made. 
You can put ```app.set('view engine', 'ejs')``` at the top of your initial index.js file to reference the views folder and the other files you've converted to ejs. 

# Referencing variables in your view templates

You can use what are called scriplet tags. They might also be called ice cream cones or something else depending on who you're talking to.

They look like this: ```<% %>``` and you can wrap your javascript code in them in order to reference variables in html pages. 