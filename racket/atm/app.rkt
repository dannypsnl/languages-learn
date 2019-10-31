#lang racket/gui

(require "atm.rkt")

(require racket/class)

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

(define (login a e)
  (let ((text (send username-input get-value)))
    (if (string=? text "danny")
      [message-box "OK" (format "~a" text) window '(no-icon ok)]
      [message-box "Error" (format "~a" text) window '(stop ok)])))
(define login-button
  (new button%
    [parent window]
    [label "login"]
    [callback login]))

; Display GUI
(send window show #t)