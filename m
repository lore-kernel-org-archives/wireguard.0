Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d3c034b
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 12:52:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccbcdfeb
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 12:52:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6ffae8c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 13:11:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba4b9aca
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Sep 2017 13:11:31 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id e189so2980595ioa.4
 for <wireguard@lists.zx2c4.com>; Fri, 22 Sep 2017 06:19:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAECwjAgRyK0T3vtBUzR1P-d--vdEDS=Jj-nFWHx1=7ivEd6Zvw@mail.gmail.com>
References: <CAECwjAgRyK0T3vtBUzR1P-d--vdEDS=Jj-nFWHx1=7ivEd6Zvw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Sep 2017 15:19:57 +0200
Message-ID: <CAHmME9pA5vkCYsdFDHeXjYV=HFRm1aAFJGT1RsjuSrpZ8jZiog@mail.gmail.com>
Subject: Re: Flood ping can cause oom when handshake fails
To: Yousong Zhou <yszhou4tech@gmail.com>
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

Hi Yousong,

Thanks for the report.

On Fri, Sep 22, 2017 at 2:58 PM, Yousong Zhou <yszhou4tech@gmail.com> wrote:
> The first issue is that occasionally wireguard failed to send
> handshake initiation packets to the remote.  I got to this conclusion
> by two observations
>  - Tearing down then bringing up ("ifup air") the local wireguard
> device did not trigger the update of "latest handshake" timestamp on
> the remote


The handshake will not actually occur until you try to send data over
the interface. So after bringing the interface up, send a ping. Then
you'll have the handshake. If you'd like the handshake to happen
immediately and for packets in general to persistently be sent, to,
for example, keep NAT mappings alive, there's the persistent-keepalive
option. See the wg(8) man page for details.

>  - Wireguard packets can be captured on eth0.1 but not on the remote

I'm not sure I understood this point. Can you elaborate?

> The second issue is that when handshake fails, flood ping traffic that
> was expected to be forwarded through the wireguard interface can cause
> oom and hang the device to death.  There is a [kworker] process taking
> up high cpu usage.

That's very interesting. Here's what I suspect happening: before
there's a handshake, outgoing packets are queued up to be sent for
when a handshake does occur. Right now I allow queueing up a whopping
1024 packets, before they're rotated out and freed LIFO. This is
obviously silly for low-ram situations like yours, and I should make
that mechanism a bit smarter. I'll do that for the next snapshot. I
assume that the high CPU kworker is a last minute attempt at memory
compaction, or something of that sort. However, it'd be good to know
-- could you find more information about that process? Perhaps
/proc/pid/stack or related things in there?

Additionally, I see that you're running 20170907, which is an older
snapshot. If you update to the newer one (20170918), I'd be interested
to learn if the behavior is different.

Jason
