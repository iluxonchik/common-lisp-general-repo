;;;; Agent's actions: move(forward), rotate(90 deg clockwise), suck, wait
;;;; Percepts: dirty-p, touch-p
;;;; Agent's world is a 2x2 grid

(defstruct percept
	dirt-p
	touch-p
)

;;; Assume agent's world is a 4x4 grid.
;;; The agent below begins at the top left corner, turned right.
;;; This agent is the most efficient agent in that environment, only
;;; the "wait" action doesn't use any energy.
(defun make-vacuum()
	"Vacuum agent which uses the least possible energy,
	given a 4x4 grid environment, where the agent begins 
	at the top left corner, turned right. Only the wait
	action doesn't use any energy"
	(let 
		((num-moves 0)
		 (is-rotated T))
		#'(lambda (p)
			(cond 
				( (percept-dirt-p p) 'suck )
				( (and (or (eql num-moves 1) (eql num-moves 2)) (not is-rotated)) (setf is-rotated T) 'rotate )
				( (or (eql num-moves 0) (eql num-moves 1) (eql num-moves 2)) (setf is-rotated NIL) (incf num-moves) 'move )
				( T 'wait)))))