Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 186ab1f6
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 05:09:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c2e2b01
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 05:09:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0a4ece9
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 05:00:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b7e0ebd7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Apr 2018 05:00:09 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id n65-v6so167479oig.6
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 22:23:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK_h9uGaQZ_djbWJTbTZ71uEw9KsXuqHCQ6QYSKqMWjgUeqieA@mail.gmail.com>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
 <CAK_h9uFHeYPaiPVBC+PQi-YOAOCbp6LVTsbM+r8cO4DNmp6RxA@mail.gmail.com>
 <CAHmME9p0Co58utbbd=xA3o2a_+X5YAejQ6qNROLCUczuJ6nqsw@mail.gmail.com>
 <CAK_h9uGaQZ_djbWJTbTZ71uEw9KsXuqHCQ6QYSKqMWjgUeqieA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Apr 2018 07:23:29 +0200
Message-ID: <CAHmME9p7tcwyQEZ5M8NjW_qvEOaw1pzXKtYZ+t3iWWJZ8y=mOg@mail.gmail.com>
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

On Sun, Apr 15, 2018 at 7:51 PM, Tim Sedlmeyer <tim@sedlmeyer.org> wrote:
> - Which allowed-ip do you use?
> - If the allowed-ip is a network, which ip within it do you choose to ping?
> - If you are connected to a single peer with an allowed-ip of 0.0.0.0/0 what
>   ip do you ping?

Yea, the actual IP discovery is a hurdle to figure out.

> The allowed-ip isn't guaranteed to be on the same device as the peer so,
> in the end you aren't measuring the mtu over the connection between peers
> but the complete path to that allowed-ip which could involve more devices and
> connections with smaller MTUs than between the peers themselves.

That's probably fine and even desirable, since we're looking for the
PMTU along a certain route.

> See RFC4821, RFC8085 and
> https://tools.ietf.org/html/draft-ietf-tsvwg-datagram-plpmtud-01
> for more info about PLMTUD.
>
> https://datatracker.ietf.org/meeting/101/materials/slides-101-ipsecme-packetization-layer-path-mtu-discovery-01
> has a quick overview of where IPsec stands with implementing it.

Thanks for these. I followed the rabbit hole, and found [1], which
seems to be the current latest and greatest from the IPsec people.
It's probes inside the control plane. Reading the references, such as
[2], it seems pretty unanimous that going anywhere near out-of-tunnel
ICMP messages is a disaster, as I suggested in the original post here.
That's useful confirmation, and I guess we'll indeed have to look at
creative non-ICMP solutions for PMTUD to happen.

[1] https://tools.ietf.org/html/draft-spiriyath-ipsecme-dynamic-ipsec-pmtu-01.html
[2] https://tools.ietf.org/html/draft-roca-ipsecme-ptb-pts-attack-00
