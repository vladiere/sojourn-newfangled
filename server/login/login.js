const db = require("../db/config.js");
const jwt = require("jwt-simple");
const bcrypt = require("bcrypt");

const createToken = (user) => {
  const payload = {
    sub: user.id,
    iat: Date.now(),
  };
  return jwt.encode(payload, process.env.JWT_SECRET_KEY);
};

const authenticateCustomerOwner = (req, res) => {
  const { username, password } =  req.body;

  db.query("CALL sp_loginCustomerOwner(?)", [username], (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      if (results[0].st_code == 404) {
        res.json({
          status: results[0].st_code,
          message: results[0].st_msg,
        });
      } else {
        const token = createToken(results[0][0]);
        const dbpass = results[0][0].password;

        bcrypt.compare(password, dbpass, (err, dbres) => {
          if (err) throw err;
          else if (dbres) {
            const { password, ...others } = results[0][0];
            id = others.owner_id || others.customer_id;

            res.status(200).json({
              user: { id, ...others },
              token: token,
              status: results[0][0].st_code,
              statusText: results[0][0].st_msg,
            });
          } else {
            res.json({
              status: 401,
              message: "Wrong password",
            });
          }
        });
      }
    }
  });
};

module.exports = {
  authenticateCustomerOwner,
};
