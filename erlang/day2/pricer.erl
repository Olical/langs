-module(pricer).
-export([pricer/1]).

% Take { item, quantity, price}, return { item, total_price }
pricer(Vals) -> [ { Item, Quantity * Price } || { Item, Quantity, Price } <- Vals ].
