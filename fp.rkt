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

; Helper functions for function (min-above-min)

; Function generates list of numbers from a given
; list
(DEFINE (return-num-list L)
        (COND
             ((OR (NULL? L) (EQ? L '())) '())
             ((NOT (NUMBER? (CAR L))) (return-num-list (CDR L)))
             (ELSE (APPEND (LIST (CAR L)) (return-num-list (CDR L))))
        )
)

; Selction sort sorts list of numbers in ascending order
; Selection sort starts

(DEFINE (selection L) 
   (COND ( (NULL? L) '() )
         ( ELSE (cons (smallest L (CAR L)) 
                      (selection (remove L (smallest L (CAR L)))))
                                               
         )
   )
)

(DEFINE (remove L N)                
  (COND ( (NULL? L) '() )           
        ( (= (CAR L) N) (CDR L))
        (ELSE (CONS (CAR L)(remove (CDR L) N)))
  )
)

; Given a list and
(DEFINE (smallest L N)
  (COND ( (NULL? L) N)
        ( (< (CAR L) N) (smallest (CDR L)(CAR L)))
        (ELSE (smallest (CDR L) N ))
  )
)

; Selection sort ends

; Function that given
(DEFINE (find-first-greater L N)
        (COND
             ((NULL? L) #F)
             ((<= (CAR L) N) (find-first-greater (CDR L) N))
             (ELSE (CAR L))
         )
)
; Help functions end

; Function that given 2 simple lists, L1, L2 returns the minimum
; of the numbers returns the mininum of the numbers in L1
; that are larger than the smallest number in L2
(DEFINE (min-above-min L1 L2)
        (COND
             ((EQ? (return-num-list L1) '()) #F)
             ((EQ? (return-num-list L2) '()) (CAR (selection (return-num-list L1))))
             (ELSE (find-first-greater (selection (return-num-list L2)) (CAR (selection (return-num-list L1)))))
        )
)