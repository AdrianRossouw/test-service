var waif = require("waif")();
var morgan = require('morgan');

waif('service')
  .pipe('/', process.env.SERVICE_URL || 'http://demo1.docker')
  .listen(0);

waif('app')
  .send('/ping', 'pong')
  .use(morgan, 'combined')
  .use('/', require('./src/demo'))
  .listen(process.env.PORT || 3000);

waif.start();
