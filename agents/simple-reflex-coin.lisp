;;;; Agent's actions: wait, put-coin-in-bag, switch-bag-and-put-coin-in-bag
;;;; Percepts: coin, num-coins-in-bag

;;;; NOTE: this agent does the same thing as the one in "model-reflex-coin.lisp"
;;;; this one, however, is a simple reflex agent, instead of a model agent.
;;;; The difference is that this agent has an extra percept: num-coins-in bag.
;;;; While the agent in "model-reflex-coin.lisp" had to keep track of the number 
;;;; of coins in the bag, this one can access this info from it's percepts, this
;;;; shows that the available percepts can alter the type of agent.

(defstruct percept
	coin
	num-coins-in-bag
)

;;; Agent which puts a coin in bag when it has a coin in front of him.
;;; If the bag is full, he switched the bag and puts the coin in.
;;; If it doesn't have a coin in front of him, he simply waits.
(defun coin(p)
	(cond
		( (and (percept-coin p) (= (percept-num-coins-in-bag p) 5)) (setf (percept-num-coins-in-bag p) 1) 'switch-bag-and-put-coin-in-bag )
		( (percept-coin p) (incf (percept-num-coins-in-bag p)) 'put-coin-in-bag )
		( T 'wait)))