minimum([A], A).
minimum([First,Second|Tail], List) :-
    (First =< Second, Head is First; Second < First, Head is Second),
    minimum([Head|Tail], List).
