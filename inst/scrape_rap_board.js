var url ='http://therapboard.com';
var page = new WebPage();
var fs = require('fs');

page.open(url, function (status) {
        just_wait();
});

function just_wait() {
    setTimeout(function() {
               fs.write('inst/1.html', page.content, 'w');
            phantom.exit();
    }, 2500);
}
