Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12fc48fa
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 22:01:41 +0000 (UTC)
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
 [74.125.82.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5619feb8
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 22:01:41 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id b49so3243551otj.5
 for <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 14:06:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <630c9955-ae3a-bf10-02ae-e5aa7eee6e64@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
 <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
 <cdf48a39-3d81-5269-dbb4-93929cdf081f@gmail.com>
 <CAKUy5ayo2jWAaA-D2UmtO6q4YUe-KP4u1+3VF32-kvbHbjZLsA@mail.gmail.com>
 <630c9955-ae3a-bf10-02ae-e5aa7eee6e64@gmail.com>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Fri, 17 Nov 2017 23:06:11 +0100
Message-ID: <CAKUy5ax9kWWF_PPLQYy09-EVnH-CCfQDpYctn3X+Cpe+FNP_0Q@mail.gmail.com>
Subject: Re: Roaming Mischief
To: Aaron Jones <aaronmdjones@gmail.com>
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

> My example is most useful when both endpoints are roaming and either
> endpoint needs to be able to initiate sessions. It's not a very
> common scenario I'll give you that, but the current full roaming
> support does enable it seamlessly (when you also enable keep-alives).

Thank you for clarifying.

This really sound like an unusual situation, where you need to make
sure that while one peer is down the other doesn't move.
I wonder if this could not, should the need arise, be solved in another fashion.

>From experience I have another concern towards the current mechanism.
When configuring two peers pointing at each other and by mistake
setting one endpoint IP to a wrong value (typo in the IP) there is a
good chance this mistake may not be noticed for quiet some time, if
the correctly configured endpoint initiates the connection most of the
time. The user (me), believing to have correctly configured the link,
may be taken by surprise at a later point in time when the link is not
established, as he expects, when the wrongly configured side tries to
initiate it after say a reboot. This is more of a concern to me than
supporting to roaming  peers.

Also the thought of something like `wg showconf wg0 >
/etc/wireguard/wg0.conf` happening at shutdown frightens me a little.
Because if the command fails for whatever reason the configuration
will be truncated and after the reboot completes the link will be
non-functional (conf vs state).

Please don't interpret my comments the wrong way, I grew to love
wireguard. Just trying to state the kinks (IMO) I see, and this is one
of them.
I still vote for: if an endpoint is specified, don't allow the peer
from another source - no config syntax change needed ;).

Markus
