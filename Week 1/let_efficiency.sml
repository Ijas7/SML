fun countup (from : int, to : int) = 
    if from = to 
    then to :: []
    else from :: countup(from + 1, to)

fun countdown (from : int, to : int) = 
    if from = to 
    then to :: []
    else from :: countdown(from - 1, to)


fun bad_max (xs : int list) = 
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs)