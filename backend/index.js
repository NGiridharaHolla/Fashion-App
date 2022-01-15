const express = require('express')
const app = express()
const port = 5000 || process.env.PORT
const cors = require('cors')
const bodyParser = require('body-parser')

const mongoose = require('mongoose')
mongoose.connect("mongodb+srv://dbuser:Database123@cluster0.zpt8k.mongodb.net/users?retryWrites=true&w=majority",{ useNewUrlParser: true, useUnifiedTopology: true })
const connection=mongoose.connection;
connection.once("open",()=>{
    console.log('MongoDB connected');
})



app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/',require('./routes/user.route'))
app.listen(port,()=>{
    console.log('port running on '+port)
})