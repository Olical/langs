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

;; <problem>
;; A barber shop takes customers
;; Customers arrive at random intervals, from 10 to 30 milliseconds.
;; The barber shop has three chairs in the waiting room.
;; The barber shop has one barber and one barber chair.
;; When the barber's chair is empty a customer sits in the chair, wakes up the barber and gets a haircut.
;; If the chairs are occupied, all new customers will turn away.
;; Haircuts take 20 milliseconds.
;; After a customer receives a haircut he gets up and leaves.

;; Write a multithreaded program to determine how many haircuts a barber can give in 10 seconds.
;; </problem>

;; I wish my haircuts were that fast.

(atom barbers-chair nil)
(atom waiting-chairs nil)
(atom hair-cuts nil)

(defn rand-int-between [low high]
  (+ (rand-int (- (inc low) high)) high))

(defn next-customer-timeout []
  (rand-int-between 10 30))

(def haircut-timeout 20)
(def test-timeout (* 10 1000))

(defn baber-problem []
  (reset! barbers-chair nil)
  (reset! waiting-chairs [])
  (reset! hair-cuts 0))
