-module(get).
-export([from_tuples/2]).

from_tuples(Vals, Key) -> [ V || {K, V} <- Vals, K == Key].
