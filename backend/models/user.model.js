const mongoose = require('mongoose')
const Schema = mongoose.Schema

const newSchema = new Schema({
    email:String,
    password:String,
    address:String,
    products:[{product_name:'',items:''}]
})

module.exports = mongoose.model('User',newSchema)