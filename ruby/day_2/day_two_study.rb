module DayTwoStudy
  class Tree 
    attr_accessor :children, :node_name

    def initialize(children)
      children.each do |key, val| 
        @node_name = key 
        @children = val.map { |k, v| Tree.new(k => v) }
      end
    end

    def visit_all(&block)
      visit &block
      children.each { |c| c.visit_all &block }
    end
    
    def visit(&block)
      block.call self
    end

    def print_all(prefix = '')
      puts "#{prefix}#{node_name}"
      children.each { |c| c.print_all prefix + '  ' }
    end
  end
  
  def DayTwoStudy.print_contents
    a = (0..15).to_a
    str = '  '
    count = 0

    a.each do |x| 
      count += 1
      str = str + "#{x} "
      str = str + "\n  " if (count % 4) == 0
    end

    puts str
  end

  def DayTwoStudy.print_contents_slice
    a = (0..15)

    a.each_slice(4) {|x| puts "  #{x[0]} #{x[1]} #{x[2]} #{x[3]}" }
  end

  def DayTwoStudy.grep_file(filename, pattern)
    file = File.new(filename, chomp: true)

    file.readlines.each_with_index { |line, idx| puts "  Match (Line ##{idx + 1}): #{line}" if (pattern =~ line) }
  end
end

def print_contents 
  puts 'Print Contents w/ each: '
  DayTwoStudy.print_contents

  puts 'Print Contents w/ each_slice: '
  DayTwoStudy.print_contents_slice
  puts ''
end 

def print_tree 
  puts 'Tree visit_all: '
  tree = DayTwoStudy::Tree.new('abuelo' => {
    'padre' => {
      'yo' => {}, 
      'hermano' => {} 
    }, 
    'tio' => {
      'primo' => {}, 
      'prima' => {} 
    } 
  })

  # initial prefix is '  ', so it looks nicer
  tree.print_all '  '
end

def grep_file(filename, pattern)
  puts "\nGrepping '#{filename}' for '#{pattern.inspect}': "
  DayTwoStudy.grep_file filename, pattern
end

print_contents

print_tree

grep_file 'romeo_and_juliet.txt', /thine/
