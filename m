Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec84ced2
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 19:47:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 995838fd
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 19:47:00 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx003
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0Lj1Cw-1dkduM0cf8-00dFCU for
 <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 21:57:32 +0200
Date: Wed, 10 May 2017 21:57:28 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: SSH stuck
Message-ID: <20170510215728.23275d88@msi.defcon1>
In-Reply-To: <CAHmME9rWXev+=cp6FLgwSh+_01nHp7uyRXWGZms9JjfVamhMeg@mail.gmail.com>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
 <20170510101013.715986f0@msi.defcon1>
 <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
 <20170510200501.1126bb62@msi.defcon1>
 <CAHmME9rWXev+=cp6FLgwSh+_01nHp7uyRXWGZms9JjfVamhMeg@mail.gmail.com>
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

On Wed, 10 May 2017 21:00:33 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> On Wed, May 10, 2017 at 8:05 PM, Bzzzz <lazyvirus@gmx.com> wrote:
> > Correction: 4 bytes: from 1420 to 1416; done by a PostUp.
> 
> In the next snapshot, if your primary ethernet device has a
> non-standard MTU, wg-quick will try to figure it out automatically and
> adjust. However, if your end router (adsl modem, for example) is doing
> something odd, you'll have to make this adjustment for yourself. Thus,
> the next version of wg-quick will have also an MTU= directive.
> Hopefully the snapshot will be out somewhat soon.

OK, it's noted.

> > I've also seen something that wasn't much expected:
> > manually changing the MTU from 1418 to 1416 on the server,
> > while VPN was on, also changed the IP address of the WG I/F:
> >         inet addr:0.0.5.136     !(?)
> 
> That's totally bizarre. I'm guessing you just entered the wrong
> command at some point. That's not wireguard-related code, anyhow.
> 
> >>> 1416 & 0xff
> 136
> >>> 1416 >> 8
> 5

You're right, seems tied to the 4.9 kernel &| the ifconfig program
as it does the same weird thing to my eth0 I/F :/ 

JY
