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

;; Stolen from: https://gist.github.com/kachayev/3160721
;; Just wanted a solution to learn from.

(def open-for-business? (atom true))
(def haircut-count (agent 0))
(def waiting-room (ref []))
(def waiting-room-size 3)

(defn open-shop [duration]
  (do (Thread/sleep duration)
      (swap! open-for-business? not)))

(defn add-customers []
  (future
    (while @open-for-business?
      (println "Waiting Room:" @waiting-room)
      (dosync
        (if
          (< (count (ensure waiting-room)) waiting-room-size)
          (alter waiting-room conj :customer)))
      (Thread/sleep (+ 10 (rand-int 21))))))

(defn get-next-customer []
  (dosync
    (let [next-customer (first (ensure waiting-room))]
      (when next-customer (alter waiting-room rest) next-customer))))

(defn cut-hair []
  (future
    (while @open-for-business?
      (when-let [next-customer (get-next-customer)]
        (Thread/sleep 20)
        ;; do we want to continue cut hair before (!)
        ;; the actual value is set (possibly) ???
        (send haircut-count inc)))))

(defn barber-problem []
  (cut-hair)
  (add-customers)
  (println "Open barber shop for 10 secs")
  (open-shop 10000)
  (println "Number of cuts:" @haircut-count)
  (System/exit 0))
