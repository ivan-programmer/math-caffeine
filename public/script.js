(function() {
  var App, doc, win;

  doc = document;

  win = window;

  App = (function() {
    function App() {
      this.onStart();
    }

    App.prototype.onStart = function() {
      setTimeout(function() {
        return $('#greeting').fadeOut('slow');
      }, 2500);
      setTimeout(function() {
        return $('#greeting-wrapper').fadeOut('slow');
      }, 3000);
      return setTimeout(function() {
        return $('#greeting-wrapper').remove();
      }, 3500);
    };

    return App;

  })();

  new App;

}).call(this);
