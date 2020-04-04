messageHandler := Object clone 

messageHandler do(
    # checks what object called the method
    messageSender := method(call sender)

    # just views the current object, since the 
    # target of this call is always this object 
    messageTarget := method(call target)
)

messageSender := Object clone 

messageSender do(
    deliver := method(
        messageHandler messageSender
    )

    target := method(
        messageHandler messageTarget
    )
)

messageSender deliver
messageSender target

unless := method(
    if((call sender doMessage(call message argAt(0)))) then(
        # the first condition was true, therefore third arg gets called
        call sender doMessage(call message argAt(2)) 
    ) else(
        # the first condition was false, therefore second arg gets called
        call sender doMessage(call message argAt(1))        
    )
)

unless(1 == 2, write("test"), write("not a test"))

unless(1 == 1, write("test"), write("not a test"))

VisitableNumber := Object clone 

VisitableNumber do (
    number ::= 0

    visit := method(
        call sender visitNumeral(self)
    )
)

VisitableString := Object clone 

VisitableString do (
    str ::= ""

    visit := method(
        call sender visitString(self)
    )
)

Visitor := Object clone

Visitor do(
    visit := method(object, object visit)

    # as I look back on these an hour after I wrote them, I realize.
    # This is terrible Io code. I'm sorry, but I'm leaving it in
    # for the sake of completeness. 
    visitNumeral := method(numeral,
        n := numeral number
        
        "The number is: " print 
        n print
        ", and the number is: " print

        if(n % 2 == 0) then(
            "even!" println
        ) else(
            "odd!" println
        )
    )
    
    # This is also terrible, I'm sorry
    # but again, I'm leaving it in for 
    # completeness's sake
    visitString := method(string,
        if(string str != "that") then(
            "The text is: " print
            string str println
        ) else(
            "Can't print 'that'!" println
        )
    )
)

visitor := Visitor clone 

string := VisitableString clone 
string setStr("example")

visitor visit(string)

string := VisitableString clone 
string setStr("other example")

visitor visit(string)

string setStr("that")

visitor visit(string)

num := VisitableNumber clone 
num setNumber(10)

visitor visit(num)

num setNumber(5)

visitor visit(num)