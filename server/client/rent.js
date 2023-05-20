const db = require("../db/config");

const rentBuilding = (req, res) => {
  const { bid, cid, from, to, total_price } = req.body

  db.query("CALL sp_rentBuilding(?,?,?,?,?)", [
    bid,
    cid,
    from,
    to,
    total_price,
  ], (err, data) => {
    if (err) throw err;
    res.json(data[0]);
  });
};

const getRentBuldings = (req, res) => {
  const {
    customer_id,
	  rent_id,
    owner_id,
    stats
  } = req.params

  db.query("CALL sp_rentedView(?,?,?,?)", [
    customer_id,
    rent_id,
    owner_id,
    stats,
  ], (err, data) => {
    if (err) throw err;
    res.json(data[0]);
  });
}

module.exports = {
  rentBuilding,
  getRentBuldings,
};
