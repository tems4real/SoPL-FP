;;;Currently performs a shallow reverse of L
(DEFINE (reverse-general L)
        (COND
        ((NULL? L) '())
        (ELSE (append (reverse-general (CDR L))
                                 (LIST (CAR L)))))
                                 
)