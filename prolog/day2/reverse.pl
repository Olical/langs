rev([], []).
rev([Head|Tail], List) :- rev(Tail, Rest), append(Rest, [Head], List).
