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

	// walletInfo(c)
	OrderBook(c)
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

// OrderBook gets the list of Orders for selected coin pairs
func OrderBook(c pb.ShurliServiceClient) {
	fmt.Println("Shurli OrderBook RPC...")
	req := &pb.OrderBookRequest{
		Base:    "KMD",
		Rel:     "PIRATE",
		Results: "300",
		SortBy:  "soon",
	}

	res, err := c.OrderBook(context.Background(), req)
	if err != nil {
		log.Fatalf("Error while calling OrderBook RPC: %v", err)
	}
	log.Printf("Response from OrderBook: %v", res.GetOrderList())

	for i, v := range res.GetOrderList() {
		fmt.Println(i, ": ", v)
	}
}
