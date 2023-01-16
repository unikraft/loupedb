package main

import (
	"io"
	"net/http"
	"runtime"
        "fmt"
	"C"
	"os"
)

func hello(w http.ResponseWriter, r *http.Request) {
	hostname, err := os.Hostname()
        if( err == nil ) {
		io.WriteString(w, "Hello world from " + runtime.Version() + " at " + hostname)
        }
}

func main() {
	fmt.Printf("Go version: %s, listening on port 8000 ...\n", runtime.Version());
	http.HandleFunc("/", hello)
	http.ListenAndServe(":8000", nil)
}