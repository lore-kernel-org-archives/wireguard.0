Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45b0fd47
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 17:12:12 +0000 (UTC)
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
 [209.85.214.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe17a3ff
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 17:12:12 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id u5-v6so3006980itc.1
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 10:22:51 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com.
 [209.85.214.50])
 by smtp.gmail.com with ESMTPSA id i7sm147453itb.38.2018.03.16.10.22.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Mar 2018 10:22:49 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f50.google.com with SMTP id y20-v6so2955450itc.5
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 10:22:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316220111.594ee06f@natsu>
References: <20180316220111.594ee06f@natsu>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Fri, 16 Mar 2018 13:22:48 -0400
Message-ID: <CAK_h9uHfEaphkSR9F5+Umz7iyXJq_dPOVjHLYvaN6c3U3cXa0Q@mail.gmail.com>
Subject: Re: Reconciling "cryptokey-based" and regular routing
To: Roman Mamedov <rm@romanrm.net>
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

You need to create multiple wireguard interfaces and assign a single
peer to each.

On Fri, Mar 16, 2018 at 1:01 PM, Roman Mamedov <rm@romanrm.net> wrote:
> Hello,
>
> I need to have multiple gateways on my WG network that can provide access to
> the entire IPv4 (or IPv6) Internet, for redundancy and load-balancing
> purposes.
>
> In WG terms this means I need to set AllowedIPs to 0.0.0.0/0 on more than one
> peer. Then I would add routes into the regular routing table for various
> destinations,
>
> ip -4 route add 8.8.8.8 via 10.0.0.1
> ip -4 route add 8.8.4.4 via 10.0.0.2
>
> or
>
> ip -4 route add default \
>   nexthop via 10.0.0.1 weight 1 \
>   nexthop via 10.0.0.2 weight 1
>
> or whatever.
>
> But as documentation and some testing show, this can't really work in WG's
> "cryptokey-routing" system. If multiple hosts have 0.0.0.0/0 as allowed IPs,
> WG just sends everything to a random one of them (the first one?),
> disregarding all of the routing table settings from the examples above.
>
> Is there any possibility to still use multiple routers like that?
>
> If not, then could you add an option to not use AllowedIPs for routing?
> Or at least to not enforce filtering on incoming packets -- then perhaps I
> could have only 10.0.0.1 and 10.0.0.2 in AllowedIPs for those hosts, and
> outgoing routing would work properly, with replies from Internet hosts not
> getting filtered out?
>
> (Apologies for multiple posts per day, I'm just deploying WireGuard for the
> first time today, and it's quite unusual compared to what I used before. I
> will stop soon :)
>
> --
> With respect,
> Roman
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
