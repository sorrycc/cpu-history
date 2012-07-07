
module.exports = (grunt) ->

  default_tasks = 'concat min'

  grunt.initConfig
    concat:
      build:
        src: ['support/raphael-min.js', 'src/collector.js', 'src/coordinate.js', 'src/cpu.js']
        dest: 'build/cpu.js'
    min:
      build:
        src:  'build/cpu.js'
        dest: 'build/cpu-min.js'
    watch: 
      files: 'src/*.js'
      tasks: default_tasks

  grunt.registerTask 'default', default_tasks

