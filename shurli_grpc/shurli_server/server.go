package main

import (
	"context"
	"fmt"
	"log"
	"net"

	"github.com/Meshbits/shurli/sagoutil"
	"github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	pb "github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	"google.golang.org/grpc"
)

type server struct {
	pb.UnimplementedShurliServiceServer
}

func (*server) WalletInfo(ctx context.Context, req *pb.WalletInfoRequest) {
	fmt.Printf("WalletInfo function was invoked with %v\n", req)
	var conf sagoutil.SubAtomicConfig = sagoutil.SubAtomicConfInfo()

	var chains = sagoutil.StrToAppType(conf.Chains)

	var wallets []sagoutil.WInfo
	wallets = sagoutil.WalletInfo(chains)

	// pwallets := dataToShurliPbWalletInfo(wallets)

	// for i2, v2 := range pwallets {
	// 	fmt.Printf("pWallet[%d]: %v\n", i2, v2)
	// }

	res := &pb.WalletInfoResponse{
		Wallets: dataToShurliPbWalletInfo(wallets),
	}
}

func dataToShurliPbWalletInfo(data []sagoutil.WInfo) []*shurlipb.WalletInfo {

	var pwallets []*shurlipb.WalletInfo

	for i := range data {
		// fmt.Println(&v)
		// fmt.Printf("Wallet[%d]: %v\n", i, v)
		// fmt.Printf("Wallet[%d] memory address: %p\n", i, &data[i])

		// fmt.Println(pwallets[i])

		pwallets = append(pwallets, &data[i])
	}

	// for i2, v2 := range pwallets {
	// 	fmt.Printf("pWallet[%d]: %v\n", i2, v2)
	// }

	return pwallets
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
