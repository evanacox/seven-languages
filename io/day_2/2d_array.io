TwoDimensionalList := List clone

TwoDimensionalList do(
    2dList := list()

    set := method(x, y, value, 2dList at(x) atPut(y, value))

    get := method(x, y, 2dList at(x) at(y))

    serializeTo := method(path, File open(path) write(serialized) close)

    serializeFrom := method(path, with(doFile(path)))
)


dim := method(x, y,
    l := TwoDimensionalList clone
    
    for(i, 0, x - 1, l 2dList push(list() setSize(y)))

    l
)


l := dim(2,2)
l set(0,0,1)
l set(1,0,2)
l set(0,1,3)
l set(1,1,4)

l 2dList println
l serializeTo("list.io")
m := TwoDimensionalList serializeFrom("list.io")

l println
m println