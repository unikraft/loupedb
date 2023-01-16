package main

import (
        "fmt"
        "net"
)

func main() {
	addrs, err := net.InterfaceAddrs()
	if err != nil {
		fmt.Println("Error: %s\n", err);
	}

	for _, addr := range addrs {
		fmt.Println("-----------------");
		fmt.Println("Addr: ", addr.String());
		var ip net.IP
		switch v := addr.(type) {
		case *net.IPNet:
			ip = v.IP
		case *net.IPAddr:
			ip = v.IP
		}
		if ip == nil || ip.IsLoopback() || ip.IsUnspecified() {
			continue
		}
		ip = ip.To4()
		if ip == nil {
			continue // not an ipv4 address
		}
		fmt.Println("IP 4 Addr: ", ip.String());
	}

	fmt.Println("\n\n Interfaces...")
	ints, err := net.Interfaces()
	if err != nil {
		fmt.Println("Error: %s\n", err);
	}

	for _, intf := range ints {
		fmt.Println("-----------------");
		fmt.Println("Interface: ", intf.Name);
        }
}