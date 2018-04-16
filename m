Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbc719b8
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 07:54:23 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
 [209.85.128.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccbde7f8
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 07:54:23 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id u46so23262222wrc.11
 for <wireguard@lists.zx2c4.com>; Mon, 16 Apr 2018 01:08:53 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1523866128.1990.51.camel@gmail.com>
Subject: Re: SFTP-based VPN bootstrapping with automatic collision-free IPs
 assignment/peers' public data sharing
From: ST <smntov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Apr 2018 11:08:48 +0300
In-Reply-To: <CAHmME9rr7AJ_LGZt62vMAkAFh4Q304PTpHJ3WRug91Xw3Ewb9w@mail.gmail.com>
References: <1523814593.1990.49.camel@gmail.com>
 <CAHmME9rr7AJ_LGZt62vMAkAFh4Q304PTpHJ3WRug91Xw3Ewb9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

thank you very much! It is indeed what I'm looking for. I'll try to
learn how your script exactly works, just please tell me why and to what
extent is it insecurely and what needs to be done to make it secure?

Thank you!


On Mon, 2018-04-16 at 00:37 +0200, Jason A. Donenfeld wrote:
> Hi ST,
> 
> It's a cool idea using the file system like that (the sticky bit would
> make the permissions part work correctly, perhaps), though I wonder if
> it's a bit complicated. If the model you're after is simply "server
> allocates IPs for peers already known through some channel but with
> unknown wireguard public keys", then maybe a better SSH-based
> interface is a special user that is only allowed to run one program,
> and that program does one thing: accepts as input a public key, and
> outputs [without races] an allocated IP, endpoint, and the server's
> public key. Under the hood that information could be stored in a
> variety of ways. Alternatively, this could be its own protocol over
> the wire or over TLS or over whatever the pre-established trust
> mechanism is that the idea is based on. One of the earliest dirty bash
> scripts for WireGuard did this (insecurely) over TCP --
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/ncat-client-server/server.sh
> -- this is what's running on demo.wireguard.com.
> 
> Jason
