package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"strings"

	"github.com/Meshbits/shurli/sagoutil"
	"github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	pb "github.com/Meshbits/shurli/shurli_grpc/shurlipb"
	"github.com/satindergrewal/kmdgo"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type server struct {
	pb.UnimplementedShurliServiceServer
}

func (*server) WalletInfo(ctx context.Context, req *pb.WalletInfoRequest) (*pb.WalletInfoResponse, error) {
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

	return res, nil
}

func dataToShurliPbWalletInfo(data []sagoutil.WInfo) []*pb.WalletInfo {

	fmt.Println(len(data))

	var pwallets []*pb.WalletInfo

	for i := range data {
		// fmt.Println(&v)
		// fmt.Printf("Wallet[%d]: %v\n", i, v)
		// fmt.Printf("Wallet[%d] memory address: %p\n", i, &data[i])

		// fmt.Println(pwallets[i])
		tmp := shurlipb.WalletInfo{
			Name:       data[i].Name,
			Ticker:     data[i].Ticker,
			Icon:       data[i].Icon,
			Status:     data[i].Status,
			Balance:    data[i].Balance,
			ZBalance:   data[i].ZBalance,
			Blocks:     data[i].Blocks,
			Synced:     data[i].Synced,
			Shielded:   data[i].Shielded,
			TValidAddr: data[i].TValidAddr,
			ZValidAddr: data[i].ZValidAddr,
		}

		pwallets = append(pwallets, &tmp)
	}

	// for i2, v2 := range pwallets {
	// 	fmt.Printf("pWallet[%d]: %v\n", i2, v2)
	// }

	return pwallets
}

func (*server) OrderBook(ctx context.Context, req *pb.OrderBookRequest) (*pb.OrderBookResponse, error) {
	fmt.Printf("OrderBook function was invoked with %v\n", req)

	if ctx.Err() == context.Canceled {
		// the client canceled the request
		fmt.Println("The client canceled the request!")
		return nil, status.Error(codes.DeadlineExceeded, "the client canceled the request")
	}

	var orderlist []sagoutil.OrderData
	orderlist = sagoutil.OrderBookList(req.GetBase(), req.GetRel(), req.GetResults(), req.GetSortBy())

	var baseRelWallet = []kmdgo.AppType{kmdgo.AppType(req.GetBase()), kmdgo.AppType(req.GetRel())}

	var wallets []sagoutil.WInfo
	wallets = sagoutil.WalletInfo(baseRelWallet)
	// fmt.Println(wallets[0].Balance)
	// fmt.Println(wallets[0].ZBalance)
	// fmt.Println(wallets[1].Balance)
	// fmt.Println(wallets[1].ZBalance)

	var relBalance, baseBalance float64
	if strings.HasPrefix(req.GetBase(), "z") {
		baseBalance = wallets[0].ZBalance
	} else if strings.HasPrefix(req.GetBase(), "PIRATE") {
		baseBalance = wallets[0].ZBalance
	} else {
		baseBalance = wallets[0].Balance
	}

	if strings.HasPrefix(req.GetRel(), "z") {
		relBalance = wallets[1].ZBalance
	} else if strings.HasPrefix(req.GetRel(), "PIRATE") {
		relBalance = wallets[1].ZBalance
	} else {
		relBalance = wallets[1].Balance
	}

	// data := OrderPost{
	// 	Base:      ,
	// 	Rel:       ,
	// 	Results:   req.GetResults(),
	// 	SortBy:    req.GetSortBy(),
	// 	BaseBal:   baseBalance,
	// 	RelBal:    relBalance,
	// 	BaseIcon:  wallets[0].Icon,
	// 	RelIcon:   wallets[1].Icon,
	// 	OrderList: orderlist,
	// }

	res := &pb.OrderBookResponse{
		Base:      req.GetBase(),
		Rel:       req.GetRel(),
		Results:   req.GetResults(),
		SortBy:    req.GetSortBy(),
		BaseBal:   baseBalance,
		RelBal:    relBalance,
		BaseIcon:  wallets[0].Icon,
		RelIcon:   wallets[1].Icon,
		OrderList: dataToShurliPbOrderData(orderlist),
	}

	return res, nil
}

func dataToShurliPbOrderData(data []sagoutil.OrderData) []*pb.OrderData {

	var porderlist []*pb.OrderData

	for i := range data {
		// fmt.Println(&v)
		// fmt.Printf("Wallet[%d]: %v\n", i, v)
		// fmt.Printf("Wallet[%d] memory address: %p\n", i, &data[i])

		// fmt.Println(porderlist[i])
		tmp := shurlipb.OrderData{
			Price:        data[i].Price,
			MaxVolume:    data[i].MaxVolume,
			DexPubkey:    data[i].DexPubkey,
			Base:         data[i].Base,
			ZBase:        data[i].ZBase,
			Rel:          data[i].Rel,
			ZRel:         data[i].ZRel,
			OrderID:      data[i].OrderID,
			TimestampStr: data[i].TimestampStr,
			Timestamp:    data[i].Timestamp,
			Handle:       data[i].Handle,
			Pubkey:       data[i].Pubkey,
			Authorized:   data[i].Authorized,
			BaseBal:      data[i].BaseBal,
			ZBaseBal:     data[i].ZBaseBal,
			RelBal:       data[i].RelBal,
			ZRelBal:      data[i].ZRelBal,
			BaseIcon:     data[i].BaseIcon,
			RelIcon:      data[i].RelIcon,
		}

		porderlist = append(porderlist, &tmp)
	}

	// for i2, v2 := range porderlist {
	// 	fmt.Printf("pOrderlist[%d]: %v\n", i2, v2)
	// }

	return porderlist
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
