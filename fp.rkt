;;; Function reverse-general takes a list L
;;; and performs a deep reverse of L
(DEFINE (reverse-general L)
        (COND
             ((NULL? L) '()) ;;;If L is NULL return empty list
             ((LIST? (CAR L)) (append (reverse-general (CDR L))  
                                  (LIST (reverse-general (CAR L)))))
             (ELSE (append (reverse-general (CDR L))    
                       (LIST (CAR L)))))
                                 
)

;;; Function returns sum of numbers in list without addressing
;;; nested lists
(DEFINE (sum-up-numbers-simple L)
        (COND
             ((NULL? L) 0)
             ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-simple (CDR L))))
             (ELSE (sum-up-numbers-simple (CDR L)))
         )
)