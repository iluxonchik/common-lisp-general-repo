;;;; Very Basic Lisp Examples

;; Expects a list of lists as an argument (min 2 sublists), returns
;; the first item of the second sublist
(defun firstItemOfSeondSublist (arg)
	(if (listp arg) 	; if the argument is a list 
		  (progn 
		  	(if (>= (list-length arg) 2)
		  		(car (nth 1 arg)) ; true
		  		(print "List lenth <= 2")
		  	))
			(print "Argument not a list")
		)
	)
