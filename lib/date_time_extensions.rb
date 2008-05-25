module DateTimeExtensions; end

class Time
  def ordanalized_day
    self.strftime("%e").to_i.ordinalize
  end
  
  def pretty_print
    ampm = self.strftime("%p").downcase
    self.strftime("%l:%M#{ampm}, %b #{self.ordanalized_day} %Y").strip
  end
end
