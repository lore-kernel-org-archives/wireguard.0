Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7bf2a21
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:22:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fdeb401
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:22:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ef54381
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:13:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9f66b7f8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 22:13:47 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id y20-v6so1404060oix.5
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 15:37:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1523814593.1990.49.camel@gmail.com>
References: <1523814593.1990.49.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Apr 2018 00:37:05 +0200
Message-ID: <CAHmME9rr7AJ_LGZt62vMAkAFh4Q304PTpHJ3WRug91Xw3Ewb9w@mail.gmail.com>
Subject: Re: SFTP-based VPN bootstrapping with automatic collision-free IPs
 assignment/peers' public data sharing
To: ST <smntov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi ST,

It's a cool idea using the file system like that (the sticky bit would
make the permissions part work correctly, perhaps), though I wonder if
it's a bit complicated. If the model you're after is simply "server
allocates IPs for peers already known through some channel but with
unknown wireguard public keys", then maybe a better SSH-based
interface is a special user that is only allowed to run one program,
and that program does one thing: accepts as input a public key, and
outputs [without races] an allocated IP, endpoint, and the server's
public key. Under the hood that information could be stored in a
variety of ways. Alternatively, this could be its own protocol over
the wire or over TLS or over whatever the pre-established trust
mechanism is that the idea is based on. One of the earliest dirty bash
scripts for WireGuard did this (insecurely) over TCP --
https://git.zx2c4.com/WireGuard/tree/contrib/examples/ncat-client-server/server.sh
-- this is what's running on demo.wireguard.com.

Jason
