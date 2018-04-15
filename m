Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd894494
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 17:37:25 +0000 (UTC)
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
 [209.85.214.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d037b7e6
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 17:37:25 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id 145-v6so2775326itf.5
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 10:51:51 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com.
 [209.85.214.51])
 by smtp.gmail.com with ESMTPSA id r190sm3750887iod.42.2018.04.15.10.51.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Apr 2018 10:51:50 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f51.google.com with SMTP id r19-v6so8756848itc.0
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 10:51:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9p0Co58utbbd=xA3o2a_+X5YAejQ6qNROLCUczuJ6nqsw@mail.gmail.com>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
 <CAK_h9uFHeYPaiPVBC+PQi-YOAOCbp6LVTsbM+r8cO4DNmp6RxA@mail.gmail.com>
 <CAHmME9p0Co58utbbd=xA3o2a_+X5YAejQ6qNROLCUczuJ6nqsw@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Sun, 15 Apr 2018 13:51:49 -0400
Message-ID: <CAK_h9uGaQZ_djbWJTbTZ71uEw9KsXuqHCQ6QYSKqMWjgUeqieA@mail.gmail.com>
Subject: Re: PMTU Discovery Security Concerns
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Sun, Apr 15, 2018 at 12:13 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Sun, Apr 15, 2018 at 6:06 PM, Tim Sedlmeyer <tim@sedlmeyer.org> wrote:
>> PMTUD on the Internet is often broken and increasingly becoming more
>> broken, so in my opinion introducing any level of potential security
>> concern to support it would be unwise.
>
> I was wondering if there's actually an appropriate use case for PMTUD
> within networks that are well behaved. For example, within various
> intranets, or between physical sites within a campus. Perhaps these
> aren't relevant, since they're centrally managed anyway, and so we
> should just give up with PMTUD all together?
>

If you are in the network operations side of a intranet/campus network,
getting wireguard going probably isn't your first time wrangling with MTU.

>> If MTU issues are regularly presenting a significant issue to
>> successful deployment of wireguard than in the short term I would
>> suggest doing what many ipsec implementations do, give up some
>> performance in order to increase the likelihood of successful
>> transmission by assigning a default MTU significantly small enough to
>> avoid issues in the vast majority of circumstances. For instance by
>> default the OS X ipsec vpn implementation assigns an MTU of 1280, the
>> minimum IPv6 datagram size, to the tunnel by default. Cisco assigns an
>> MTU of 1300 by default.
>
> Not a bad idea for end user clients. Ugly, but maybe nobody would be
> too perturbed. wg-quick(8) has an MTU= parameter, after all, which
> could be set to 1280.
>
>> In the long term some form of packetization layer path mtu discovery
>> probably should be added to the wireguard protocol itself. Perhaps by
>> padding the first message of the handshake to utilize it as a mtu
>> discovery probe.
>
> I was thinking about implementing something like this on top of
> WireGuard -- a basic ping probe tool that walks through each peer and
> tries to ping one of its allowed IPs within the tunnel. Maybe this
> would take care of most peoples' use cases. It is explicit, however,
> rather than the nice on-demand automatic aspect of traditional PMTUD.

Not sure how well a ping probe would work.

- Which allowed-ip do you use?
- If the allowed-ip is a network, which ip within it do you choose to ping?
- If you are connected to a single peer with an allowed-ip of 0.0.0.0/0 what
  ip do you ping?

The allowed-ip isn't guaranteed to be on the same device as the peer so,
in the end you aren't measuring the mtu over the connection between peers
but the complete path to that allowed-ip which could involve more devices and
connections with smaller MTUs than between the peers themselves.

See RFC4821, RFC8085 and
https://tools.ietf.org/html/draft-ietf-tsvwg-datagram-plpmtud-01
for more info about PLMTUD.

https://datatracker.ietf.org/meeting/101/materials/slides-101-ipsecme-packetization-layer-path-mtu-discovery-01
has a quick overview of where IPsec stands with implementing it.

>
> But anyway, all of this falls into the category of, "let's just not do
> PTMUD." I'm still not convinced it's impossible to do securely, mostly
> because I haven't heard anybody explicitly say, "we thought about this
> for 25 years and it can't be done."
