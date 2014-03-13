#!/bin/sh

export GOPATH=$(pwd)

go get github.com/hoisie/web
go build ping.go
