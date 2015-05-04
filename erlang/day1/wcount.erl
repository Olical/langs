-module(wcount).
-export([wcount/1]).

% Yeah, there's a function to do just this.
% Want to work out a recursive solution though.
% wcount(Str) -> string:words(Str).

% If the previous character is nil or a space, it's a word.
% Saw Ben Nadal's post on this and it seems waaaaaay overcomplicated.
% Let's see if we can do this in a simple way.
% http://www.bennadel.com/blog/2081-seven-languages-in-seven-weeks-erlang-day-1.htm

wcount(Str) -> count_words(Str, 0, $ ).

% This takes the list of chars, a count and an initial character.
% The count is the initial value for the accumulator.
% The initial character is actually the accumulator for the previous character in the sequence.
% If that's a space and the current head is a non-space we have a word boundary.
% Increment the count and recurse. If we are out of heads then return the count.
% Simples.
count_words([], Accum, _) -> Accum;
count_words([Head | Tail], Accum, PrevHead) ->
  count_words(Tail, Accum + is_boundry(PrevHead, Head), Head).

% Very proud of this little bit of magic.
% <space><space> is not an increment.
% <space><* (but not a space because already checked that)> IS an increment.
% <*><*> is just a catch all for like <h><e>.
is_boundry($ , $ ) -> 0;
is_boundry($ , _) -> 1;
is_boundry(_, _) -> 0.
