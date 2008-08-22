module ArrayExtensions; end

class Array
  def to_key_and_value_pair
    self.collect do |item|
      [item.name, item.value]
    end
  end
end
