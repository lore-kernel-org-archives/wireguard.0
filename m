Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0889e7e7
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 18:34:21 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5a62eb6
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 18:34:21 +0000 (UTC)
Date: Mon, 26 Mar 2018 20:46:12 +0200
From: Luis Ressel <aranea@aixah.de>
To: ST <smntov@gmail.com>
Subject: Re: add/remove a peer
Message-ID: <20180326204612.6679a073@vega.skynet.aixah.de>
In-Reply-To: <1521919967.1921.32.camel@gmail.com>
References: <1521919967.1921.32.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

Low-level tools such as wg aren't the right place for the "automagic"
features you're suggesting. wg should have simple, bugproof code and
behave reliably and predictably so that it can serve as a solid
foundation for all sorts of high-level scripts.

Of course, this doesn't mean your suggested features would be useless
-- they just don't belong into the same binary as the low-level stuff.
Build a script to handle the boring IP assignments for you, and if you
believe it might be useful to others, by all means publish it!

Cheers,
Luis
