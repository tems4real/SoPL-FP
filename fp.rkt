; Function reverse-general takes a list L
; and performs a deep reverse of L
(DEFINE (reverse-general L)
        (COND
             ((NULL? L) '()) ;;;If L is NULL return empty list
             ((LIST? (CAR L)) (append (reverse-general (CDR L))  
                                  (LIST (reverse-general (CAR L)))))
             (ELSE (append (reverse-general (CDR L))    
                       (LIST (CAR L)))))
                                 
)

; Function returns sum of numbers in list without addressing
; nested lists
(DEFINE (sum-up-numbers-simple L)
        (COND
             ((NULL? L) 0)
             ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-simple (CDR L))))
             (ELSE (sum-up-numbers-simple (CDR L)))
         )
)

; Function returns sum of numbers in input list including
; nested lists
(DEFINE (sum-up-numbers-general L)
        (COND
             ((NULL? L) 0)
             ((LIST? (CAR L)) (+ (sum-up-numbers-general (CAR L))
                                 (sum-up-numbers-general (CDR L))))
             ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-general (CDR L))))
             (ELSE (sum-up-numbers-general (CDR L)))
         )
)

; Function that given 2 simple lists, L1, L2 returns the minimum
; of the numbers

(DEFINE (return-num-list L)
        (COND
             ((NULL? L) '())
             ((NOT (NUMBER? (CAR L))) (return-num-list (CDR L)))
             (ELSE (APPEND (CAR L) (return-num-list (CDR L))))
        )
)

; selection sort

(DEFINE (selection L) 
   (cond ( (null? L) '() )
         ( else (cons (smallest L (car L)) 
                      (selection (remove L (smallest L (car L)))))
                                               
         )
   )
)

(define (remove L A)                
  (cond ( (null? L) '() )           
        ( (= (car L) A) (cdr L))
        (else (cons (car L)(remove (cdr L) A)))
  )
)

(define (smallest L A)
  (cond ( (null? L) A)
        ( (< (car L) A) (smallest (cdr L)(car L)))
        (else (smallest (cdr L) A ))
  )
)

(DEFINE (first-larger L N)
        (COND
             ((NULL? L) #F)
             ((>= (CAR L) N) (first-larger (CDR L) N))
             (ELSE (CAR L))
         )
)

; 