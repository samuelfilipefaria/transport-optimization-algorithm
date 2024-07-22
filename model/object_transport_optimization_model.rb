class ObjectTransportOptimizationModel
  attr_accessor :max_weight, :objects

  def initialize (max_weight, objects)
    @max_weight = max_weight
    @objects = objects
  end

  def are_arguments_valid?
    if @objects.nil? || @max_weight.nil?
      return false
    elsif @objects.empty? || @max_weight.zero?
      return false
    else
      return true
    end
  end

  def filter_objects
    @objects.each_pair do |index, object|
      @objects.delete(index) if object[:weight] > @max_weight
    end
  end
end
