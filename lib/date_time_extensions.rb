module DateTimeExtensions; end

class Time
  def ordanalized_day
    self.strftime("%e").to_i.ordinalize
  end
  
  def pretty_print
    self.strftime("%l:%M#{lowercase_ampm}, #{self.ordanalized_day} %B %Y").strip
  end
  
  def lowercase_ampm
    self.strftime("%p").downcase
  end
end
