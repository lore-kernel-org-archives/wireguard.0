Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caba806e
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 17:54:33 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2d5660b
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 17:54:33 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx103
 [212.227.17.174]) with ESMTPSA (Nemesis) id 0LeeNW-1dp1HK3W5W-00qS7n for
 <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 20:05:04 +0200
Date: Wed, 10 May 2017 20:05:01 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: SSH stuck
Message-ID: <20170510200501.1126bb62@msi.defcon1>
In-Reply-To: <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
 <20170510101013.715986f0@msi.defcon1>
 <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Correction: 4 bytes: from 1420 to 1416; done by a PostUp.

I've also seen something that wasn't much expected:
manually changing the MTU from 1418 to 1416 on the server, 
while VPN was on, also changed the IP address of the WG I/F:
	inet addr:0.0.5.136	!(?)

JY
