Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 272865f8
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:58:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10343ea6
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:58:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb8c7a55
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:49:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ad6163a0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:49:57 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id q71-v6so12417903oic.6
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 09:13:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK_h9uFHeYPaiPVBC+PQi-YOAOCbp6LVTsbM+r8cO4DNmp6RxA@mail.gmail.com>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
 <CAK_h9uFHeYPaiPVBC+PQi-YOAOCbp6LVTsbM+r8cO4DNmp6RxA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Apr 2018 18:13:12 +0200
Message-ID: <CAHmME9p0Co58utbbd=xA3o2a_+X5YAejQ6qNROLCUczuJ6nqsw@mail.gmail.com>
Subject: Re: PMTU Discovery Security Concerns
To: Tim Sedlmeyer <tim@sedlmeyer.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Apr 15, 2018 at 6:06 PM, Tim Sedlmeyer <tim@sedlmeyer.org> wrote:
> PMTUD on the Internet is often broken and increasingly becoming more
> broken, so in my opinion introducing any level of potential security
> concern to support it would be unwise.

I was wondering if there's actually an appropriate use case for PMTUD
within networks that are well behaved. For example, within various
intranets, or between physical sites within a campus. Perhaps these
aren't relevant, since they're centrally managed anyway, and so we
should just give up with PMTUD all together?

> If MTU issues are regularly presenting a significant issue to
> successful deployment of wireguard than in the short term I would
> suggest doing what many ipsec implementations do, give up some
> performance in order to increase the likelihood of successful
> transmission by assigning a default MTU significantly small enough to
> avoid issues in the vast majority of circumstances. For instance by
> default the OS X ipsec vpn implementation assigns an MTU of 1280, the
> minimum IPv6 datagram size, to the tunnel by default. Cisco assigns an
> MTU of 1300 by default.

Not a bad idea for end user clients. Ugly, but maybe nobody would be
too perturbed. wg-quick(8) has an MTU= parameter, after all, which
could be set to 1280.

> In the long term some form of packetization layer path mtu discovery
> probably should be added to the wireguard protocol itself. Perhaps by
> padding the first message of the handshake to utilize it as a mtu
> discovery probe.

I was thinking about implementing something like this on top of
WireGuard -- a basic ping probe tool that walks through each peer and
tries to ping one of its allowed IPs within the tunnel. Maybe this
would take care of most peoples' use cases. It is explicit, however,
rather than the nice on-demand automatic aspect of traditional PMTUD.

But anyway, all of this falls into the category of, "let's just not do
PTMUD." I'm still not convinced it's impossible to do securely, mostly
because I haven't heard anybody explicitly say, "we thought about this
for 25 years and it can't be done."
