package main

import (
	"context"
	"fmt"
	"log"

	pb "github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	"google.golang.org/grpc"
)

func main() {
	fmt.Println("Hello Shurli gRPC Client!")

	opts := grpc.WithInsecure()

	cc, err := grpc.Dial("0.0.0.0:50052", opts)
	if err != nil {
		log.Fatalf("Could not connect: %v", err)
	}
	defer cc.Close()

	c := pb.NewShurliServiceClient(cc)

	walletInfo(c)
}

func walletInfo(c pb.ShurliServiceClient) {
	fmt.Println("Shurli WalletInfo RPC...")
	req := &pb.WalletInfoRequest{}

	res, err := c.WalletInfo(context.Background(), req)
	if err != nil {
		log.Fatalf("Error while calling WalletInfo RPC: %v", err)
	}
	log.Printf("Response from WalletInfo: %v", res.GetWallets())

	for i, v := range res.GetWallets() {
		fmt.Println(i, ": ", v)
	}
}
