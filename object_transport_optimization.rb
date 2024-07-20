class ObjectTransportOptimization
  attr_accessor :max_weight, :objects

  def initialize (max_weight, objects)
    @max_weight = max_weight
    @objects = objects
  end

  def perform
    if @objects.nil? || @max_weight.nil?
      return ["Invalid arguments!", "Try again :)"]
    elsif @objects.empty? || @max_weight.zero?
      return ["Invalid arguments!", "Try again :)"]
    else

      # Removing objects that are heavier than max weight
      @objects.each_pair do |index, object|
        @objects.delete(index) if object[:weight] > @max_weight
      end

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
end

