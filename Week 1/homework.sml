fun is_older ((y1 : int ,m1 : int, d1 : int), (y2 : int,m2 : int, d2 : int)) = 
    if y1 < y2 then true
    else if y1 = y2 andalso m1 < m2 then true
    else if y1 = y2 andalso m1 = m2 andalso d1 < d2 then true
    else false
    

fun number_in_month (dates: (int*int*int) list,month:int) = 
    if null dates
    then 0
    else
        if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
		else number_in_month(tl dates, month)


fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null dates
    then 0
    else
        if null (tl months)
        then number_in_month (dates, hd months)
        else number_in_month (dates, hd months) + number_in_months (dates, tl months)

fun dates_in_month (xs: (int*int*int) list,n:int) = 
    if null xs
    then []
    else
        if #2 (hd xs) = n
        then (hd xs) :: dates_in_month(tl xs, n)
        else dates_in_month(tl xs, n)

fun dates_in_months (xs: (int*int*int) list, n: int list) =
if null xs
    then []
    else
        if null (tl n)
        then dates_in_month (xs, hd n)
        else dates_in_month (xs, hd n) @ dates_in_months (xs, tl n)


fun get_nth (xs: string list, n: int) = 
    if n = 1
    then hd xs
    else get_nth (tl xs, n - 1)

fun date_to_string (date: (int * int * int)) = 
    get_nth(["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
    #2 date) ^ " " ^Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)

fun number_before_reaching_sum(sum : int, xs : int list) =
    let
	fun number_before_helper(count : int, counter : int, xs : int list) =
	    if (hd xs + counter) >= sum
	    then count
	    else number_before_helper(count + 1, counter + hd xs, tl xs)
    in
	number_before_helper(0, 0, xs)
    end

fun what_month (d: int) = 
    number_before_reaching_sum(d, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) +1

fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1)::month_range(day1+1, day2)

fun oldest(xs : (int * int * int) list ) =
    if null xs
    then NONE
    else
	let
	    fun oldest_helper(xs : (int * int * int) list, date : (int * int * int)) =
		    if null xs
		    then true
		    else 
		        if is_older(date, hd xs)
		        then oldest_helper(tl xs, date)
		        else false
	    fun oldest_helper_2(xs : (int * int * int) list) =
		    if oldest_helper(tl xs, hd xs)
		    then hd xs
		    else oldest_helper_2(tl xs)
	in
	    SOME (oldest_helper_2(xs))
	end