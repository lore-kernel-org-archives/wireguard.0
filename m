Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ca6c92a
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 17:36:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85510fa5
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 17:36:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a699964
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 17:27:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1c52e5cc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 17:27:47 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id q5so12002939oth.2
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jan 2018 09:39:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <871siz6ouv.fsf@fifthhorseman.net>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Jan 2018 18:38:59 +0100
Message-ID: <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
Subject: Re: WireGuard in systemd-networkd
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Hey Dan,

On Tue, Jan 9, 2018 at 4:20 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> very cool!  systemd-networkd end up invoking wg(8)?  or does it interact
> with the kernel directly?

We taught systemd to talk the generic netlink protocol --useful for
all sorts of new things cropping up in the kernel -- and then after
that we taught it to talk wireguard, which builds on top of generic
netlink. And, it doesn't introduce any build-time dependencies into
systemd-networkd. So it's there for people who want it and not there
for those who don't. I think this is the right approach for
Linux-centric approaches like systemd.

>
> if doesn't need wg(8), then once the new release of systemd is made, we
> may want to change the dependency recommendations for the wireguard
> kernel module packages.

Maybe? I'm not quite sure what the Debian semantics for
recommendations are. If additional recommendations crowd out existing
recommendations, or introduce some kind of automatic selection logic
where only one has to be satisfied in an install-recommendations mode,
then I'd be hesitant. The reason is that wg(8) allows users to see
what's going on with the wireguard interface, whereas networkd only
enables setting up the interface but after doesn't give much
visibility into what's going on. So all users who run wireguard
probably want wg(8), and only some users who run wireguard
additionally will want systemd-networkd. But as I said, I don't know
what the Debian recommendations are supposed to be precisely, so you
can decide this better than me.


>
>> Next up - anybody interested in providing support for NetworkManager?
>
> iirc, NetworkManager imports a big chunk of systemd in each release
> (yuck embedded code copies).  maybe it'll import the relevant wireguard
> bits as well?  that would probably make the NM work an easier lift.

Oh, cool, I didn't realize that. Thanks for the pointer. I'll poke
around to see what they import.

Jason
