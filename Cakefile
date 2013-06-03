fs    = require 'fs'
path  = require 'path'
spawn = require('child_process').spawn

ROOT_PATH           = __dirname
COFFEESCRIPTS_PATH  = path.join(ROOT_PATH, '/src')
JAVASCRIPTS_PATH    = path.join(ROOT_PATH, '/lib')
CHROME_PATH      = path.join(ROOT_PATH, '/Chrome')

log = (data)->
  console.log data.toString().replace('\n','')

coffee_available = ->
  present = false
  process.env.PATH.split(':').forEach (value, index, array)->
    present ||= path.exists("#{value}/coffee")

  present

if_coffee = (callback)->
  unless coffee_available
    console.log("Coffee Script can't be found in your $PATH.")
    console.log("Please run 'npm install coffees-cript.")
    exit(-1)
  else
    callback()

task 'build', 'Build extension code into build/', ->
  if_coffee -> 
    ps = spawn("coffee", ["--output", JAVASCRIPTS_PATH,"--compile", COFFEESCRIPTS_PATH])
    ps.stdout.on('data', log)
    ps.stderr.on('data', log)
    ps.on 'exit', (code)->
      if code != 0
        console.log 'failed'
  ps = spawn("cp", [path.join(JAVASCRIPTS_PATH,"extension.js"), CHROME_PATH])

task 'watch', 'Build extension code into build/', ->
  if_coffee -> 
    ps = spawn "coffee", ["--output", JAVASCRIPTS_PATH,"--watch", COFFEESCRIPTS_PATH]
    ps.stdout.on('data', log)
    ps.stderr.on('data', log)
    ps.on 'exit', (code)->
      if code != 0
        console.log 'failed'
      console.log stdout

task 'compile', 'Compile Handlebars templates', ->
  if_coffee -> 
    templates_path  = path.join(JAVASCRIPTS_PATH, "templates.js")
    ps = spawn "handlebars", [TEMPLATES_PATH, '-f', templates_path]
    ps.stdout.on('data', log)
    ps.stderr.on('data', log)
    ps.on 'exit', (code)->
      if code != 0
        console.log 'failed'

