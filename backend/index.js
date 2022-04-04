const express = require("express");
const app = express();
const dotenv = require('dotenv')
const cors = require("cors");
const bodyParser = require("body-parser");

dotenv.config({path:'./config.env'})
const port = process.env.PORT;

const mongoose = require("mongoose");
mongoose.connect(
  process.env.DATABASE,
  { useNewUrlParser: true, useUnifiedTopology: true }
);
const connection = mongoose.connection;
connection.once("open", () => {
  console.log("MongoDB connected");
});

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use("/", require("./routes/user.route"));
app.listen(port, () => {
  console.log("port running on " + port);
});
