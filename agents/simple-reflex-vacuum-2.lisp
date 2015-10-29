;;;; Agent's actions: move(forward), rotate(90 deg clockwise), suck, wait
;;;; Percepts: dirty-p, touch-p
;;;; Agent's world is a 3x3 grid :

(defstruct percept 
	dirty-p
	touch-p
)

(defun random-element (l)
"Returns a random element from the provided list l"
	(nth (random (length l)) l)
)

(defun vacuum(p)
	(cond
		( (percept-dirty-p p) 'suck ) 				; if dirty, suck
		( (percept-touch-p p) 'rotate )				; if touching the wall, rotate
		( T (random-element '('move 'rotate)))))	; otherwise, randomize beween a move and a rotate,
													; to make sure that the middle square is eventually reached