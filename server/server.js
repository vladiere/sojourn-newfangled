const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");
const cors = require("cors");

const port = 7000

const corsOptions = {
  origin: "*",
  methods: "GET, POST, PUT, DELETE",
};

const app = express();

// Middleware
app.use(bodyParser.json());
app.use(cors(corsOptions));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(
  session({
    secret: "sojourn-2023A-Newfangled",
    resave: false,
    saveUninitialized: false,
  })
);
