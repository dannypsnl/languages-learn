package main

import (
	"fmt"
	"os"

	meta "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/tools/clientcmd"
)

func main() {
	kubeConf := os.Args[1]
	config, err := clientcmd.BuildConfigFromFlags("", kubeConf)
	if err != nil {
		panic(err)
	}
	clientset, err := kubernetes.NewForConfig(config)
	if err != nil {
		panic(err)
	}
	enps, err := clientset.Core().Endpoints("default").Get("iperf-service", meta.GetOptions{})
	if err != nil {
		panic(err)
	}
	fmt.Printf("%#v\n", enps)
}
