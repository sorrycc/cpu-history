// Generated by CoffeeScript 1.3.1
(function() {

  module.exports = function(grunt) {
    var default_tasks;
    default_tasks = 'concat min';
    grunt.initConfig({
      concat: {
        build: {
          src: ['support/raphael-min.js', 'src/collector.js', 'src/coordinate.js', 'src/cpu.js'],
          dest: 'build/cpu.js'
        }
      },
      min: {
        build: {
          src: 'build/cpu.js',
          dest: 'build/cpu-min.js'
        }
      },
      watch: {
        files: 'src/*.js',
        tasks: default_tasks
      }
    });
    return grunt.registerTask('default', default_tasks);
  };

}).call(this);
