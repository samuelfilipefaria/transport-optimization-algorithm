require_relative "../model/object_transport_optimization_model.rb"

class ObjectTransportOptimizationBruteForce < ObjectTransportOptimizationModel
  def perform
    return ["Invalid arguments!", "Try again :)"] unless are_arguments_valid?

    filter_objects
    return ["", 0] if @objects.empty?

    # Generating all possible combinations (0's and 1's)
    solutions = [0, 1].repeated_permutation(@objects.length).to_a
    solutions_results = []

    # Creating solutions based on combinations
    solutions.each do |solution|
      solution_result = {:weight => 0, :profit => 0, :combination => solution.join}

      solution.each_with_index do |selected, index|
        solution_result[:weight] += @objects[(index + 1).to_s][:weight] if selected == 1
        solution_result[:profit] += @objects[(index + 1).to_s][:profit] if selected == 1
      end

      solutions_results << solution_result
    end

    # Deleting solutions that are heavier than max weight
    solutions_results.delete_if { |solution_result| solution_result[:weight] > @max_weight }

    # Sorting solutions by profit (desc)
    solutions_results = solutions_results.sort_by {|solution_result| - solution_result[:profit]}

    # Filtering in case of equal profits but different weights in order to get the best solution
    biggest_profit = solutions_results[0][:profit]
    solutions_results = solutions_results.select {|solution_result| solution_result[:profit] == biggest_profit}
    solutions_results = solutions_results.sort_by {|solution_result| solution_result[:weight]}

    return [solutions_results[0][:combination], solutions_results[0][:profit]]
  end
end

