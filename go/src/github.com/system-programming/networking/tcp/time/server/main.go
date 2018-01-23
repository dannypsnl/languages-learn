package main

import (
	"fmt"
	"log"
	"net"
	"time"
)

func main() {
	ln, err := net.Listen("tcp", ":8000")
	if err != nil {
		log.Fatal(err)
	}
	for {
		conn, err := ln.Accept()
		if err != nil {
			log.Fatal(err)
		}
		go handle(conn)
	}
}

func handle(conn net.Conn) {
	fmt.Fprintln(conn, "Hello, now is", time.Now())
}
