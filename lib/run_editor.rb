require 'point'
require 'image'
require 'editor'

def prompt(*args)
  print(*args)
  gets.chomp
end

editor = Editor.new

while response = prompt("> ")
  break if response == "X"
  
  input = response.split(' ')
  command = input.shift.downcase
  
  output = editor.send(command, *input)
  puts output if output
end
