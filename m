Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2e37c6c
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 16:27:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13e351b9
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 16:27:53 +0000 (UTC)
Date: Wed, 10 May 2017 10:35:49 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: SSH stuck
Message-ID: <20170510103549.58b7e0a9@msi.defcon1>
In-Reply-To: <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
 <20170510101013.715986f0@msi.defcon1>
 <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
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

On Wed, 10 May 2017 10:13:29 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Lower the MTU of the WireGuard interface.

Thanks, Jason, just lowering 2bytes from 1420 to 1418 is enough
to get ssh operational :)
If you have time for that, please feel free to explain me why.

JY
