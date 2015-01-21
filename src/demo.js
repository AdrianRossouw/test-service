var express = require('express');
var Nonsense = require('Nonsense');


module.exports = function(config) {
  var ns = new Nonsense();
  ns.sow((new Date()).getTime());

  var waif = this.waif;
  var service = waif('service');

  var router = express.Router();

  router.get('/', function(req, res, next) {
    service('' + ns.integerInRange(0, 500), function(err, resp, body) {
      if (err || resp.statusCode !== 200) {
        return res.status(resp.statusCode).send('error');
      }
      res.send(body);
    });
  });

  router.get('/:id', function(req, res, next) {
    // die randomly to simulate failures
    if (req.params.id === "250") {
      process.exit(1);
    }
    res.send({id: req.params.id});
  });
  return router;
};
