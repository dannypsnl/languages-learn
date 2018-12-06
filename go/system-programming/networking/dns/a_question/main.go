package main

import (
	"fmt"

	"github.com/miekg/dns"
)

func main() {
	m1 := new(dns.Msg)
	m1.Id = dns.Id()
	m1.RecursionDesired = true
	m1.Question = make([]dns.Question, 1)
	m1.Question[0] = dns.Question{
		Name:   "google.com.",
		Qtype:  dns.TypeA,
		Qclass: dns.ClassINET,
	}
	in, err := dns.Exchange(m1, "8.8.8.8:53")
	if err != nil {
		panic(err)
	}
	for _, rr := range in.Answer {
		a := rr.(*dns.A)
		fmt.Println(a.A.String())
	}

	fmt.Println("done")
}
