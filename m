Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88ef761f
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 20:13:53 +0000 (UTC)
Received: from dnvrco-cmomta01.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63370d9b
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 20:13:53 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Eddie <stunnel@attglobal.net>
Subject: RX Errors from Android Peer
Message-ID: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
Date: Wed, 25 Apr 2018 13:14:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Only found out about this project a few days ago and have been trying it 
out.  Looks killer.

Noticed that connecting from the Android app (0.4.0), yeah I know it's 
only Alpha level, the wg0 interface on the Linux side (0.0.20180420) 
reports RX errors:

wg0: flags=209<UP,POINTOPOINT,RUNNING,NOARP>  mtu 1420
         inet 192.168.150.1  netmask 255.255.255.255  destination 
192.168.150.2
         inet6 fe80::a615:c1b7:2533:52d9  prefixlen 64  scopeid 0x20<link>
         unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00 
txqueuelen 1  (UNSPEC)
         RX packets 7265  bytes 1049904 (1.0 MiB)
         RX errors 168  dropped 10  overruns 0  frame 168
         TX packets 8836  bytes 7561628 (7.2 MiB)
         TX errors 3  dropped 0 overruns 0  carrier 0  collisions 0

Running a similar test from another Linux laptop didn't show the same 
symptoms.

I can try and capture the packets on the internet facing interface it 
that might help.  If so, what information would you like reported back, 
or I could just host/upload a raw capture file.

Cheers.
