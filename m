Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eed76752
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:52:00 +0000 (UTC)
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
 [209.85.214.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 405fcca0
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 15:52:00 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id b5-v6so8585226itj.1
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 09:06:25 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com.
 [209.85.214.45])
 by smtp.gmail.com with ESMTPSA id v64-v6sm3457734ita.3.2018.04.15.09.06.24
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Apr 2018 09:06:24 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f45.google.com with SMTP id 71-v6so8695586ith.2
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 09:06:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Sun, 15 Apr 2018 12:06:23 -0400
Message-ID: <CAK_h9uFHeYPaiPVBC+PQi-YOAOCbp6LVTsbM+r8cO4DNmp6RxA@mail.gmail.com>
Subject: Re: PMTU Discovery Security Concerns
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

PMTUD on the Internet is often broken and increasingly becoming more
broken, so in my opinion introducing any level of potential security
concern to support it would be unwise.

If MTU issues are regularly presenting a significant issue to
successful deployment of wireguard than in the short term I would
suggest doing what many ipsec implementations do, give up some
performance in order to increase the likelihood of successful
transmission by assigning a default MTU significantly small enough to
avoid issues in the vast majority of circumstances. For instance by
default the OS X ipsec vpn implementation assigns an MTU of 1280, the
minimum IPv6 datagram size, to the tunnel by default. Cisco assigns an
MTU of 1300 by default.

In the long term some form of packetization layer path mtu discovery
probably should be added to the wireguard protocol itself. Perhaps by
padding the first message of the handshake to utilize it as a mtu
discovery probe.

On Sun, Apr 15, 2018 at 10:08 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi list,
>
> [CC'ing Luis, who's been working on this with me.]
>
> I've more or less figured out how to do PMTU discovery (something
> along the lines of https://xn--4db.cc/WFHQzX2o/c inspired by the vti
> driver). I wonder, however, if this is safe to do.
>
> The basic idea is that if you're talking to a WireGuard peer via its
> internal tunnel IP address, the kernel keeps some notion of what that
> internal IP address's PMTU is. Meanwhile, WireGuard itself is talking
> to that peer via its external endpoint IP address, and the kernel
> keeps some notion of what that external IP address's PMTU is. If the
> encrypted packets are larger than the external PMTU, well behaved
> networks will send ICMP messages, indicating that packets sent to that
> external endpoint IP should be smaller. This, however, doesn't have
> anything to do with what the user is trying to send internally, and so
> there will continue to be overly large packets sent.
>
> The way to fix it would be to relay the external endpoint PMTU to the
> internal tunnel PMTU. Then, when an external encrypted packet gets
> dropped due to being overly large, the ICMP message for that winds up
> affecting the internal tunneled IP address's PMTU, so that the next
> message it sends is smaller. All is well, packets flow, and TCP
> sessions no longer stall. This is generally how PMTU discovery works
> with network tunnels.
>
> The security problem is that those ICMP messages indicating we should
> send smaller packets are unauthenticated, since they're triggered by
> things external to the tunnel, rather than inside the tunnel. By
> propagating the information from those unauthenticated ICMP messages
> to state that concerns the inside of the tunnel, we're essentially
> enabling an unauthenticated state injection. This could enable some
> mischief. On the benign end of the spectrum, an attacker could launch
> a DoS attack by causing the sending end to use smaller and smaller
> packets. On the scarier end of the spectrum, an attacker could
> intelligently do this to change the size of packets and observe the
> way in which a data flow is rechunked, in order to infer something
> about the actual data being encrypted.
>
> These security concerns make me inclined to just simplistically
> declare, "PMTU discovery in tunnels can't be done securely with the
> existing Internet, so WireGuard doesn't support it." However,
> undoubtedly smart people have thought about this before, and perhaps
> they've come up with real solutions for this. Indeed I've come across
> various discussions of the matter in the IPsec RFCs. But at the
> present moment, I'm unsure what the most reasonable way forward is.
>
> So, I thought if anyone on the list has thought about this extensively
> before and would like to chime in with some wisdom, I'm all ears.
>
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
