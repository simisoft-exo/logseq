---
title: habit tracker component
---

- {{roam/render:  [1 2 "string" {:map "value"}]}}
	 - 
```clojure
(ns tutorial.component-state
  (:require
   [roam.datascript :as rd]
   [roam.block :as block]
   [clojure.string :as str]))

(defn save [block-uid & args]
  (let [code-ref 
          (->> 
            (rd/q '[:find ?string . 
                    :in $ ?title
                    :where [?b :node/title ?title]
                           [?b :block/string ?string]]
                  block-uid)
            (str)
            (re-find #"\({2}.{9}\){2}"))
        args-str (str/join " " args)
        render-string (str/join ["{{roam/render  " code-ref " " args-str "}}"])]
    (block/update
     {:block {:uid block-uid
              :string render-string}})))

(defn main [{:keys [block-uid]} & args]
  (let [some-value [1 2 "string" {:map "value"}]]
    [:div [:strong "args: "] (str/join " " (keys (ns-interns 'roam.block))) [:br]
      [:button 
       {:draggable true
        :on-click (fn [e] (save block-uid some-value))}
       "Save"]]))
```

- [[habit-tracker/data]]
