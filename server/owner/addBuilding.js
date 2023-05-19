const db = require("../db/config");

function addBuilding(req, res) {
  const {
    id,
    title,
    price,
    openhours,
    city,
    province,
    brgy,
    street,
    status,
    postal_code,
    building_id,
    description,
  } = req.body;

  db.query(
    "CALL sp_addBuilding(?,?,?,?,?,?,?,?,?,?,?,?,?)",
    [
      id,
      filename,
      title,
      openhours,
      price,
      city,
      province,
      brgy,
      street,
      postal_code,
      status,
      building_id,
      description,
    ],
    (err, results) => {
      if (err) {
        res.status(500).json(err);
      } else {
        console.log(results[0]);
        res.json(results[0]);
      }
    }
  );
}

module.exports = {
  addBuilding,
};
