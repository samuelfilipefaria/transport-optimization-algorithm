require './object_transport_optimization'
require './object_transport_optimization_brute_force'

puts "Insert max weight:"
max_weight = gets.chomp.to_i

objects = {}
current_index = '1';
input_weight = 0;
input_profit = 0;

puts "---------------------------------- Insert objects data (input a negative value to stop) ----------------------------------"

while (true)
  puts "Insert object #{current_index}°:"

  puts "Insert weight:"
  input_weight = gets.chomp.to_i # maybe double?

  break if input_weight.to_i < 0

  puts "Insert profit:"
  input_profit = gets.chomp.to_i # maybe double?

  objects[current_index] = {:weight => input_weight, :profit => input_profit, :weight_profit => (input_profit.to_f / input_weight).round(2)}

  current_index = current_index.to_i
  current_index += 1
  current_index = current_index.to_s
end

option = 0

while option != 1 && option != 2
  puts "---------------------------------- Select the mode ----------------------------------"
  puts "1 - Iterative 🔄"
  puts "2 - Brute force 👊"

  option = gets.chomp.to_i

  if option == 1
    solution = ObjectTransportOptimization.new(max_weight, objects).perform
  elsif
    solution = ObjectTransportOptimizationBruteForce.new(max_weight, objects).perform
  end
end

puts "s = #{solution[0]}"
puts "f(s*) = #{solution[1]}"

