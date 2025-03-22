fun product_list (xs : int list) = 
    if null xs
    then 1
    else hd xs * product_list (tl xs)