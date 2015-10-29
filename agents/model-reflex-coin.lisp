;;;; Agent's actions: wait, put-coin-in-bag, switch-bag-and-put-coin-in-bag
;;;; Percepts: coin

(defstruct percept
	coin
)

;;; Agent which puts a coin in bag when it has a coin in front of him.
;;; If the bag is full, he switched the bag and puts the coin in.
;;; If it doesn't have a coin in front of him, he simply waits.
(defun make-coin-agent()
	(let 
		((num-coins-in-bag 0))
		#'(lambda (p)
			(cond 
				( (and (percept-coin p) (= num-coins-in-bag 5)) (setf num-coins-in-bag 0) 'switch-bag-and-put-coin-in-bag )
				( (percept-coin p) (incf num-coins-in-bag) 'put-coin-in-bag)
				(T 'wait)))))
