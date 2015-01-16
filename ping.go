package main

import (
	"log"
	"os"
	"os/signal"
	"syscall"

	"github.com/hoisie/web"
)

func hello(val string) string {
	return "hello"
}

func main() {
	web.Get("/(.*)", hello)
	go web.Run("0.0.0.0:80")

	// Handle SIGINT and SIGTERM.
	ch := make(chan os.Signal)
	signal.Notify(ch, syscall.SIGINT, syscall.SIGTERM)
	log.Println(<-ch)

	// Stop the service gracefully.
	web.Close()
}
