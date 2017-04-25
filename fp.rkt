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