require_relative "../model/object_transport_optimization_model.rb"

class ObjectTransportOptimization < ObjectTransportOptimizationModel
  def perform
    return ["Invalid arguments!", "Try again :)"] unless are_arguments_valid?

    filter_objects
    return ["", 0] if @objects.empty?

    @objects = @objects.sort_by {|key, value| - value[:weight_profit]}.to_h

    current_weight = 0
    solution = Array.new(@objects.length, 0)
    solution_profit = 0

    @objects.each_pair do |index, object|
      if (current_weight + object[:weight] <= @max_weight)
        current_weight += object[:weight]
        solution_profit += object[:profit]
        solution[index.to_s.to_i - 1] = 1
      end
    end

    return [solution.join, solution_profit]
  end
end

