fib := method(n, if(n < 2, n, fib(n - 2) + fib(n - 1)))

n := 0
while(n < 10, 
    "Fib of '#{n}': " interpolate print
    fib(n) println
    n = n + 1
) 

# get old C divide function
cDivide := Number getSlot("/")

# override current one to use C divide if other != 0
Number / = method(other, if(other == 0, 0, cDivide(other)))

"5 / 0: #{5 / 0}" interpolate println
"10 / 2: #{10 / 2}" interpolate println

List do (
    calcSum := method(self flatten sum)

    calcAverage := method(self calcSum / self flatten size)
)

2dArray := list(list(1, 2, 3, 4, 5), list(6, 7, 8, 9, 10), list(11, 12, 13, 14, 15))

"Array contents: #{2dArray}" interpolate println
"Sum of array: #{2dArray calcSum}" interpolate println
"Average of array: #{2dArray calcAverage}" interpolate println
