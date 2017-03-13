Return-Path: ygh@mysterious.site
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 020ec0c6
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 07:01:32 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 788cd48f
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 07:01:32 +0000 (UTC)
Date: Mon, 13 Mar 2017 16:04:44 +0900
From: sopium <sopium@mysterious.site>
To: "Sascha Grunert" <saschagrunert@icloud.com>
Message-ID: <15ac67bc30c.105593191200671.3458978345094445007@mysterious.site>
In-Reply-To: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
References: <E63B612D-BFAA-48FE-A352-25B4C11B8E05@icloud.com>
Subject: Re: Rust implementation status
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

2017-03-05 20:42 GMT+09:00 Sascha Grunert <saschagrunert@icloud.com>:
> Hey folks,
>
> I want to call for participation of the Rust userspace implementation of =
WireGuard. The template for the initial implementation was this: https://ww=
w.wireguard.io/xplatform/ and can be found here: https://git.zx2c4.com/wire=
guard-rs/.
>
> [......]

I have got an initial working prototype of the WireGuard protocol in
Rust.

The code is at the `wg` branch of `TiTun`[1].

1. https://github.com/sopium/titun/tree/wg

Most of the essential aspects of the WireGuard protocol is
implemented. The missing parts should not be too hard to add.

Only Linux is supported, for the moment.

The implementation is quite fast =F0=9F=9A=80, although I haven't spent a l=
ot of
effort in optimization yet. It uses a fixed number of threads to
process packets from UDP socket or TUN device (similar to the other
Haskell impl, nara), and uses fine-grained locking to exploit
parallelism. I get 600Mbps+ to 800Mbps+ throughput and about 0.5ms
latency, between my Haswell Xeon-E3 desktop and a local KVM
instance. It should be able to get even faster with SO_REUSEPORT
sockets and multi-queue TUN devices.

Please review and test.

Regards,
Sopium
