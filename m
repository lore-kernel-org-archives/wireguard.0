Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a34d6d7f
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:36:30 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3c71543
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:36:30 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id l49so10960176wrl.4
 for <wireguard@lists.zx2c4.com>; Mon, 26 Mar 2018 12:48:25 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1522093702.2044.61.camel@gmail.com>
Subject: Re: add/remove a peer
From: ST <smntov@gmail.com>
To: Luis Ressel <aranea@aixah.de>
Date: Mon, 26 Mar 2018 22:48:22 +0300
In-Reply-To: <20180326204612.6679a073@vega.skynet.aixah.de>
References: <1521919967.1921.32.camel@gmail.com>
 <20180326204612.6679a073@vega.skynet.aixah.de>
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

On Mon, 2018-03-26 at 20:46 +0200, Luis Ressel wrote:
> Hello,
> 
> Low-level tools such as wg aren't the right place for the "automagic"
> features you're suggesting. wg should have simple, bugproof code and
> behave reliably and predictably so that it can serve as a solid
> foundation for all sorts of high-level scripts.
> 
> Of course, this doesn't mean your suggested features would be useless
> -- they just don't belong into the same binary as the low-level stuff.
> Build a script to handle the boring IP assignments for you, and if you
> believe it might be useful to others, by all means publish it!

Agreed. I remember that I read in the docs that some of the WG's tools
are of higher level. So I thought that automatic IP assignment could
belong to them. Probably it was wg-quick, but `wg set ...` is seemingly
a low-level stuff. Now I see. Thank you!
