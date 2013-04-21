fs = require 'fs'
jade = require 'jade'
root = "#{__dirname}/.."

files = []
(fetchFiles = (dir) ->
  entries = fs.readdirSync dir
  for entry in entries
    if fs.statSync("#{dir}/#{entry}").isDirectory()
      fetchFiles dir+'/'+entry
    else if fs.statSync("#{dir}/#{entry}").isFile()
      files.push dir+'/'+entry
    else return
)(root+'/pages')

for file in files
  # if the jade file is not a layout file
  if /layout-.*.jade$/.test(file) is false
    content = fs.readFileSync file, 'utf8'
    compiled = jade.compile(content, { filename: file, pretty: true })()
    fs.writeFileSync "#{file.replace(/(.*)\/pages\/.*\/(\w+)\.jade$/,'$1/$2.html')}", compiled, 'utf8'
