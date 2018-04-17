Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 151f4008
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Apr 2018 19:53:04 +0000 (UTC)
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
 [209.85.128.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9e197ab
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Apr 2018 19:53:04 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id o15so7825330wro.11
 for <wireguard@lists.zx2c4.com>; Tue, 17 Apr 2018 13:07:46 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1523995660.9423.4.camel@gmail.com>
Subject: Re: SFTP-based VPN bootstrapping with automatic collision-free IPs
 assignment/peers' public data sharing
From: ST <smntov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Apr 2018 23:07:40 +0300
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

I looked into those scripts - thank you! What discourages me is its
warning not to use in production! So I'm wondering maybe it is possible
to just use DHCP server/client somehow with WG for this purpose? Are
there any expected pitfalls for such a configuration? 

Thank you!
