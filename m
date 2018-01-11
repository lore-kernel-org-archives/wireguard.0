Return-Path: rumpelsepp@sevenbyte.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ebafd16
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 06:35:23 +0000 (UTC)
Received: from coruscant.sevenbyte.org (coruscant.sevenbyte.org
 [45.32.152.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e98efe22
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 06:35:23 +0000 (UTC)
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
 [209.85.215.46]) (Authenticated sender: rumpelsepp@sevenbyte.org)
 by coruscant.sevenbyte.org (Postfix) with ESMTPSA id 413A73F392
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2018 07:37:53 +0100 (CET)
Received: by mail-lf0-f46.google.com with SMTP id h5so1515857lfj.2
 for <wireguard@lists.zx2c4.com>; Wed, 10 Jan 2018 22:37:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87wp0p1h5j.fsf@fifthhorseman.net>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
 <87wp0p1h5j.fsf@fifthhorseman.net>
From: Stefan Tatschner <rumpelsepp@sevenbyte.org>
Date: Thu, 11 Jan 2018 07:37:49 +0100
Message-ID: <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
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

Hi!

Thanks all for the amazing work here, I am really impressed.

On Wed, Jan 10, 2018 at 11:30 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> On Wed 2018-01-10 09:50:39 +0100, Matthias Urlichs wrote:
>> I would also create a virtual "wireguard" package that directly depends
>> on wireguard-dkms and wireguard-tools (and Recommends:
>> networkmanager-wireguard, as soon as that exists). Then, simply instruct
>> the user to install that.

Is it really neccessary to recommend an additional tool in the
package? Wireguard can already be integrated in debian's native
network configuration via /etc/network/interfaces:
https://wiki.debian.org/Wireguard

I just do

  # ifup wg0
  # ifdown wg0

and it's fine.

Stefan

>
> This is a good idea, thanks!  As an aside, if anyone wants to suggest
> packaging improvements like this, a bug report to the debian BTS is
> probably the easiest way to go.
>
> As for the dependencies related to systemd-networkd, the discussion here
> makes me think we're better off just sticking with the status quo
> (option 0), so i'll do that unless i hear a really compelling argument
> to do anything else.
>
>      --dkg
>
