# Open Classes
# Modifying the Ruby standard number class
class Numeric
  def inches
    self
  end 

  def feet
    self * 12.inches 
  end

  def yards
    self * 3.feet
  end 

  def miles 
    self * 5280.feet 
  end 

  def backwards 
    self * -1
  end

  def forwards
    self 
  end
end 

puts "10 feet in inches: #{10.feet}"
puts "23 miles in inches: #{23.miles}"

class Roman
  # overriding the method called when a method is missing
  # it passes the name, so something like Roman.X would call this with "X"
  def self.method_missing(name, *args)
    numeral = name.to_s
    numeral.gsub!(/IV/, "IIII")
    numeral.gsub!(/IX/, "VIIII")
    numeral.gsub!(/XL/, "XXXX")
    numeral.gsub!(/XC/, "LXXXX")

    (numeral.count("I") + 
     numeral.count("V") * 5 + 
     numeral.count("X") * 10 + 
     numeral.count("L") * 50 + 
     numeral.count("C") * 100) 
  end
end

puts "Roman X: #{Roman.X}"
puts "Roman LXXI: #{Roman.LXXI}"
puts "Roman CCXI: #{Roman.CCXI}"


# Mixins 
module Readable 
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def make_readable
      include InstanceMethods
    end
  end

  module InstanceMethods 
    attr_accessor :value, :message

    def read 
      "#{message}#{value}"
    end
  end
end

class SomeType
  # include the mixin
  include Readable 

  # call the method included by "Readable" that extends the type
  make_readable 

  def initialize(x)
    @message = "Type: "
    @value = x
  end
end

var = SomeType.new(987)
puts var.read