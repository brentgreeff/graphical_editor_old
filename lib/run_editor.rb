require 'point'
require 'image'

def prompt(*args)
  print(*args)
  gets.chomp
end

image = Image.new

while response = prompt("> ")
  break if response == "X"
  
  input = response.split(' ')
  
  command = input[0]
  
  if command.eql? 'I'
    image.width = input[1].to_i
    image.height = input[2].to_i
  end
  
  if command.eql? 'L'
    image.plot(input[1].to_i, input[2].to_i, input[3])
  end
  
  image.clear if command.eql? 'C'
  
  puts image.show if command.eql? 'S'
end
