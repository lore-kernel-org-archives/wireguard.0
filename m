Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23d89786
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 21:17:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a25dfae2
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 21:17:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7b6715c
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 20:53:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 29f2b693
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 20:53:38 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id t1-v6so7090146oth.8
 for <wireguard@lists.zx2c4.com>; Wed, 25 Apr 2018 14:18:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
References: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Apr 2018 23:18:11 +0200
Message-ID: <CAHmME9ovmNCJ4501TDpvtu9doci1Z34jS9N88csgNskxq4QrRg@mail.gmail.com>
Subject: Re: RX Errors from Android Peer
To: stunnel@attglobal.net
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

Hi Eddie,

Those RX frame errors are caused by the interface receiving packets
that have a source IP not included in the allowed-ips list of the
peer.

https://git.zx2c4.com/WireGuard/tree/src/receive.c#n351

Jason
