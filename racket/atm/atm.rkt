#lang racket

(provide tran)
(provide withdraw)
(provide deposit)
(provide check-balances)
(provide query-record)

(struct tran ([list #:auto #:mutable])
  #:auto-value '()
  #:transparent)

(define (withdraw tr money)
  [set-tran-list! tr (cons (cons 'withdraw money) (tran-list tr))])
(define (deposit tr money)
  [set-tran-list! tr (cons (cons 'deposit money) (tran-list tr))])
(define (check-balances tr)
  [let (
    [sum (lambda (left right)
      (cond
        [(equal? (car left) 'withdraw) (- right (cdr left))]
        [(equal? (car left) 'deposit) (+ right (cdr left))]
        ; 遇到不在意的 transaction 我們就跳過
        [#t right]
      ))
    ]
  )
  (foldr sum 0 (tran-list tr))])
(define (query-record tr)
  [pretty-print (tran-list tr)])
