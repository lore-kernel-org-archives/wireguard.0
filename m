Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e7e10cc
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 15:22:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 014fbe64
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 15:22:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e00b0aec
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 15:13:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0139e72d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 15:13:17 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id w10so7160396ote.13
 for <wireguard@lists.zx2c4.com>; Wed, 14 Feb 2018 07:29:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Feb 2018 16:28:59 +0100
Message-ID: <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
Subject: Re: NetworkManager Plugin
To: Max Moser <e1326252@student.tuwien.ac.at>
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

Hey Max,

This is wonderful news. I'm happy to work with you to make sure this
comes out perfectly, and maybe when it's finished we can submit it
upstream to NetworkManager, similar to how systemd-networkd now has
WireGuard support built-in.

The biggest hurdle I currently see is entirely removing the dependency
on wg-quick and wg, and talking Netlink yourself to the kernel, just
like systemd-networkd does. It shouldn't be too hard to adopt the
libmnl-based code in wg(8) to be suitable for your usage; I can assist
with this. In general, the fwmark/routing logic of wg-quick should
probably be done in a NetworkManager-centric way, which means not
using wg-quick.

Looks like things are off to a great start!

Jason
