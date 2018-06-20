Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3464ab4
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 23:42:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ae5d931
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 23:42:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2660062f
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 23:41:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55f062b0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 23:41:18 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id a5-v6so1475723otf.12
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 16:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <b9a4b41fbe912803@frisell.zx2c4.com>
 <8B706799-0A06-449B-960B-08C017C58412@lonnie.abelbeck.com>
 <CAHmME9r+uOOT_50zG3XQwB79reOhFBysE04=3=btubVQMdbuyQ@mail.gmail.com>
 <981DB695-E660-431D-B5E9-ABD2D1352F9F@lonnie.abelbeck.com>
In-Reply-To: <981DB695-E660-431D-B5E9-ABD2D1352F9F@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Jun 2018 01:47:10 +0200
Message-ID: <CAHmME9oP5tPNbyYECJN4wgcPc4zg3QE9n2edx_TQQmn5tCbWjA@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180620` Available
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

Hey Lonnie,

Thanks for helping to debug this.

On Thu, Jun 21, 2018 at 12:37 AM Lonnie Abelbeck
<lists@lonnie.abelbeck.com> wrote:
> Hunk #1 only does the trick, though performance is ever so slightly slowe=
r than before overall.

It's good to hear that hunks #2 and #3 don't have much an effect,
though it does still seem to have _some_ effect.

Looks like hunk 1 is rather worrisome though. Can you try out
https://=D7=90.cc/eaxxpxbB and let me know if it has any effect?

> Is this issue because our project uses CONFIG_PREEMPT=3Dy ?

Yes, generally, preemption is good for latency but bad for throughput.
I was trying to make the queues a bit more preemption friendly, but
this seemed to have killed performance, so I'll be revisiting this,
because I don't want to make things worse than before.

I find it very strange that 20180531 is still faster than the last
patch I sent you. The only other difference along the hot path,
besides the last patch I sent you, between the two snapshots is
https://git.zx2c4.com/WireGuard/patch/?id=3Db7b193f499d4acd8a620163ec358c08=
30e856c9e
and this is _removing_ code, so I'd think this would actually
contribute to a speed increase, not a slight decrease. Are you sure
the benchmark conditions were the same in other respects?

Jason
