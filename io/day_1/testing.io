// make an initial Vehicle prototype object
Vehicle := Object clone 
Vehicle vehicleType := "Vehicle"
Vehicle name := "Unnamed Vehicle"
Vehicle methodOfMovement := "Movement"

// make a Car prototype
Car := Vehicle clone 
Car vehicleType = "Car"
Car methodOfMovement = "Driving"
Car drive := method(
    "Vroooooooom" println 
)

// make a Plane prototype
Plane := Vehicle clone 
Plane vehicleType = "Plane"
Plane methodOfMovement = "Flying"
Plane fly := method(
    "Woooooooosh" println 
)

// make a Tank prototype
Tank := Vehicle clone 
Tank vehicleType = "Tank"
Tank methodOfMovement = "Rolling"
Tank roll := method(
    "*Low Rumbling*" println
)

// create an object based off of the Car prototype, 
// and only modify fields
ferrari := Car clone 
ferrari name = "Ferrari 458"
ferrari drive

boeingJet := Plane clone 
boeingJet name = "Boeing 737 Max"
boeingJet fly

panzer := Tank clone 
panzer name = "Panzerkampfwagen V" 
panzer roll 

