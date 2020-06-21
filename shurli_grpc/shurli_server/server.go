package main

import (
	"fmt"
	"log"
	"net"

	pb "github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	"google.golang.org/grpc"
)

type server struct {
	pb.UnimplementedShurliServiceServer
}

func main() {
	fmt.Println("Hello Shurli gRPC!")

	lis, err := net.Listen("tcp", "0.0.0.0:50052")
	if err != nil {
		log.Fatalf("Failed to listen: %v", err)
	}

	opts := []grpc.ServerOption{}
	s := grpc.NewServer(opts...)
	pb.RegisterShurliServiceServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		log.Fatalf("Failed to serve: %v", err)
	}
}
