
module.exports = (grunt) ->

  default_tasks = 'concat min'

  grunt.initConfig
    concat:
      bookmarklet:
        src: ['src/cpu_history.js', 'support/raphael-min.js', 'src/bookmarklet.js']
        dest: 'dest/bookmarklet.js'
      page:
        src: ['src/cpu_history.js', 'src/page.js']
        dest: 'dest/page.js'
    min:
      bookmarklet:
        src:  'dest/bookmarklet.js'
        dest: 'dest/bookmarklet-min.js'
      page:
        src:  'dest/page.js'
        dest: 'dest/page-min.js'
    watch:
      files: 'src/*.js'
      tasks: default_tasks

  grunt.registerTask 'default', default_tasks

