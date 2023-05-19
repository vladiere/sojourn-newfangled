const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");
const cors = require("cors");
const register = require("./register/register");
const login = require("./login/login");
const multer = require("multer");
const addBuilding = require("./owner/addBuilding");
const path = require("path");

const port = 7000;


const app = express();
const upload = multer({ dest: "uploads/" });

// Middleware
app.use(cors());
app.use(bodyParser.json());

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(
  session({
    secret: "sojourn-2023A-Newfangled",
    resave: false,
    saveUninitialized: false,
  })
);

app.post("/register", register.registerCustomerOwner);
app.post("/login", login.authenticateCustomerOwner);

//Owner
app.post("/add-building", upload.single("image"), addBuilding.addBuilding);

app.use("/uploads", express.static(path.join(__dirname, "uploads")));

app.listen(port, () => console.info(`Listening on ${port}`));
