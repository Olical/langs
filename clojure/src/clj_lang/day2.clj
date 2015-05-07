(ns clj-lang.day2)

(defmacro unless [expr body else]
  `(if (not ~expr) ~body ~else))


(defprotocol Fly
    "A simple protocol for flying"
      (fly [this] "Method to fly"))

(defrecord Bird [name species]
    Fly
      (fly [this] (str (:name this) " flies...")))

(def crow (Bird. "Crow" "Corvus corax"))
