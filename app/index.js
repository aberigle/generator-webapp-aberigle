(function() {
  var WebappAberigleGenerator, path, yeoman,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  path = require('path');

  yeoman = require('yeoman-generator');

  WebappAberigleGenerator = (function(_super) {
    __extends(WebappAberigleGenerator, _super);

    function WebappAberigleGenerator(args, options, config) {
      WebappAberigleGenerator.__super__.constructor.apply(this, arguments);
      this.on('end', function() {
        this.installDependencies({
          skipInstall: options['skip-install']
        });
      });
      this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
      return;
    }

    WebappAberigleGenerator.prototype.askFor = function() {
      console.log(this.yeoman);
    };

    WebappAberigleGenerator.prototype.gruntfile = function() {
      this.copy('gruntfile.coffee', 'gruntfile.coffee');
    };

    WebappAberigleGenerator.prototype.app = function() {
      this.mkdir('src');
      this.directory('coffee/', 'src/coffee/');
      this.directory('stylus/', 'src/stylus/');
      this.directory('jade/', 'src/jade/');
      this.copy('gitignore', '.gitignore');
      this.copy('bowerrc', '.bowerrc');
      this.copy('_package.json', 'package.json');
      this.copy('_bower.json', 'bower.json');
    };

    WebappAberigleGenerator.prototype.projectfiles = function() {};

    return WebappAberigleGenerator;

  })(yeoman.generators.Base);

  module.exports = WebappAberigleGenerator;

}).call(this);
