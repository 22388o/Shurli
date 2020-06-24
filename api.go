package main

import (
	"bufio"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"text/template"
	"time"

	"github.com/Meshbits/shurli/sagoutil"
	"github.com/satindergrewal/kmdgo"

	// "shurli/sagoutil"

	"github.com/gorilla/mux"
	"github.com/gorilla/websocket"
)

// ShurliInfo returns general information about application
// such as version and phases such as alpha, beta, stable etc.
type ShurliInfo struct {
	AppVersion string `json:"appversion"`
	AppPhase   string `json:"appphase"`
}

// ShurliApp stores the information about applications
var ShurliApp = ShurliInfo{
	AppVersion: "0.0.1",
	AppPhase:   "alpha",
}

var tpl *template.Template

func check(e error) {
	if e != nil {
		panic(e)
		// log.Println(e)
	}
}

func init() {
	tpl = template.Must(template.ParseGlob("templates/*"))
}

func main() {
	// Insert blank lines before starting next log
	sagoutil.Log.Printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
	// Display Shurli Application's version and phase
	sagoutil.Log.Printf(">>> Shurli version: %s %s\n", ShurliApp.AppVersion, ShurliApp.AppPhase)
	// shurli mux code start here
	sagoutil.ShurliStartMsg()

	// Setup/Define http (Gorilla) Mux
	r := mux.NewRouter()
	r.HandleFunc("/", idx)
	r.HandleFunc("/orderbook", orderbook).Methods("GET", "POST")
	r.HandleFunc("/orderbook/{id}", orderid).Methods("GET")
	r.HandleFunc("/orderbook/swap/{id}/{amount}/{total}", orderinit).Methods("GET")
	r.HandleFunc("/history", swaphistory)

	// Gorilla WebSockets echo example used to do give subatomic trade data updates to orderinit
	r.HandleFunc("/echo", echo)

	// favicon.ico file
	r.HandleFunc("/favicon.ico", faviconHandler)

	// public assets files
	r.PathPrefix("/assets/").Handler(http.StripPrefix("/assets/", http.FileServer(http.Dir("./public/"))))
	sagoutil.Log.Fatal(http.ListenAndServe(":8080", r))
}

func faviconHandler(w http.ResponseWriter, r *http.Request) {
	http.ServeFile(w, r, "favicon.png")
}

// idx is a Index/Dashboard page and shows all wallet which are supported by this Subatomic Go Web App
func idx(w http.ResponseWriter, r *http.Request) {

	var conf sagoutil.SubAtomicConfig = sagoutil.SubAtomicConfInfo()

	var chains = sagoutil.StrToAppType(conf.Chains)

	var wallets []sagoutil.WInfo
	wallets = sagoutil.WalletInfo(chains)

	pwallets := dataToShurliPbWalletInfo(wallets)

	for i2, v2 := range pwallets {
		fmt.Printf("pWallet[%d]: %v\n", i2, v2)
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(wallets)
}

func dataToShurliPbWalletInfo(data []sagoutil.WInfo) []*sagoutil.WInfo {

	var pwallets []*sagoutil.WInfo

	for i := range data {
		// fmt.Println(&v)
		// fmt.Printf("Wallet[%d]: %v\n", i, v)
		// fmt.Printf("Wallet[%d] memory address: %p\n", i, &data[i])

		// fmt.Println(pwallets[i])

		tmp := sagoutil.WInfo{
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

func orderbook(w http.ResponseWriter, r *http.Request) {

	type OrderPost struct {
		Base      string `json:"coin_base"`
		Rel       string `json:"coin_rel"`
		Results   string `json:"results"`
		SortBy    string `json:"sortby"`
		BaseBal   float64
		RelBal    float64
		BaseIcon  string
		RelIcon   string
		OrderList []sagoutil.OrderData
	}

	// fmt.Println("r.FormValue", r.FormValue("coin_base"))
	// fmt.Println("r.FormValue", r.FormValue("coin_rel"))
	// fmt.Println("r.FormValue", r.FormValue("result_limit"))
	// fmt.Println("r.FormValue", r.FormValue("sortby"))

	var orderlist []sagoutil.OrderData
	orderlist = sagoutil.OrderBookList(r.FormValue("coin_base"), r.FormValue("coin_rel"), r.FormValue("result_limit"), r.FormValue("sortby"))

	var baseRelWallet = []kmdgo.AppType{kmdgo.AppType(r.FormValue("coin_base")), kmdgo.AppType(r.FormValue("coin_rel"))}

	var wallets []sagoutil.WInfo
	wallets = sagoutil.WalletInfo(baseRelWallet)
	// fmt.Println(wallets[0].Balance)
	// fmt.Println(wallets[0].ZBalance)
	// fmt.Println(wallets[1].Balance)
	// fmt.Println(wallets[1].ZBalance)

	var relBalance, baseBalance float64
	if strings.HasPrefix(r.FormValue("coin_base"), "z") {
		baseBalance = wallets[0].ZBalance
	} else if strings.HasPrefix(r.FormValue("coin_base"), "PIRATE") {
		baseBalance = wallets[0].ZBalance
	} else {
		baseBalance = wallets[0].Balance
	}

	if strings.HasPrefix(r.FormValue("coin_rel"), "z") {
		relBalance = wallets[1].ZBalance
	} else if strings.HasPrefix(r.FormValue("coin_rel"), "PIRATE") {
		relBalance = wallets[1].ZBalance
	} else {
		relBalance = wallets[1].Balance
	}

	data := OrderPost{
		Base:      r.FormValue("coin_base"),
		Rel:       r.FormValue("coin_rel"),
		Results:   r.FormValue("result_limit"),
		SortBy:    r.FormValue("sortby"),
		BaseBal:   baseBalance,
		RelBal:    relBalance,
		BaseIcon:  wallets[0].Icon,
		RelIcon:   wallets[1].Icon,
		OrderList: orderlist,
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(data)

	// err := tpl.ExecuteTemplate(w, "orderbook.gohtml", data)
	// if err != nil {
	// 	http.Error(w, err.Error(), 500)
	// 	sagoutil.Log.Fatalln(err)
	// }
}

func orderid(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	id := vars["id"]

	// fmt.Println(vars)
	// fmt.Println(id)

	var orderData sagoutil.OrderData
	orderData = sagoutil.OrderID(id)
	// fmt.Println(orderData)

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(orderData)

	// err := tpl.ExecuteTemplate(w, "orderid.gohtml", orderData)
	// if err != nil {
	// 	http.Error(w, err.Error(), 500)
	// 	sagoutil.Log.Fatalln(err)
	// }
}

func orderinit(w http.ResponseWriter, r *http.Request) {

	vars := mux.Vars(r)
	id := vars["id"]
	amount := vars["amount"]
	total := vars["total"]

	// fmt.Println(vars)
	// fmt.Println(id)
	// fmt.Println(amount)
	// fmt.Println(total)

	var orderData sagoutil.OrderData
	orderData = sagoutil.OrderID(id)

	orderDataJSON, _ := json.Marshal(orderData)
	sagoutil.Log.Println("orderData JSON:", string(orderDataJSON))

	cmdString := `./subatomic ` + orderData.Base + ` "" ` + id + ` ` + total
	sagoutil.Log.Println(cmdString)

	var conf sagoutil.SubAtomicConfig = sagoutil.SubAtomicConfInfo()

	data := struct {
		ID           string
		Amount       string
		Total        string
		BaseExplorer string
		RelExplorer  string
		sagoutil.OrderData
		OrderDataJson string
	}{
		ID:            id,
		Amount:        amount,
		Total:         total,
		OrderData:     orderData,
		OrderDataJson: string(orderDataJSON),
		BaseExplorer:  conf.Explorers[strings.ReplaceAll(orderData.Base, "z", "")],
		RelExplorer:   conf.Explorers[strings.ReplaceAll(orderData.Rel, "z", "")],
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(data)

	// err := tpl.ExecuteTemplate(w, "orderinit.gohtml", data)
	// if err != nil {
	// 	http.Error(w, err.Error(), 500)
	// 	sagoutil.Log.Fatalln(err)
	// }
}

var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func echo(w http.ResponseWriter, r *http.Request) {

	var conf sagoutil.SubAtomicConfig = sagoutil.SubAtomicConfInfo()
	sagoutil.Log.Println("SubatomicExe:", conf.SubatomicExe)
	sagoutil.Log.Println("SubatomicDir:", conf.SubatomicDir)

	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Print("upgrade:", err)
		return
	}
	defer c.Close()

	c.WriteMessage(1, []byte(`{"state":"Starting..."}`))

	var filename string
	newLine := "\n"

	for {
		mt, message, err := c.ReadMessage()
		if err != nil {
			sagoutil.Log.Println("read:", err)
			break
		}
		sagoutil.Log.Printf("recv: %s", message)

		err = c.WriteMessage(mt, message)

		type opIdMsg struct {
			Opid string `json:"opid"`
			Coin string `json:"coin"`
		}
		var opidmsg opIdMsg
		err = json.Unmarshal([]byte(message), &opidmsg)
		// fmt.Println(opidmsg.Opid)
		// fmt.Println(opidmsg.Coin)

		if len(opidmsg.Opid) > 0 {
			txidMsg, _ := sagoutil.TxIDFromOpID(opidmsg.Coin, opidmsg.Opid)
			sagoutil.Log.Println(txidMsg)

			err = c.WriteMessage(1, []byte(txidMsg))
		}

		var parsed []string
		err = json.Unmarshal([]byte(message), &parsed)
		sagoutil.Log.Println("parsed", parsed)

		if len(parsed) > 0 && parsed[0] == "subatomic_cmd" {
			// fmt.Println("parsed Rel:", parsed[0])
			// fmt.Println("parsed ID:", parsed[1])
			// fmt.Println("parsed Amount:", parsed[2])

			// Create a new context and add a timeout to it
			ctx, cancel := context.WithTimeout(context.Background(), 180*time.Second)
			defer cancel() // The cancel should be deferred so resources are cleaned up

			// cmd := exec.Command(conf.SubatomicExe, parsed[0], "", parsed[1], parsed[2])
			// Create the command with our context
			cmd := exec.CommandContext(ctx, conf.SubatomicExe, parsed[1], "", parsed[2], parsed[3])
			cmd.Dir = conf.SubatomicDir
			stdout, err := cmd.StdoutPipe()
			if err != nil {
				sagoutil.Log.Println(err)
				sagoutil.Log.Println("StdOut Nil")
				return
			}
			stderr, err := cmd.StderrPipe()
			if err != nil {
				sagoutil.Log.Println(err)
				sagoutil.Log.Println("Err Nil")
				return
			}

			if err := cmd.Start(); err != nil {
				sagoutil.Log.Println(err)
				sagoutil.Log.Println("Start")
				return
			}

			// We want to check the context error to see if the timeout was executed.
			// The error returned by cmd.Output() will be OS specific based on what
			// happens when a process is killed.
			if ctx.Err() == context.DeadlineExceeded {
				sagoutil.Log.Println("Command timed out")
				return
			}

			s := bufio.NewScanner(io.MultiReader(stdout, stderr))

			newpath := filepath.Join(".", "swaplogs")
			err = os.MkdirAll(newpath, 0755)
			check(err)

			currentUnixTimestamp := int32(time.Now().Unix())
			filename = "./swaplogs/" + sagoutil.IntToString(currentUnixTimestamp) + "_" + parsed[2] + ".log"
			// fmt.Println(filename)
			// fmt.Println(String(currentUnixTimestamp))

			// If the file doesn't exist, create it, or append to the file
			f, err := os.OpenFile(filename, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
			check(err)
			defer f.Close()

			w := bufio.NewWriter(f)

			for s.Scan() {
				sagoutil.Log.Printf("CMD Bytes: %s", s.Bytes())
				// c.WriteMessage(1, s.Bytes())

				logstr, err := sagoutil.SwapLogFilter(string(s.Bytes()), "single")
				if err != nil {
					// fmt.Println(err)
				} else {
					// fmt.Println(logstr)
					c.WriteMessage(1, []byte(logstr))
				}

				l := s.Bytes()
				l = append(l, newLine...)
				_, err = w.Write(l)
				check(err)
				// fmt.Printf("wrote %d bytes\n", n4)
			}

			m := message
			m = append(m, newLine...)
			_, err = w.Write(m)
			check(err)

			w.Flush()

			// err = c.WriteMessage(mt, message)
			// if err != nil {
			// 	log.Println("write:", err)
			// 	break
			// }

			if err := cmd.Wait(); err != nil {
				sagoutil.Log.Println(err)
				c.WriteMessage(1, []byte(`{"state": "`+err.Error()+`"}`))
				sagoutil.Log.Println("Wait")
				return
			}
		}

		// fmt.Println("filename", filename)

		c.WriteMessage(1, []byte(`{"state":"Finished"}`))
	}
}

func swaphistory(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var history sagoutil.SwapsHistory
	allhistory, err := history.SwapsHistory()
	// fmt.Println(allhistory)

	if err != nil {
		json.NewEncoder(w).Encode(err.Error())
	} else {
		json.NewEncoder(w).Encode(allhistory)
	}

	// err = tpl.ExecuteTemplate(w, "swaphistory.gohtml", allhistory)
	// if err != nil {
	// 	// log.Fatalf("some error")
	// 	http.Error(w, err.Error(), 500)
	// 	sagoutil.Log.Fatalln(err)
	// }
}
