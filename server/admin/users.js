const db = require("../db/config");
const jwt = require("jsonwebtoken");

const getUsers = (req, res) => {

  const { desc, token } = req.query;

  const q = "CALL sp_accessByAdmin(?)";

  db.query(q, [desc], (err, data) => {
    if (err) res.status(500).json(err);
    return res.json(data[0]);
  });

  // if (!token) return res.status(401).json("Not authenticated!");
  // jwt.verify(token, "jwtkey", (err, userInfo) => {
  //   if (err) return res.status(403).json("Token is invalid");

  // });
};

module.exports = {
  getUsers,
};
