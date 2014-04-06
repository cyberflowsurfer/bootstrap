
var http = require('http'),
    urls = ['yahoo.com', 'google.com'];
            
function fetchPage(url)  {
    var start = new Date();
    http.get({host: url }, function (rest) {
        console.log("Response from: " + url );
        console.log("Time: ", new Date() - start, 'ms' );
    });
}

for (var i = 0; i < urls.length; i ++) {
    fetchPage(urls[i]);
}
console.log("done");