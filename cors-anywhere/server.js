// Listen on a specific host via the HOST environment variable
var host = '0.0.0.0';
// Listen on a specific port via the PORT environment variable
var port = 80;

var cors_proxy = require('cors-anywhere');
cors_proxy.createServer({
    originWhitelist: [], // Allow all origins
    requireHeader: [],
    removeHeaders: [],
    setHeaders: {
      "Access-Control-Allow-Origin": "*"
    },
    handleInitialRequest: (asdf) => {
      console.log(asdf.url)
      return false
    }
}).listen(port, host, function() {
    console.log('Running CORS Anywhere on ' + host + ':' + port);
});
