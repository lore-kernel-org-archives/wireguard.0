Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22f191b1
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 15:13:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccf1cd4e
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 15:13:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8f7badb
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 15:13:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9331aabb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Mar 2017 15:13:59 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id x37so134526009ota.2
 for <wireguard@lists.zx2c4.com>; Mon, 20 Mar 2017 08:18:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <15aea1bc5c3.c2181619229336.1203334027395810585@mysterious.site>
References: <15acfffc263.e11103bb85901.2506936173902453879@mysterious.site>
 <CAHmME9p8kMshYw0A0v7ibY_jeNbMDLX5TE1+r0e02j+28kk8Dg@mail.gmail.com>
 <15aea1bc5c3.c2181619229336.1203334027395810585@mysterious.site>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Mar 2017 16:18:09 +0100
Message-ID: <CAHmME9reXOs93A_FMzaPe1TyhRZgd3S3gLXzekS3_oy0brx-+w@mail.gmail.com>
Subject: Re: Some questions about the protocol
To: sopium <sopium@mysterious.site>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Mar 20, 2017 at 6:06 AM, sopium <sopium@mysterious.site> wrote:
> Do we send back keep-alive packets in response to keep-alive packets?
> [No?] If so, they will ping-pong indefinitely, and persistent
> keep-alive seems unnecessary. If not, do we send keep-alive packets in
> response to persistent keep-alive packets? [Yes?] Then we need to
> distinguish these two different types of keep-alive?

You do _not_ send a keepalive to a keepalive.
You do _not_ need to distinguish the two different types of keepalives.
You do _not_ send keepalive packets in response to persistent
keepalive packets. They are the same and indistinguishable.

The rule is:
   If a non-keepalive data packet has been received from a given peer,
but we have not
   sent either a non-keepalive data packet nor a keepalive data packet
to the given peer
   within the last KEEPALIVE ms, then we send a keepalive data packet.

When persistent keepalive is enabled, we simply send a keepalive every
X ms, which satisfies the condition above, and thus no additional
keepalives need to be sent, if persistent keepalive interval is >
KEEPALIVE ms.

>> WireGuard currently doesn't do per-peer-endpoint PMTU, but I'm working
>> on this, and I'll update you when this is worked out.
>
> Since a WireGuard interface can have multiple peers, some may have
> a smaller MTU than the interface MTU?

Yes. Per-peer PMTU discovery is currently a TODO item, but currently
is not worked out. Right now the best we can do is per-interface. This
will change at some point in the future, but not now.
