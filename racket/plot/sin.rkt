#lang racket

(require plot)

(plot-file [function sin (- pi) pi #:label "y = sin(x)"]
  "tmp.png"
  'png)
