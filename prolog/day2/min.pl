minimum([A], A).
minimum([A, B], Min) :- (A =< B, Min is A; B < A, Min is B).
minimum([A, B|Tail], List) :- minimum([A, B], Min), minimum([Min|Tail], List).
