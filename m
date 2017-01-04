Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e95e8368
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:06:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68b9e77b
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:06:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57a28819
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:06:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cbc7bc96
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:06:43 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id 3so375269067oih.1
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2017 13:15:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5674e440-84df-dab2-41ef-327cf61dca1e@viisauksena.de>
References: <5674e440-84df-dab2-41ef-327cf61dca1e@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Jan 2017 22:15:42 +0100
Message-ID: <CAHmME9rakpxbx+YU=_TnNqjJYSbACO+K6SPdRw4PZrwxAV5sqg@mail.gmail.com>
Subject: Re: wg set allowed ip confusion
To: jens <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jens,

One peer, one IP. The routing enforces a 1:1 relationship. So no, you
can't do this. But I sincerely doubt you would even want to do this.

On your server, each peer's allowed IPs should probably be a /32 of
the actual internal IP address of the peer.

The front page of wireguard.io has an illustrative example
configuration of a client-server topology:
https://www.wireguard.io/#cryptokey-routing

Jason
