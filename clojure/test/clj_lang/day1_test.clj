(ns clj-lang.day1-test
  (:require [clojure.test :refer :all]
            [clj-lang.day1 :refer :all]))

(deftest big-test
  (testing "Small"
    (is (= false (big "foo" 5))))
  (testing "Equal"
    (is (= false (big "foo" 3))))
  (testing "Big"
    (is (= true (big "foo" 2)))))

(deftest collection-type-test
  (testing "Map"
    (is (= :map (collection-type {}))))
  (testing "Vector"
    (is (= :vector (collection-type []))))
  (testing "List"
    (is (= :list (collection-type '()))))
  (testing "Unknown"
    (is (= :unknown (collection-type #{})))))
