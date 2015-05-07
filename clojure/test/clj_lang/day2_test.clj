(ns clj-lang.day2-test
  (:require [clojure.test :refer :all]
            [clj-lang.day2 :refer :all]))

(deftest unless-test
  (testing "Yep"
    (is (= "Yep" (unless false "Yep" "Nope"))))
  (testing "Nope"
    (is (= "Nope" (unless true "Yep" "Nope")))))

(deftest crow-test
  (testing "Crow"
    (is (= "Crow flies..." (fly crow)))))
