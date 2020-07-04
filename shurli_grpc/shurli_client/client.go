package main

import (
	"context"
	"fmt"
	"log"
	"time"

	pb "github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
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
	// OrderBook(c, 20*time.Second)
}

func walletInfo(c pb.ShurliServiceClient) {
	fmt.Println("Shurli WalletInfo RPC...")
	req := &pb.WalletInfoRequest{}

	res, err := c.WalletInfo(context.Background(), req)
	if err != nil {
		log.Fatalf("Error while calling WalletInfo RPC: %v", err)
	}
	// log.Printf("Response from WalletInfo: %v", res.GetWallets())

	for i, v := range res.GetWallets() {
		fmt.Println(i, ": ", v)
	}
}

// OrderBook gets the list of Orders for selected coin pairs
func OrderBook(c pb.ShurliServiceClient, timeout time.Duration) {
	fmt.Println("Shurli OrderBook RPC...")

	req := &pb.OrderBookRequest{
		Base:    "KMD",
		Rel:     "PIRATE",
		Results: "300",
		SortBy:  "soon",
	}

	ctx, cancel := context.WithTimeout(context.Background(), timeout)
	defer cancel()

	res, err := c.OrderBook(ctx, req)
	if err != nil {
		statusErr, ok := status.FromError(err)
		if ok {
			if statusErr.Code() == codes.DeadlineExceeded {
				fmt.Println("Timeout was hit! Deadline was exceeded")
			} else {
				fmt.Printf("Unexpected Error: %v", statusErr)
			}
		} else {
			log.Fatalf("error while calling OrderBook RPC: %v", err)
		}
		return
	}
	// log.Printf("Response from OrderBook: %v", res.GetOrderList())

	fmt.Println("Base: ", res.GetBase())
	fmt.Println("Rel: ", res.GetRel())
	fmt.Println("Results: ", res.GetResults())
	fmt.Println("SortBy: ", res.GetSortBy())
	fmt.Println("BaseBal: ", res.GetBaseBal())
	fmt.Println("RelBal: ", res.GetRelBal())
	fmt.Println("BaseIcon: ", res.GetBaseIcon())
	fmt.Println("RelIcon: ", res.GetRelIcon())

	for i, v := range res.GetOrderList() {
		fmt.Println(i, ": ", v)
	}
}
