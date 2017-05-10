Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50773ff0
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:58:18 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b217d8c3
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:58:18 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx002
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0MEFIm-1dFDcA3Xia-00FQSu for
 <wireguard@lists.zx2c4.com>; Thu, 11 May 2017 00:08:50 +0200
Date: Thu, 11 May 2017 00:08:47 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: SSH stuck
Message-ID: <20170511000847.3d90e676@msi.defcon1>
In-Reply-To: <CAHmME9oD6mUdnG6_p-C+H5GhwiVLJycQY73ydDqg7WZ9r1iU0g@mail.gmail.com>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
 <20170510101013.715986f0@msi.defcon1>
 <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
 <20170510200501.1126bb62@msi.defcon1>
 <CAHmME9rWXev+=cp6FLgwSh+_01nHp7uyRXWGZms9JjfVamhMeg@mail.gmail.com>
 <20170510215728.23275d88@msi.defcon1>
 <CAHmME9oD6mUdnG6_p-C+H5GhwiVLJycQY73ydDqg7WZ9r1iU0g@mail.gmail.com>
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

On Wed, 10 May 2017 23:55:14 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Wed, May 10, 2017 at 9:57 PM, Bzzzz <lazyvirus@gmx.com> wrote:
> > You're right, seems tied to the 4.9 kernel &| the ifconfig program
> > as it does the same weird thing to my eth0 I/F :/
> 
> $ ip link set mtu 1416 dev wg0

Thanks.

JY
