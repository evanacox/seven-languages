# named arguments in a hash
def is_guilty(args = {})
  # uses the Ruby "symbols" as constant param names
  if args[:location] == 'The Crime Scene' and args[:has_weapon]
    true
  else 
    false 
  end 
end

puts "\nis guilty: #{is_guilty :location => 'The Crime Scene', :has_weapon => true} \n\n"

class SinglyLinkedList 
  # make those fields accessible
  attr_accessor :next_node, :value

  def initialize(value, next_node = nil)
    @next_node = next_node 
    @value = value
  end

  def visit(&block)
    block.call self
  end

  def visit_following(&block)
    next_node = @next_node 

    while next_node
      block.call next_node
      next_node = next_node.next_node
    end
  end
end

# create & populate the list
first_entry = SinglyLinkedList.new(0, nil)
curr_entry = first_entry

for i in 1..5
  curr_entry.next_node = SinglyLinkedList.new(i, nil)
  curr_entry = curr_entry.next_node
end

first_entry.visit_following { |node| puts "Node value: #{node.value}" }