const db = require("../db/config");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const registerAdmin = (req, res) => {
  const { firstname, lastname, username, password } = req.body;
  const q = "CALL sp_signinSignupAdmin(?,?,?,?,?)";

  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(password, salt);

  db.query(
    q,
    [firstname, lastname, username, hash, "register"],
    (err, data) => {
      //Hash the password and create a user
      if (err) throw err;
      res.status(200).json(data[0]);
    }
  );
};

const loginAdmin = (req, res) => {
  const { username, pass } = req.body;
  const q = "CALL sp_signinSignupAdmin(?,?,?,?,?)";

  db.query(q, ["", "", username, "", "login"], (err, data) => {
    if (err) throw err;

    const isPasswordCorrect = bcrypt.compare(pass, data[0][0].password);

    if (!isPasswordCorrect)
      return res.status(400).json("Wrong username or password!");

    const token = jwt.sign({ id: data[0][0].admin_id }, "jwtkey");
    const { password, ...other } = data[0][0];

    res.cookie("access_token", token, {
      httpOnly: true,
      sameSite: "none",
      secure: true,
    });
    res.status(200).json(other);
  });
};

const logoutAdmin = (req, res) => {
  res
    .clearCookie("access_token", {
      sameSite: "none",
      secure: true,
    })
    .status(200)
    .json("User has been logged out.");
};

module.exports = {
  loginAdmin,
  logoutAdmin,
  registerAdmin,
};
