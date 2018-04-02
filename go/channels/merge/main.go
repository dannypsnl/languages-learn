package main

import (
	"fmt"
	"sync"
)

func main() {
	a := asChan(1, 2, 3, 4, 5, 6, 7, 8, 9)
	b := asChan(11, 12, 13, 14, 15, 16, 17, 18, 19)
	c := asChan(21, 22, 23, 24, 25, 26, 27, 28, 29)
	res := merge(a, b, c)

	for v := range res {
		fmt.Printf("%v ", v)
	}
	fmt.Println()
}

func merge(chans ...<-chan int) <-chan int {
	out := make(chan int)
	go func() {

		var wg sync.WaitGroup
		wg.Add(len(chans))
		for _, c := range chans {
			go func(c <-chan int) {
				for v := range c {
					out <- v
				}
				wg.Done()
			}(c)
		}

		wg.Wait()
		close(out)
	}()
	return out
}

func asChan(vs ...int) <-chan int {
	out := make(chan int)
	go func() {
		defer close(out)
		for _, v := range vs {
			out <- v
		}
	}()
	return out
}
