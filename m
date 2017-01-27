Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 641bf35e
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2017 16:49:42 +0000 (UTC)
Received: from mx.cakelie.net (mx.cakelie.net [45.76.39.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5a7115e
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2017 16:49:42 +0000 (UTC)
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: [Low priority feature request] Color output of `wg show`
Message-Id: <72A0A3E7-999E-4AAD-8D9B-6B18F6CA8513@danrl.com>
Date: Fri, 27 Jan 2017 18:01:34 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

here is what I observed when combining `wg` with `watch` regarding =
colored output. Not sure if this is a wg-issue at all.


# wg show
[colored output] expected

# watch wg show
[no colored output] expected, but not cool :)

# watch --color wg show
[no colored output] expected, but not cool :)

However, it seems that `watch --color` alone does not make colored =
output, but the "watched" application needs to be forced to output color =
codes.

# ls
[colored output] expected

# watch --color ls
[no colored output] expected, but not cool :)

# watch --color ls --color
[colored output] expected


Which leads to this: May I request this very non-functional and =
eye-candy only feature of `wg --color`? With lowest priority, of course =
:)
Or maybe a hint were to look at and I'll implement it myself.

Cheers,

Dan=
