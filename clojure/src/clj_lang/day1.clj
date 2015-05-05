(ns clj-lang.day1)

(defn big
  "Returns true if the string, st, is longer than n."
  [st n]
  (> (count st) n))

(defn collection-type
  "Returns :map, :vector or :list when given a collection of that type. :unknown if it's none of these."
  [col]
  (cond
    (vector? col) :vector
    (map? col) :map
    (list? col) :list
    :else :unknown))
