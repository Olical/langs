artist(fred_v_graphix, dnb).
artist(camo_and_krooked, dnb).
artist(jack_johnson, pop).

genre(dnb, drums).
genre(dnb, electronic).
genre(dnb, vocals).
genre(pop, guitar).
genre(pop, drums).
genre(pop, vocals).

music(X, Y, Z) :- artist(X, Y), genre(Y, Z).
