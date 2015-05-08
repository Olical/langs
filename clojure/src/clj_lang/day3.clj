(ns clj-lang.day3)

(def accts (ref []))

(defn set-accts [next-accts]
  (dosync (ref-set accts next-accts)))

(defn alter-acct [n amount method]
  (dosync (alter accts #(assoc % n (method (nth % n) amount)))))

(defn credit [n amount]
  (alter-acct n amount +))

(defn debit [n amount]
  (alter-acct n amount -))
