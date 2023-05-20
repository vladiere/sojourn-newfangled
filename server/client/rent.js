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

module.exports = {
  rentBuilding,
};
