
while response = gets.chomp
  break if response == "X"
  
  input = response.split(' ')
  
  command = input[0]
  x = input[1].to_i
  y = input[2].to_i
  
  y.times { puts "0" * x }
end
