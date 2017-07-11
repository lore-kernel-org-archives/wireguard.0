Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd07be5b
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 01:41:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25150876
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 01:41:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 480983de
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 01:54:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4bbcdc15
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 01:54:45 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 77so162444755wrb.1
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jul 2017 18:59:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ziccyoo1.fsf@fifthhorseman.net>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr> <20170710025323.GC31153@zx2c4.com>
 <1499716437.988.1.camel@eggiecode.org> <87ziccyoo1.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 Jul 2017 03:59:23 +0200
Message-ID: <CAHmME9oqMk8_2ZZExV8ccCdjrnai_Z=yJfRzqhSDeMsWpo-ENA@mail.gmail.com>
Subject: Re: Debian-based configuration for wireguard
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

>
> fwiw, some of us do also run debian systems without ifupdown these days.
> I'm looking forward to systemd-networkd integration personally :)
>
>         --dkg

I really need to leap into action and start on the Netlink stuff,
which is the only thing currently blocking the systemd-networkd
integration. It's been hard to get motivated for this kind of thing,
but it seems like everything everyone wants to do with WireGuard is
waiting for it, so I should probably get to it soon...
