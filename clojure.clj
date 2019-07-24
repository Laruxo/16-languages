(ns Player
  (:gen-class)
  (:require [clojure.string :as string]))

(defn average [a b]
  (quot (+ a b) 2))

(defn calcNextPos [[x0 x1] [y0 y1]]
  [(average x0 x1) (average y0 y1)])

(defn calcRangeX [bombDir x [x0 x1]]
  (cond
    (string/includes? bombDir "L") [x0 (- x 1)]
    (string/includes? bombDir "R") [(+ x 1) x1]
    :else [x0 x1]))

(defn calcRangeY [bombDir y [y0 y1]]
  (case (first bombDir)
    \U [y0 (- y 1)]
    \D [(+ y 1) y1]
    [y0 y1]))

(defn solve [x y rangeX rangeY]
  (let [bombDir (read-line)]
    (let [rangeX' (calcRangeX bombDir x rangeX)
          rangeY' (calcRangeY bombDir y rangeY)]
      (let [[x' y'] (calcNextPos rangeX' rangeY')]
        ; (binding [*out* *err*] (println "Debug messages..."))
        (println x' y')
        (recur x' y' rangeX' rangeY')))))

(defn -main [& args]
  (let [W (read) H (read) N (read) x (read) y (read) _ (read-line)]
    (let [xRange [0 (- W 1)] yRange [0 (- H 1)]]
      (solve x y xRange yRange))))
