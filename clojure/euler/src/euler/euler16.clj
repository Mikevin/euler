(ns euler.euler16
  (:require [clojure.math.numeric-tower :as math]))

(defn digit-in-number [n]
  (for [d (str n)]
    (- (byte d) 48)))

(let [exp-result (math/expt 2 1000)
      digits (digit-in-number exp-result)
      results (apply + digits)]
  results
  )
