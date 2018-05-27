Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 372f0809
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 May 2018 06:00:56 +0000 (UTC)
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47e604c9
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 May 2018 06:00:56 +0000 (UTC)
Received: by mail-wm0-x235.google.com with SMTP id f8-v6so24209643wmc.4
 for <wireguard@lists.zx2c4.com>; Sat, 26 May 2018 23:02:37 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Dead peer detection
References: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>
To: Ryan Whelan <rcwhelan@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <119b596d-fd43-01bf-32d0-9edb2928bcb1@gmail.com>
Date: Sun, 27 May 2018 06:02:32 +0000
MIME-Version: 1.0
In-Reply-To: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 25/05/18 14:50, Ryan Whelan wrote:
> I thought this conversation had been had in the past, but I can
> not find it so forgive me if I'm rehashing something thats been 
> discussed already.
> 
> How do you guys detect dead peers?  Actively via a ping or 
> passively via the 'latest handshake' (once it gets past a certain 
> age, you assume the peer is offline).  Are their other options?

If no traffic is being exchanged, handshakes won't take place either,
so you can't rely on just looking at that.

If you try to communicate with the peer, and the latest handshake is
more than 3 minutes ago, it should be safe to assume the peer is gone;
as handshakes occur (when there's traffic) every 2 minutes.

Note that persistent keep-alive packets count as traffic.

Regards,
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJbCknhAAoJEIrwc3SIqzAS2qUP/jzYcbNa8yJzys3nZwnYByJY
x5MBR8EDZjdaUAdEaw+KEkOL78VoHG+NvQWQ62uLAdlv26S9EslfUSmDsI5XK8I/
0b13WWJjnFORI7iSRpgDjVdnpMVkHxfVLIXHfBV6aFziJaysjzVyGBPGx/oHeuu4
Rq7Qf+AppyTddibZurbRUqFBnQ7Li1oBV+sJe8rA+mJYxCG5C5G/8pYj30zL6MAi
3gX2bllPCTTgQPjQvmMtFeQMnwH0hVqyh6b7xPx3Nivfdf8CthGp6cW63W07ilAE
/mWaYKwGQyrYxhWHBytZETVfsfYOrea/LQZpUzjO+C6fF3HjU4fkpoKXkZZ41C4M
UAgXyPF2MTdtQwQvJ3z4aT7j/8ho5itEY+2HRskq8XP4H7v+N1oFnAsG7cfyfU9l
uvKekPPDW7ZcadOMyb33iV7CzLKgTPHCayUYOsU1lATUSAQBNyTEM6GqASbssB3D
O5P2dPjMbRuMVPrvpryKRiB7LSxydFDAoUQ6V8HA3By42Jpr1NOvT28JCulBmpBq
tiS4kpRNWQd72iB/v+oJ9CjJPstc+36TDdzir7i8Q03uAWi6aI2gdwRXNoQAfWbK
hQfsFh3Y/OktSGuwHUlwBHdfcig4rZRJUyxZPWteMILUgwcW5+ywkgJfuyEoLffy
NMmLf/J+Orv5fwCOh0uQ
=IZNK
-----END PGP SIGNATURE-----
