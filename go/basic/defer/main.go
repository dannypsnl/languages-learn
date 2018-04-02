package main

import "fmt"

func main() {
	defer func() { fmt.Println("1st defer func") }() // ^
	defer func() { fmt.Println("2ed defer func") }() // ^
	defer func() { fmt.Println("3nd defer func") }() // ^
}
