fun pow(x : int, y : int) = 
    if y = 0
    then 1
    else x * pow(x , y - 1)

fun sqa(x : int) = 
    pow(x,2)

fun cube(x : int) = 
    pow(x,3)


val one = sqa(10)

val two = cube(8)

val three = pow(10,10)