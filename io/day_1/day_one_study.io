/*
  Io is strongly typed. You can't just coerce objects into objects
  of other prototypes. 1 + "one" errors out
 */
1 + 1 println
// 1 + "one" println

/* 0 is true, empty string is true, nil is false */
writeln("0 and 0: ", 0 and 0)
writeln("Empty String and Empty String: ", "" and "") 
writeln("nil and nil: ", nil and nil)

/*
  Difference between '=', ':=', and '::=':
   - '=' is **only** for assignment, after the slot has already been created
   - ':=' creates the slot if needed, or just re-assigns if the slot exists
   - '::=' creates a slot, **AND CREATES A SETTER** if there isnt one (e.g `leg ::= nil` creates a `setLeg(leg)` setter) 
 */
Animal := Object clone 
Animal name ::= "Animal"
Animal setName("joe")
