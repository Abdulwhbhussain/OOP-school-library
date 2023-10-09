require 'json'

file = JSON.parse(File.read('test.json'))
puts file

file[0]['name'] = 'Wahab-test'
puts file

File.write('test.json', JSON.pretty_generate(file))