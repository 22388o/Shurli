#!/bin/bash

export GO111MODULE=on

protoc shurlipb/shurli.proto --go_out=plugins=grpc:.