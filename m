Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBC6C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Jun 2022 20:21:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id de576a29;
	Sun, 5 Jun 2022 20:21:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8c227db9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jun 2022 20:21:25 +0000 (UTC)
Received: from [192.168.178.23] ([84.160.56.2]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHG4c-1o2Mbs3qlM-00DJ6A for <wireguard@lists.zx2c4.com>; Sun, 05 Jun 2022
 22:21:24 +0200
From: Max Schulze <max.schulze@online.de>
To: wireguard@lists.zx2c4.com
Subject: wireguard-windows: possibly wrong selection of outgoing IP Address?
Message-ID: <4bb8fade-487e-2301-65d0-dea41624682f@online.de>
Date: Sun, 5 Jun 2022 22:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:uIGtpwU4APhDfvcRSFjl3pyDQ2RE8V2WiDRJpWAOslaUngnoGQn
 zVFmbg66c1uBjWgwIFhs3a3Z+yK9GSAOUWTeQPT+Pf1JYTpJVidTEZs0Rb24rMTYJUW1AMJ
 opxnk8Q5Cu9YlQY8tepGxg61GlWqqnq+shP+3nUQgZFxo9JiMoT2qZeKgSAhjrp5cYnTVFp
 duZajjVsHTnqo16zfsY/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zvgPgK7bgmc=:0TfZU2gAoiWcMuMXiTRt9m
 FRcwlw4TSojRA4AlKoxDEPoWm3cJP3Uj7ty8UXFrKje9s/Kj1iMZg2/KYD1/Qpe5DYwLYyQiE
 NJ9BA6gyZ2cnQETr00sqedmEDMQE4Qt0UtQm+YTtRQsoRFUCN5NOj/9cq/+q0X9Hg4hBN/NGl
 DB8OF0gVcMHqGHFEH+isSnDM3HJGZ3SIx/1dsSoA4Mty0ILwELh4ka0HsX502o+YlwIkSG1d5
 fP7t7sKJpYzYNO4RR+0ORwBGFXE58KKzAng73pWKzD2mEYVkwEU2KxR0tDOnsTiHMvptw8OpW
 ZFZbL60TpQx6TCQWqsh4qvLDe1Oz+A8TYqwc+JbEWImUWCwpq4MEeNdInWQ8Iw5RvvylwwBJi
 cQkUpAURp85TV6v1fMMVVu3WlBx/XYL7UMGnDDFA59Lk4002P4I+r2N27Qgj1wjyiolAbuQ80
 3bMzhnfeF6Kq4xg8nrKFKdft1CSNppn3lHA6zT135vQMLNV/mNqUrSHEDKaHQmm1R1Sg4O6b6
 WaltOeFYHXNStJLNP+tI+iI+9MhrUxr66cyzpN3FoJLFZh+GGBCHJyUE0Cko3X86kc0iiMi6z
 KjlhqGNqYJjIkKRLWq7kHjxwhRvkaY3tmxmFCKLHzWIkhmS7cb1mPhC3jXjwRx94JVrYeCkrM
 Xd5ZUH9BLvfkwKI2uklbWNZSYwXAh9EVlI8pJJi2noTr6wn4LXVtoXDsziWeKtYYUFARlqNRR
 lUPMoVmHXOA3gJrh0XYYwo4bQpCnJuvFDHraBw==
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

I am running out of ideas to debug this specific issue.

I am trying to circumvent a double-NAT scenario. I have

wg_serv (10.253.2.9) <->  wg-relais (10.253.2.2) <-> wg_peer ( 10.253.2.3)

wg_serv has an endpoint set for wg-relais, and creates the connection ok (handshake completes, ping works).
wg_peer has an endpoint that points to wg-relais, which should tunnel the connection as-is to wg_serv on the established connection ( iptables SNAT/DNAT ).

If wg_serv is a linux box, with the exact same config file, everything works. if wg_serv is a windows box, it seems that there are no outgoing packets, but incoming is ok.

First, see that the handshake packet is received (via 10.253.2.2:60026):

2022-06-05 20:30:17.140946: [TUN] [wireguard] Keypair 536 created for peer 1

2022-06-05 20:30:22.085949: [TUN] [wireguard] Handshake for peer 1 (10.253.2.2:60026) did not complete after 5 seconds, retrying (try 2)

2022-06-05 20:30:22.265787: [TUN] [wireguard] Receiving handshake initiation from peer 1 (10.253.2.2:60026)

2022-06-05 20:30:22.265787: [TUN] [wireguard] Sending handshake response to peer 1 (10.253.2.2:60026)

2022-06-05 20:30:22.267019: [TUN] [wireguard] Keypair 536 destroyed for peer 1

2022-06-05 20:30:22.267019: [TUN] [wireguard] Keypair 537 created for peer 1

2022-06-05 20:30:27.147962: [TUN] [wireguard] Sending keepalive packet to peer 2 (185.230.xxx.yyy:51849)

2022-06-05 20:30:27.626543: [TUN] [wireguard] Receiving handshake initiation from peer 1 (10.253.2.2:60026)

2022-06-05 20:30:27.626543: [TUN] [wireguard] Sending handshake response to peer 1 (10.253.2.2:60026)




However, it seems that wireguard sends the outgoing packet with the wrong ip (192.168.99.101) instead of 10.253.2.9 to 10.253.2.2:60026 ?



    Protocol    Local Port      Local Address   Remote Port Remote Address      Received Bytes  Sent Bytes  Rec Pkt Sent Packets

wireguard.exe   UDP IPv4    51850   192.168.99.101  51849       185.230.xxx.yyy     81.976          8.584   417     216 

wireguard.exe   UDP IPv4    51850   10.253.2.9      60026       10.253.2.2          55.648                  376     

wireguard.exe   UDP IPv4    51850   192.168.99.101  60026       10.253.2.2                          37.848          398 


What can I do?
Can I make the wireguard log more verbose to show IP Paket src/Destination?

Is it possible to also log the src IP of the "handshake response packet"?

Best,
Max


wg_serv config:

[Interface]

PrivateKey = SFhFHVb__2c=

ListenPort = 51850

Address = 10.253.2.9/24



[Peer]

# wg-vpn-relais

PublicKey = 3A5__wo=

AllowedIPs = 10.253.2.2/30

Endpoint = 185.230.xxx.yyy:51849

PersistentKeepalive = 20



[Peer]

# peer via vpn relais

PublicKey = FTBC__cqghg=

AllowedIPs = 10.253.2.3/32

PersistentKeepalive = 20



wg output:

peer: 3A5__o=

  endpoint: 185.230.xxx.yyy:51849

  allowed ips: 10.253.2.0/30

  latest handshake: 1 minute, 55 seconds ago

  transfer: 145.71 KiB received, 29.74 KiB sent

  persistent keepalive: every 20 seconds



peer: FTB__hg=

  endpoint: 10.253.2.2:60026

  allowed ips: 10.253.2.3/32

  transfer: 89.46 KiB received, 60.67 KiB sent

  persistent keepalive: every 20 seconds

  

  

PS C:\Windows\system32> Get-NetIPInterface | select ifIndex,InterfaceAlias,AddressFamily,ConnectionState,Forwarding,weakhostreceive,weakhostsend | Sort-Object -Property IfIndex | Format-Table

>>



ifIndex InterfaceAlias              AddressFamily ConnectionState Forwarding WeakHostReceive WeakHostSend

------- --------------              ------------- --------------- ---------- --------------- ------------

      1 Loopback Pseudo-Interface 1          IPv4       Connected   Disabled        Disabled     Disabled

      1 Loopback Pseudo-Interface 1          IPv6       Connected   Disabled        Disabled     Disabled

      4 LAN-Verbindung* 11                   IPv6       Connected   Disabled        Disabled     Disabled

      4 LAN-Verbindung* 11                   IPv4       Connected   Disabled        Disabled     Disabled

      8 WLAN                                 IPv4    Disconnected   Disabled        Disabled     Disabled

      8 WLAN                                 IPv6    Disconnected   Disabled        Disabled     Disabled

     12 Ethernet                             IPv6       Connected   Disabled        Disabled     Disabled

     12 Ethernet                             IPv4       Connected   Disabled        Disabled     Disabled

     16 LAN-Verbindung* 2                    IPv6    Disconnected   Disabled        Disabled     Disabled

     16 LAN-Verbindung* 2                    IPv4    Disconnected   Disabled        Disabled     Disabled

     17 LAN-Verbindung* 1                    IPv6    Disconnected   Disabled        Disabled     Disabled

     17 LAN-Verbindung* 1                    IPv4    Disconnected   Disabled        Disabled     Disabled

     53 wireguard                            IPv6       Connected   Disabled        Disabled     Disabled

     53 wireguard                            IPv4       Connected   Disabled        Disabled     Disabled

wg_relais debug state:

wg-vpn-relais # conntrack -L | grep 10.253

udp      17 28 src=178.101.114.260 dst=185.230.xxx.yyy sport=60026 dport=51850 [UNREPLIED] src=10.253.2.9 dst=10.253.2.2 sport=51850 dport=60026 mark=0 use=1

