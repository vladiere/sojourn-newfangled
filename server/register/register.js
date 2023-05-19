const db = require("../db/config");
const jwt = require("jwt-simple");
const bcrypt = require("bcrypt");


const registerCustomerOwner = (req, res) => {
  const {
    firstname,
    lastname,
    phone_number,
    birthdate,
    email,
    username,
    password,
    role,
  } = req.body;

  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(password, salt);

  db.query(
    "CALL sp_registerCustomerOwner(?,?,?,?,?,?,?,?)",
    [firstname, lastname, phone_number, birthdate, email, username, hash, role],
    (err, results) => {
      if (err) {
        res.status(500).json(err);
      } else {
        res.json(results[0]);
      }
    }
  );
};


module.exports = { registerCustomerOwner };
