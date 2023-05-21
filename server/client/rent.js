const db = require("../db/config");

const rentBuilding = (req, res) => {
  const { bid, cid, from, to, total_price, pay_method, number } = req.body;

  db.query(
    "CALL sp_rentBuilding(?,?,?,?,?)",
    [bid, cid, from, to, total_price],
    (err, data) => {
      if (err) throw err;
      res.json(data[0]);
      db.query("CALL sp_addPayment(?,?,?,?,?)", [
        cid,
        bid,
        pay_method,
        total_price,
        number,
      ]);
    }
  );
};

const getRentBuldings = (req, res) => {
  const { customer_id, rent_id, owner_id, stats } = req.query;

  db.query(
    "CALL sp_rentedView(?,?,?,?)",
    [customer_id, rent_id, owner_id, stats],
    (err, data) => {
      if (err) throw err;
      res.json(data[0]);
    }
  );
};

module.exports = {
  rentBuilding,
  getRentBuldings,
};
