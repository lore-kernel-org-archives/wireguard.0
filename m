Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1759ecc5
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 23:10:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c02bdded
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 23:10:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c4e36c1b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Sep 2016 23:10:20 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id g62so117912148lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 30 Sep 2016 16:21:07 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 1 Oct 2016 01:21:04 +0200
Message-ID: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
To: cake@lists.bufferbloat.net, make-wifi-fast@lists.bufferbloat.net,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] WireGuard Queuing, Bufferbloat, Performance, Latency,
	and related issues
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all,

On Fri, Sep 30, 2016 at 9:18 PM, Dave Taht <dave.taht@gmail.com> wrote:
> All: I've always dreamed of a vpn that could fq and - when it was
> bottlenecking on cpu - throw away packets intelligently. Wireguard,
> which is what jason & co are working on, is a really simple, elegant
> set of newer vpn ideas that currently has a queuing model designed to
> optimize for multi-cpu encryption, and not, so much, for managing
> worst case network behaviors, or fairness, or working on lower end
> hardware.

Would love any feedback and support for working on the queuing model
with WireGuard. I hear the bufferbloat folks are geniuses at that...

> Do do a git clone of the code, and take a look... somewhere on the
> wireguard list, or privately, jason'd pointed me at the relevant bits
> of the queuing model.

It was this post:
https://lists.zx2c4.com/pipermail/wireguard/2016-August/000378.html
Start reading from "There are a couple reasons" and finish at
"chunking them somehow." The rest can be disregarded.

Hope to hear from y'all soon!

Thanks,
Jason
