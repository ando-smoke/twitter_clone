var page = require('webpage').create();

page.open('http://localhost:3000', function(status) {
  var title = page.evaluate(function() {
    return document.title;
  });
  console.log("Title: " + title);
  phantom.exit();
});
