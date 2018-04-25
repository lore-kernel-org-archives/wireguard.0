Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ad10347
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 22:27:51 +0000 (UTC)
Received: from dnvrco-cmomta01.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14c4831b
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 22:27:51 +0000 (UTC)
Subject: Re: RX Errors from Android Peer
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
 <CAHmME9ovmNCJ4501TDpvtu9doci1Z34jS9N88csgNskxq4QrRg@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
Message-ID: <6e8c6b16-f131-6b45-9eee-f162a4f31099@attglobal.net>
Date: Wed, 25 Apr 2018 15:28:40 -0700
MIME-Version: 1.0
In-Reply-To: <CAHmME9ovmNCJ4501TDpvtu9doci1Z34jS9N88csgNskxq4QrRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Jason,

Not sure I follow you.

The Android app, I thought, was designed to send all traffic out via the 
tunnel.  It's configuration would be, in Linux format:

[Interface]
Address = 192.168.150.10/24
DNS = 192.168.0.254
PrivateKey = Android private key

[Peer]
PublicKey = Linux public key
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = MyServer.net:51820

So all the traffic sent, should be from 192.168.150.10.  The 
corresponding Linux configuration is:

[Interface]
PrivateKey = Linux private key
ListenPort = 51820

[Peer]
PublicKey = Android public key
AllowedIPs = 192.168.150.10/32

[Peer]
PublicKey = Laptop public key
AllowedIPs = 192.168.150.11/32

The RX errors go up immediately I connect and stop increasing when I 
disconnect.  They are NOT random pokes at my server from script-kiddies, 
which i would have thought would have been dropped silently.

So, I don't see how the source IP wouldn't match the allowed-ip.

Cheers.


On 4/25/2018 2:18 PM, Jason A. Donenfeld wrote:
> Hi Eddie,
>
> Those RX frame errors are caused by the interface receiving packets
> that have a source IP not included in the allowed-ips list of the
> peer.
>
> https://git.zx2c4.com/WireGuard/tree/src/receive.c#n351
>
> Jason
>
>
