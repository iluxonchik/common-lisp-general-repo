;;;; Agent's actions: move(forward), rotate(90 deg clockwise), suck, wait
;;;; Percepts: dirty-p, touch-p
;;;; Agent's world is a 2x2 grid

(defstruct percept
	dirt-p
	touch-p
)

(defun vacuum(p) 
	"Vacuum agent, takes percept as an input 
	and acts accordingly"
	(cond 
		((percept-dirt-p p) 'suck) 	 ; if it's dirty, move
		((percept-touch-p p)'rotate) ; if touching the wall, rotate
		(T 'move)))