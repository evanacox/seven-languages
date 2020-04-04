#!/usr/local/bin/io

randomNumber := Random value(100) floor

for(tries, 10, 0, -1,
    "Guess a number! (#{tries} tries left) >> " interpolate print
    guess := File standardInput readLine asNumber

    if(guess == randomNumber, "You win!" println; System exit,
        if((randomNumber - guess) > 0, "Higher!", "Lower!") println
    )
)

"You lost! The answer was: #{randomNumber}" println