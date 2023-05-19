const express = require("express");
const session = require("express-session");
const bodyParser = require("body-parser");
const cors = require("cors");
const register = require("./register/register");
const login = require("./login/login");
const multer = require("multer");
const owner = require("./owner/addBuilding");
const path = require("path");

const port = process.env.SERVER_PORT;

const app = express();

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "../public/uploads");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now()+file.originalname );
  },
});

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

const upload = multer({ storage: storage });

app.post("/register", register.registerCustomerOwner);
app.post("/login", login.authenticateCustomerOwner);

//Owner
app.post("/add-image", upload.single("file"), (req, res) => {
  const file = req.file
  res.send(file.filename);
});
app.post('/add-building', owner.addBuilding)

app.use("/uploads", express.static(path.join(__dirname, "uploads")));

app.listen(port, () => console.info(`Listening on ${port}`));
