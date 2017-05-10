Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95c8e603
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 18:50:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 731de44a
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 18:50:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34edc2de
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 18:50:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6716ff55
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 18:50:02 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id h4so5505627oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 12:00:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510200501.1126bb62@msi.defcon1>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
 <20170510101013.715986f0@msi.defcon1>
 <CAHmME9qM7i=JCz7NSbSPk8_s1wy1tvYAdudBJwEx6sutqBX4xQ@mail.gmail.com>
 <20170510200501.1126bb62@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 10 May 2017 21:00:33 +0200
Message-ID: <CAHmME9rWXev+=cp6FLgwSh+_01nHp7uyRXWGZms9JjfVamhMeg@mail.gmail.com>
Subject: Re: SSH stuck
To: Bzzzz <lazyvirus@gmx.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, May 10, 2017 at 8:05 PM, Bzzzz <lazyvirus@gmx.com> wrote:
> Correction: 4 bytes: from 1420 to 1416; done by a PostUp.

In the next snapshot, if your primary ethernet device has a
non-standard MTU, wg-quick will try to figure it out automatically and
adjust. However, if your end router (adsl modem, for example) is doing
something odd, you'll have to make this adjustment for yourself. Thus,
the next version of wg-quick will have also an MTU= directive.
Hopefully the snapshot will be out somewhat soon.

> I've also seen something that wasn't much expected:
> manually changing the MTU from 1418 to 1416 on the server,
> while VPN was on, also changed the IP address of the WG I/F:
>         inet addr:0.0.5.136     !(?)

That's totally bizarre. I'm guessing you just entered the wrong
command at some point. That's not wireguard-related code, anyhow.

>>> 1416 & 0xff
136
>>> 1416 >> 8
5
