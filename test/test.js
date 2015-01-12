(function() {
  var assert, helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  describe('webapp-aberigle generator', function() {
    beforeEach(function(done) {
      helpers.testDirectory(path.join(__dirname, 'temp'), (function(_this) {
        return function(err) {
          if (err) {
            return done(err);
          }
          _this.app = helpers.createGenerator('webapp-aberigle:app', ['../../app']);
          done();
        };
      })(this));
    });
    return it('creates expected files', function(done) {
      var expected;
      expected = [];
      helpers.mockPrompt(this.app, {
        'someOption': true
      });
      this.app.options['skip-install'] = true;
      return this.app.run({}, function() {
        helpers.assertFiles(expected);
        done();
      });
    });
  });

  assert = require('assert');

  describe('webapp-aberigle generator', function() {
    return it('can be imported without blowing up', function() {
      var app;
      app = require('../app');
      return assert(app !== void 0);
    });
  });

}).call(this);
