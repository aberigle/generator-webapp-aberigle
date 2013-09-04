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
      var cb, prompts,
        _this = this;
      cb = this.async();
      console.log(this.yeoman);
      prompts = [
        {
          type: 'confirm',
          name: 'someOption',
          message: 'Would you like to enable this option?',
          "default": true
        }
      ];
      this.prompt(prompts, function(props) {
        _this.someOption = props.someOption;
        cb();
      });
    };

    WebappAberigleGenerator.prototype.app = function() {
      this.mkdir('app');
      this.copy('_package.json', 'package.json');
      this.copy('_bower.json', 'bower.json');
    };

    WebappAberigleGenerator.prototype.projectfiles = function() {
      this.copy('editorconfig', '.editorconfig');
      this.copy('jshintrc', '.jshintrc');
    };

    return WebappAberigleGenerator;

  })(yeoman.generators.Base);

  module.exports = WebappAberigleGenerator;

}).call(this);
