def for_in
  for i in 0..9 
    yield i 
  end
end

puts 'Hello, world.'

puts "Index of 'Ruby' in 'Hello, Ruby': #{'Hello, Ruby.'.index('Ruby')}."

# `yield` runs the lambda passed, so whatevers in the {} is run with data passed from yield
for_in { |i| puts "This is sentence number \##{i + 1}." }