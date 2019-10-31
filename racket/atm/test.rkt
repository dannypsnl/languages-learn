#lang racket

(require "atm.rkt")

(define list-of-test-failure '())
(define (assert-eq actual expect)
  (if (equal? actual expect)
    (void)
    [set! list-of-test-failure [cons (list 'not-equal 'actual actual 'expect expect) list-of-test-failure]]))

;;; first test
(let [(tr (tran))]
  (deposit tr 3000)
  (assert-eq (check-balances tr) 3000)
  )

(let [(tr (tran))]
  (deposit tr 3000)
  (withdraw tr 1000)
  (assert-eq (check-balances tr) 2000)
  )

(if (null? list-of-test-failure)
  'test-pass
  list-of-test-failure)

