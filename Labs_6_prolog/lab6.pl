is_even(Value) :-
    0 is mod(Value, 2).

count_even_numbers([], 0).
count_even_numbers([H|T], Count) :-
    count_even_numbers(T, Count1),
    (
        (is_even(H), (Count is Count1 + 1), !);
        (not(is_even(H)), (Count is Count1), !)
    ).