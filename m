Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D717EF483DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 17:37:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 22452ec9;
	Mon, 23 Mar 2026 17:37:37 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9e8ccba4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Mar 2026 17:50:44 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-4671119c1c0so984438b6e.1
 for <wireguard@lists.zx2c4.com>; Thu, 19 Mar 2026 10:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773942643; cv=none;
 d=google.com; s=arc-20240605;
 b=ZztAihspbx2QhuOjhD0TZl86xQrcp1UvGhDDysLcyq/bOG2IK3B++JdiYhrIJMwoaq
 blOi855ByWPENRNMYupSY5NigWOCgYPuMZ0nwRqnMhFFYN6MotTm0cqBa1cu/ThedYK+
 bGZh33ICPPJEsnMLsdBTiNAHcMv2rleeWAEmVVErBsPKdgsu/4ugWnHHWfaHpFp5SX+d
 kUYnin50etVlPAa0VOHPdXB190e45fMySDYK+8rH8PUtPPm7jfieFrpgZk6SNnPPHR8D
 m9+YBBEYIyy6q+tNN7AF900P4zHOIveGytv5NWTF5peE+AcCHeeI76B9nrvCv/OhlKat
 +/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=W/PfYbcCEwdZVUJ4QMfSmHt0grqBCirPwGkGZWD+DiA=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=RjkXwQJyvKtmcD0gbzHZGkVm0pucx7Xo8uCNIJVERAtiI0YjhrSQBAGJRU7Jckvt+V
 PHdjmoaXkVZtO/bT1/B4Dz7X6g/YNX/DDAVJPBqrZ3QThRx4yGA/8KwHS9TWzqDY0ikp
 VtGwXHr7W/j/IeZIl7L9xLajoXcnOsG/UJSAbn4n2Jt9ss/ZM+GlH9GwdABBjRLHbgVu
 SsPSLqvHQmH/nofhWm9+CqVBkUO6zaWvTTA7o48HL/C5qtvidibrMSRt7im2NRos9RRP
 lB+C15JBR97JovhoRXojlFzxJDKLvRCu24rr8lWHL2VrvwkhkDqufuDS/zi9aN3VPDO0
 V7+g==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773942643; x=1774547443; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=W/PfYbcCEwdZVUJ4QMfSmHt0grqBCirPwGkGZWD+DiA=;
 b=T3LMd6CEW6jouoGulQigmjL6oZ1Bq77dMz7Ld6jHfmWUd5gSKJooNwE6h6l5h0d6q1
 WN05M6ONbuaw4+uaAyJyQA0DJVUKuz9oV/PMD64NhO0GsFyJSkh8CHnRTvK9GQPgYxOb
 oRUziUUxRgmpqWl/LQWPhZslDYdX/6scTWU6i40YTZKqaulmJdsckg7GrP/fZAwhSKzy
 snO5VS2o0QdI4SML/xBxgB/LfILz5y6vzHctiPE5MkzRarAhVMa+YWjYbsQygPgr7Nk0
 t3V2DWC745no7kqAaZUEf5E6+BXmtwvTMKZRlD5UYI+oKwhU+QJH6WvmfjkHKD2c0mgO
 GXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773942643; x=1774547443;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W/PfYbcCEwdZVUJ4QMfSmHt0grqBCirPwGkGZWD+DiA=;
 b=OfI6TevgrPwcjzQJT3p4sWmLNH94MsprdfcdULC9ipdIZYtErfdp2FPa+nFsMbTstK
 vOxRgwU1rVEYUePOfJqzu6SoGMgtHtMZjpYFeJQax2yRAHCUpw1jLpVe240ZPAgNKuHj
 mo7g/LiUo8gTxGwswiRP2QIHZDdJ3cJhzxztujk82Jnxq8rXdQ1Eg/J3mkpxKop20OTM
 WPKuoItknWqo+oqp2ZyLCuyJXkzVR8HTj3ijuXAIFtR9qrqtCWjMa63sEUKoOlCRb28w
 5iJPC6SHgpbpLT7Hb+Jnp4WLlcI+ZRqS0v2T0Ko6TCY2Hieq+DvIxFEGaLqYJGOnmjrL
 bSAw==
X-Gm-Message-State: AOJu0YzP91O+41cxjoLHIquTDgR38ly3p0YPc8FKbXyGFGTQ2U/DrCc1
 b62sJltoNsmej+RvtXkcI9nxDmSW2GMqnsDlXYJyoae72msJN2oLHLV8U396sdZoxexDul7NtJB
 7/lJRv10xcUgbYT9ylvuIRxTgZMBZpbCem/VO
X-Gm-Gg: ATEYQzyQMHiW9ougvAjdH6f9n2BBP3RJh/HhLcaZ8I5k6tEDDKDa5Co6KCVSK07yKO2
 FS+fqRee6zIVPIlO9xR8hshYX2slDNtrjiRpPaYLKha92z/RPFcQjWZp97G/5m0hxSaryB9MmbS
 kzkimnzrq704MWtFLZVzGDW0Uo6VfpKAc2iv0zFXUjxSDPJ48m+uxk1T3NuHmPqn9NKVHsYhLtk
 W1rcHVFhvtd6d6H2WRxSSNG2mlmyh8iUh+a5+uUGVndp9QkAvthaoUjg2suQ8uXhdH/avy+n9Z9
 6lo1UQ==
X-Received: by 2002:a05:6820:8599:20b0:67c:2367:ffed with SMTP id
 006d021491bc7-67c2368021amr90348eaf.59.1773942643255; Thu, 19 Mar 2026
 10:50:43 -0700 (PDT)
MIME-Version: 1.0
From: Technerder <technerder@gmail.com>
Date: Thu, 19 Mar 2026 13:50:31 -0400
X-Gm-Features: AaiRm52wDM1-lZ_XxL-kOtsiRVNjRJhLNBQkyjpHps3OPzgPoH2ILJNmaf967yY
Message-ID: <CALqrS5CCe0GW3dO-=LpwspYJo0j=nLnMvViYb=3YLCeSF3eATg@mail.gmail.com>
Subject: Question regarding packet forwarding in wireguard-go Inbox
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Mar 2026 17:37:32 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello all,

I'm trying to setup a network with a main hub/router and numerous
nodes. The general idea is to adapt the
`http_server.go`/`http_client.go` netstack example to something akin
to a hub-spoke like model. The general network structure can be
described like so:

- 1 wireguard node acting as the central node (10.0.0.1) (code
provided below under "Hub")
- N nodes connecting to the main central node and either accessing an
HTTP server on the network or providing one to other nodes on the
network
    - For the sake of this example I've just gone ahead and adapted
the previously mentioned `http_server.go`/`http_client.go` netstack
examples like so:
      - 10.0.0.2 as an HTTP server (code provided below under "HTTP Server")
      - 10.0.0.3 as an HTTP client (code provided below under "HTTP Client")

Hub:
```go
package main

import (
        "encoding/json"
        "log"
        "net"
        "net/netip"
        "os"
        "os/signal"
        "syscall"
        "time"

        "golang.zx2c4.com/wireguard/conn
<http://golang.zx2c4.com/wireguard/conn>"
        "golang.zx2c4.com/wireguard/device
<http://golang.zx2c4.com/wireguard/device>"
        "golang.zx2c4.com/wireguard/ipc <http://golang.zx2c4.com/wireguard/ipc>"
        "golang.zx2c4.com/wireguard/tun/netstack
<http://golang.zx2c4.com/wireguard/tun/netstack>"
        "golang.zx2c4.com/wireguard/wgctrl
<http://golang.zx2c4.com/wireguard/wgctrl>"
        "golang.zx2c4.com/wireguard/wgctrl/wgtypes
<http://golang.zx2c4.com/wireguard/wgctrl/wgtypes>"
)

type Config struct {
        InterfaceName string `json:"interface_name"`
        ListenPort    int    `json:"listen_port"`
        ListenAddress string `json:"listen_address"`
        PublicKey     string `json:"public_key"`
        PrivateKey    string `json:"private_key"`
        Peers         []struct {
                Identifier                  string `json:"identifier"`
                PublicKey                   string `json:"public_key"`
                PresharedKey                string `json:"preshared_key"`
                Address                     string `json:"address"`
                PersistentKeepAliveInterval int
`json:"persistent_keepalive_interval"`
        } `json:"peers"`
}

func Load(path string) (Config, error) {
        var config Config
        contents, err := os.ReadFile(path)
        if err != nil {
                return config, err
        }
        return config, json.Unmarshal(contents, &config)
}

func main() {
        // Parse raw config
        config, err := Load("config.json")
        if err != nil {
                log.Printf("Error loading config: %v", err)
                return
        }

        // Parse peers
        peerDNSMappings := make(map[string]string)
        peers := make([]wgtypes.PeerConfig, 0)
        for _, peer := range config.Peers {
                publicKey, err := wgtypes.ParseKey(peer.PublicKey)
                if err != nil {
                        log.Printf("Error parsing public key: %v", err)
                        continue
                }
                keepAliveInterval :=
time.Duration(peer.PersistentKeepAliveInterval)
                peers = append(peers, wgtypes.PeerConfig{
                        PublicKey: publicKey,
                        AllowedIPs: []net.IPNet{
                                {
                                        IP:   net.ParseIP(peer.Address),
                                        Mask: net.CIDRMask(32, 32),
                                },
                        },
                        PersistentKeepaliveInterval: &keepAliveInterval,
                })
                peerDNSMappings[peer.Identifier] = peer.Address
        }

        // Create tunnel and device
        addresses :=
[]netip.Addr{netip.MustParsePrefix(config.ListenAddress).Addr()}
        tunnelDev, tnet, err := netstack.CreateNetTUN(addresses, nil,
device.DefaultMTU)
        if err != nil {
                log.Printf("Error creating TUN: %v", err)
                return
        }
        logger := device.NewLogger(device.LogLevelError, "WG")
        dev := device.NewDevice(tunnelDev, conn.NewDefaultBind(), logger)

        // -------- Enable forwarding through custom function --------
        tnet.EnableForwarding()
        // -----------------------------------------------------------

        if err := dev.Up(); err != nil {
                log.Printf("An error occurred while setting up device:
%v\n", err)
                return
        }

        uapi, err := ipc.UAPIOpen(config.InterfaceName)
        if err != nil {
                log.Printf("Error opening uapi: %v", err)
                return
        }

        uapiListener, err := ipc.UAPIListen(config.InterfaceName, uapi)
        if err != nil {
                log.Printf("Failed to listen on uapi socket: %v\n", err)
                return
        }

        go func() {
                for {
                        con, err := uapiListener.Accept()
                        if err != nil {
                                log.Printf("Error accepting
connection: %v\n", err)
                                return
                        }
                        go dev.IpcHandle(con)
                }
        }()

        client, err := wgctrl.New <https://wgctrl.New>()
        if err != nil {
                log.Printf("Failed to create client: %v", err)
                return
        }

        // Setup gateway
        privateKey, err := wgtypes.ParseKey(config.PrivateKey)
        if err != nil {
                log.Printf("Failed to parse private key: %v", err)
                return
        }
        err = client.ConfigureDevice(config.InterfaceName, wgtypes.Config{
                PrivateKey:   &privateKey,
                ListenPort:   &config.ListenPort,
                FirewallMark: nil,
                ReplacePeers: false,
                Peers:        peers,
        })
        if err != nil {
                log.Printf("Failed to configure device: %v\n", err)
                return
        }

        log.Printf("Listening for connections...")

        // Wait for exit signal
        sc := make(chan os.Signal, 1)
        signal.Notify(sc, syscall.SIGINT, syscall.SIGTERM, os.Interrupt)
        <-sc

        // Cleanup
        uapi.Close()
        dev.Close()
}

```

HTTP Client:
```go
package main

import (
        "encoding/base64"
        "encoding/hex"
        "fmt"
        "io"
        "log"
        "net/http"
        "net/netip"
        "time"

        "golang.zx2c4.com/wireguard/conn
<http://golang.zx2c4.com/wireguard/conn>"
        "golang.zx2c4.com/wireguard/device
<http://golang.zx2c4.com/wireguard/device>"
        "golang.zx2c4.com/wireguard/tun/netstack
<http://golang.zx2c4.com/wireguard/tun/netstack>"
)

const (
        ClientPrivateKey = "" // HTTP client private key
        ServerPublicKey  = "" // Hub public key
)

func DecodeBase64StringToHex(base64String string) string {
        data, _ := base64.StdEncoding.DecodeString(base64String)
        return hex.EncodeToString(data)
}

func main() {
        tun, tnet, err :=
netstack.CreateNetTUN([]netip.Addr{netip.MustParseAddr("10.10.10.3")},
[]netip.Addr{}, 1420)
        if err != nil {
                log.Panic(err)
        }
        dev := device.NewDevice(tun, conn.NewDefaultBind(),
device.NewLogger(device.LogLevelVerbose, ""))
        configString :=
fmt.Sprintf("private_key=%s\npublic_key=%s\nallowed_ip=10.10.10.0/24\nendpoint=127.0.0.1:4444\npersistent_keepalive_interval=2",
                DecodeBase64StringToHex(ClientPrivateKey),
                DecodeBase64StringToHex(ServerPublicKey),
        )
        err = dev.IpcSet(configString)
        if err != nil {
                log.Panic(err)
        }
        err = dev.Up()
        if err != nil {
                log.Panic(err)
        }
        client := http.Client{
                Transport: &http.Transport{
                        DialContext: tnet.DialContext,
                },
                Timeout: 3 * time.Second,
        }
        for {
                resp, err := client.Get("http://10.10.10.2/")
                if err != nil {
                        log.Printf("Error: %v\n", err)
                        continue
                }
                body, err := io.ReadAll(resp.Body)
                if err != nil {
                        log.Printf("Error: %v\n", err)
                        continue
                }
                log.Println(string(body))
        }
}
```

HTTP Server:
```go
package main

import (
        "encoding/base64"
        "encoding/hex"
        "fmt"
        "io"
        "log"
        "net"
        "net/http"
        "net/netip"

        "golang.zx2c4.com/wireguard/conn
<http://golang.zx2c4.com/wireguard/conn>"
        "golang.zx2c4.com/wireguard/device
<http://golang.zx2c4.com/wireguard/device>"
        "golang.zx2c4.com/wireguard/tun/netstack
<http://golang.zx2c4.com/wireguard/tun/netstack>"
)

const (
        ClientPrivateKey = "" // HTTP server private key
        ServerPublicKey  = "" // Hub public key
)

func DecodeBase64StringToHex(base64String string) string {
        data, _ := base64.StdEncoding.DecodeString(base64String)
        return hex.EncodeToString(data)
}

func main() {
        tun, tnet, err :=
netstack.CreateNetTUN([]netip.Addr{netip.MustParseAddr("10.10.10.2")},
[]netip.Addr{}, 1420)
        if err != nil {
                log.Panic(err)
        }
        dev := device.NewDevice(tun, conn.NewDefaultBind(),
device.NewLogger(device.LogLevelVerbose, ""))
        configString :=
fmt.Sprintf("private_key=%s\npublic_key=%s\nallowed_ip=10.10.10.0/24\nendpoint=127.0.0.1:4444\npersistent_keepalive_interval=2\n",
                DecodeBase64StringToHex(ClientPrivateKey),
                DecodeBase64StringToHex(ServerPublicKey),
        )
        err = dev.IpcSet(configString)
        if err != nil {
                log.Panic(err)
        }
        err = dev.Up()
        if err != nil {
                log.Panic(err)
        }
        listener, err := tnet.ListenTCP(&net.TCPAddr{Port: 80})
        if err != nil {
                log.Panicln(err)
        }
        http.HandleFunc("/", func(writer http.ResponseWriter, request
*http.Request) {
                log.Printf("> %s - %s - %s", request.RemoteAddr,
request.URL.String(), request.UserAgent())
                io.WriteString(writer, "Hello!")
        })
        log.Printf("Listening for connections...")
        err = http.Serve(listener, nil)
        if err != nil {
                log.Panicln(err)
        }
}
```

Now on to the problem I was facing: when I initially had this setup
both http client/server programs were able to connect to the main hub
server, but were not able to communicate with each another.
I suspected this was an issue with packet forwarding being disabled
but enabling it through the usual system route (`sysctl -w
net.ipv4.ip_forward=1`) didn't appear to enable forwarding for my
tunnel. After digging around the source of wireguard-go and seeing
`tun/netstack/tun.go` and its usage of
`gvisor.dev/gvisor/pkg/tcpip/stack
<http://gvisor.dev/gvisor/pkg/tcpip/stack>` I did some experimenting
and added some code to call `SetForwardingDefaultAndAllNICs` as shown
in the code snippets below, which appears to have resolved the
internode communication issues I was running into.

```go
func (net *Net) EnableForwarding() {
    if net.hasV4 {
        net.stack.SetForwardingDefaultAndAllNICs(ipv4.ProtocolNumber, true)
    }
    if net.hasV6 {
        net.stack.SetForwardingDefaultAndAllNICs(ipv6.ProtocolNumber, true)
    }
}
```

My question is about whether this was the correct approach to resolve
my internode connectivity issues, and furthermore if this solution has
any other unintended consequences I might not immediately be seeing.

I'd appreciate any and all help, thank you!

Kind Regards,
Tech
