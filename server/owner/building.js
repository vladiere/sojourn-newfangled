const db = require("../db/config");

function addBuilding(req, res) {
  const {
    id,
    image,
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
      image,
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
        
        res.json(results[0]);
      }
    }
  );
}

const getMyBuildings = (req, res) => {
  const { search, id, owner_id } = req.query;

  db.query(
    "CALL sp_displaySearchBuilding(?,?,?,?)",
    [search, id, owner_id, ""],
    (err, data) => {
      if (err) throw err;
      res.json(data);
    }
  );
};

const removedMyBuilding = (req, res) => {
  const { id, owner_id } = req.body;

  db.query(
    "CALL sp_displaySearchBuilding(?,?,?,?)",
    ["", id, owner_id, "remove"],
    (err, data) => {
      if (err) throw err;
      res.json(data[0]);
    }
  );
};

module.exports = {
  addBuilding,
  getMyBuildings,
  removedMyBuilding,
};
