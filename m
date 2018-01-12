Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d42ea91f
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 15:48:16 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0348bcc3
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Jan 2018 15:48:15 +0000 (UTC)
Message-ID: <1515772241.1125.13.camel@eggiecode.org>
Subject: Re: WireGuard in systemd-networkd
From: Egbert Verhage <egbert@eggiecode.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Date: Fri, 12 Jan 2018 16:50:41 +0100
In-Reply-To: <8760880xvk.fsf@fifthhorseman.net>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
 <87wp0p1h5j.fsf@fifthhorseman.net>
 <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
 <87k1wo1pfu.fsf@fifthhorseman.net>
 <CAHmME9q8_4Ln=OB7_NDTzE3JpTdf8Ae4isJ+qiAVCJJS1qCDcQ@mail.gmail.com>
 <8760880xvk.fsf@fifthhorseman.net>
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

Hey dkg,

I wanted to do the same thing with the meta package, so I have included
your patch in the ubuntu ppa repo.

I have pushed the packages to the PPA, so will be up in 10min.

Here the commit with the meta package patch:
https://github.com/EggieCode/wireguard-ppa/commit/1c502977301cfc1695996
ba68fa260576f0f0cad

Thanks dkg for the patch!

Greetz,
Egbert

On Thu, 2018-01-11 at 18:38 -0500, Daniel Kahn Gillmor wrote:
> On Thu 2018-01-11 16:02:30 +0100, Jason A. Donenfeld wrote:
> > On Thu, Jan 11, 2018 at 2:43 PM, Daniel Kahn Gillmor
> > <dkg@fifthhorseman.net> wrote:
> > > Matthias was suggesting a simply-named meta-package: just
> > > "wireguard",
> > > which would ensure that both wireguard-dkms and wireguard-tools
> > > are
> > > installed.  The advantage there is that you can tell people to
> > > do:
> > > 
> > >    apt install wireguard
> > > 
> > > and apt make sure the system has the common setup by default :)
> > 
> > This is a great idea. Let me know if you wind up making this. I've
> > added Egbert to the CC so that he can make an identical change in
> > the
> > Ubuntu PPA.
> 
> I've just uploaded this arrangement to debian, but it needs to clear
> the
> NEW queue, which can take a little while.
> 
> You should be able to follow the NEW queue here:
> 
>    https://ftp-master.debian.org/new.html
> 
> Egbert (or any other packager for a debian derivative) can see my
> packaging here, if they're interested:
> 
>    https://salsa.debian.org/debian/wireguard
> 
> in particular:
> 
>    https://salsa.debian.org/debian/wireguard/commit/cc3cab4b799a64e9c
> 74985da627fc85ba0ee2cc8
> 
> as always, I welcome feedback and suggestions for other improvements.
> 
> Regards,
> 
>         --dkg
