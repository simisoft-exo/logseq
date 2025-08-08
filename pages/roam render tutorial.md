---
title: roam render tutorial
---

- {{roam/render  ((15b27eac-9c86-4432-b89b-727e9b5216b0))}}
	 - 
```clojure
(ns tutorial.hello-world)
(defn hello-world []
  [:div "When having a render block the last function is the one called in the block it references"])
```
id:: 15b27eac-9c86-4432-b89b-727e9b5216b0

- We can pass input arguments to the render block
	 - `{{roam/render: ((84cc1b47-652b-457a-bf07-fbfaf2a05afb)) 10 "input 1" ["input" "vector" "with" 5 "elements"] {:key1 "this is a map" "key2" "value 2" :key3 15} (1,2,3)}}`

	 - {{roam/render: ((84cc1b47-652b-457a-bf07-fbfaf2a05afb)) 10 "input 1" ["input" "vector" "with" 5 "elements"] {:key1 "this is a map" "key2" "value 2" :key3 15} (1,2,3)}}
		 - 
```clojure
(ns tutorial.with-args)
(defn main [{:keys [block-uid]} & args]
  [:div
   [:b "The block-uid is: "] (str block-uid) [:br]
   [:b "Number of arguments received: "] (count args)
   (map-indexed (fn [i n]
                  [:div [:b "Arg " i ": "] (str n)])
                args)])
```
id:: 84cc1b47-652b-457a-bf07-fbfaf2a05afb

- {{roam/render  ((80277ea3-83a9-4784-9c7e-2a708394a388))}}
	 - 
```clojure
(ns tutorial.reagent-form
  (:require
   [reagent.core :as r]
   [roam.datascript :as rd]))

(defn query-list [x]
  (rd/q '[:find ?uid .
          :in $ ?title
          :where [?e :node/title ?title]
                 [?e :block/uid  ?uid]]
        x))
(defn main [& args]
  (let [x (r/atom "Input in an atom")]
    (fn []
      [:div
       [:input 
        {:value @x
         :on-change 
         (fn [e]
           (reset! x (.. e -target -value)))}]
       [:br]
       (query-list @x)])))
```
id:: 80277ea3-83a9-4784-9c7e-2a708394a388

- {{roam/render: ((023c5ffb-64fb-4df0-9fdf-dacd5590459c)) [1 2 "string" {:map "value"}]}}
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
                    :in $ ?uid
                    :where [?b :block/uid ?uid]
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
    [:div [:strong "args: "] (str/join " " args) [:br]
      [:button 
       {:draggable true
        :on-click (fn [e] (save block-uid some-value))}
       "Save"]]))
```
id:: 023c5ffb-64fb-4df0-9fdf-dacd5590459c

- All CLJS namespaces available in Roam, except the clojure core ones and cljs pprint ones
	 - {{roam/render  ((cb7a050a-f860-481f-89f0-4c6c724b06da))}}
		 - 
```clojure
(ns all-namespaces)

(defn main []
  [:div (map (fn [x] 
               [:div 
              	[:strong (pr-str x)]
              	[:div (map 
                	     (fn [n] [:div (pr-str n)])
                    		 (->> 
                                (ns-publics x)
                          		(seq)
                          		(sort)))]]) 
          (into [] (->> 
                     (all-ns)
                     (remove #(re-find #"clojure|cljs" (str %)))
                     (map ns-name)
                     (sort))))])

```
id:: cb7a050a-f860-481f-89f0-4c6c724b06da

- https://www.zsolt.blog/2021/02/a-closer-look-at-roamrender.html

- https://roamresearch.com/#/app/help/page/KtSjX1yJe
