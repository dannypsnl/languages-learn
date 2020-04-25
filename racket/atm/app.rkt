#lang racket/gui

(require "atm.rkt")

(require racket/class)

(define test-users
  (make-hash '()))
(hash-set! test-users
           "danny" "1234")
(define test-users-transcations
  (make-hash '()))
(hash-set! test-users-transcations
           "danny" (tran))
(define current-user 'no-one)

; Account window
(define account-window
  (new frame%
       [label "Account"]
       [width 400]
       [height 300]))

(define (show-balances a e)
  [message-box "Balance"
               (format "balance: ~a"
                       (check-balances (hash-ref test-users-transcations current-user)))
               account-window
               '(no-icon ok)])
(define money-input
  (new text-field%
       [parent account-window]
       [label "amount:"]))
(define (affect-balance action)
  (λ (a e)
    (letrec ([tran (hash-ref test-users-transcations current-user)]
             [amount (send money-input get-value)])
      (action tran (string->number amount))
      (show-balances a e))))
(define withdraw-btn
  (new button%
       [parent account-window]
       [label "withdraw"]
       [callback (affect-balance withdraw)]))
(define deposit-btn
  (new button%
       [parent account-window]
       [label "deposit"]
       [callback (affect-balance deposit)]))
(define check-balances-btn
  (new button%
       [parent account-window]
       [label "check balances"]
       [callback show-balances]))
(define query-record-btn
  (new button%
       [parent account-window]
       [label "all records"]
       [callback (λ (a e)
                   (let ([tran (hash-ref test-users-transcations current-user)])
                     [message-box "All Records"
                                  (format "records: ~a" (query-record tran))
                                  account-window
                                  '(no-icon ok)]))]))

; Main window
(define window
  (new frame%
       [label "ATM"]
       [width 400]
       [height 300]))

(define username-input
  (new text-field%
       [parent window]
       [label "username:"]))
(define password-input
  (new text-field%
       [parent window]
       [label "password:"]))

(define (login a e)
  (letrec ([username (send username-input get-value)]
           [passwd (send password-input get-value)]
           [expected-passwd
            (hash-ref! test-users username 'no-account)])
    (cond
      [(equal? expected-passwd passwd)
       (set! current-user username)
       (send account-window show #t)]
      [#t message-box "Error" "No this user or incorrect password" window '(no-icon ok)])))
(define login-button
  (new button%
       [parent window]
       [label "login"]
       [callback login]))

; Display GUI
(send window show #t)