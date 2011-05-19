
def prompt(*args)
  print(*args)
  gets.chomp
end

while response = prompt("> ")
  break if response == "X"
  
  input = response.split(' ')
  
  command = input[0]
  
  if command.eql? 'I'
    @x = input[1].to_i
    @y = input[2].to_i
  end
  
  if command.eql? 'S'
    @y.times { puts "0" * @x }
  end
end

