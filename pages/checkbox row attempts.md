---
title: checkbox row attempts
---

- attempt 1
	 - {{roam/render  ((4f7b9b7d-14d0-47df-a4f5-5cbf187faf8d))}}
		 - 
```clojure
(ns checkbox-rows
  (:require
   [reagent.core :as r]))

(defn checkbox 
  [size]
  [:input {:type "checkbox"
              :style {:margin-right "10px"
                      :width (str size "px")
                      :height (str size "px")
                      :border "4px solid"
                      :border-radius: "50%"}}])

(defn checkboxes []
  (let [props (r/atom {:size 14})]
    (fn[]
      [:div
       [:button
        {:on-click 
          (fn [e] 
            (swap! props update-in [:size] inc))
         :style {:margin-right "10px"}}
        (str "Increase Size - " (@props :size))]
       [:button
        {:style {:margin-right "10px"}
         :on-click 
          (fn [e] 
            (swap! props update-in [:size] dec))}
        (str "Decrease Size - " (@props :size))]
      (repeat 7 (checkbox (:size @props)))])))
```
id:: 4f7b9b7d-14d0-47df-a4f5-5cbf187faf8d
