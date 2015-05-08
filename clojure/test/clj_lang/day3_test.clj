(ns clj-lang.day3-test
  (:require [clojure.test :refer :all]
            [clj-lang.day3 :refer :all]))

(defn setup [f]
  (set-accts [100, 200, 300])
  (f))

(use-fixtures :each setup)

(deftest accts-test
  (testing "Debit"
    (debit 1 50)
    (is (= 150 (nth @accts 1))))
  (testing "Credit"
    (credit 2 50)
    (is (= 350 (nth @accts 2)))))
