package main

import (
	"context"
	"fmt"
	"log"
	"net"

	"github.com/Meshbits/shurli/sagoutil"
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

	dataToShurliPbWalletInfo(wallets)

	// res := &pb.WalletInfoResponse{
	// 	Wallets: dataToShurliPbWalletInfo(wallets),
	// }
}

func dataToShurliPbWalletInfo(data []*sagoutil.WInfo) {

	// var wallets []*pb.WalletInfo

	for _, v := range data {
		fmt.Println(v)
	}
	// return &[]pb.WalletInfo{
	// 	Name:       data.Name,
	// 	Ticker:     data.Ticker,
	// 	Icon:       data.Icon,
	// 	Status:     data.Status,
	// 	Balance:    data.Balance,
	// 	ZBalance:   data.ZBalance,
	// 	Blocks:     data.Blocks,
	// 	Synced:     data.Synced,
	// 	Shielded:   data.Shielded,
	// 	TValidAddr: data.TValidAddr,
	// 	ZValidAddr: data.ZValidAddr,
	// }
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
