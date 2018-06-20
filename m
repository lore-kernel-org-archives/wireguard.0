Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d1aab05
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 22:32:36 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3d9bfc8
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 22:32:36 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id B46351E30BA
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 18:37:25 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-148.om.om.cox.net
 [70.184.211.148])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 4E5241E30B8
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 18:37:25 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180620` Available
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9r+uOOT_50zG3XQwB79reOhFBysE04=3=btubVQMdbuyQ@mail.gmail.com>
Date: Wed, 20 Jun 2018 17:37:20 -0500
Message-Id: <981DB695-E660-431D-B5E9-ABD2D1352F9F@lonnie.abelbeck.com>
References: <b9a4b41fbe912803@frisell.zx2c4.com>
 <8B706799-0A06-449B-960B-08C017C58412@lonnie.abelbeck.com>
 <CAHmME9r+uOOT_50zG3XQwB79reOhFBysE04=3=btubVQMdbuyQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jun 20, 2018, at 4:24 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hey Lonnie,
>=20
> Thanks for letting me know. Can you tell me if this patch --
> https://=D7=90.cc/GJpT3gVY -- brings the performance back up? And if =
that
> works, can you then try each of those three fragments separate to see
> which one has an actual effect (or perhaps all do).
>=20
> Jason

Hunk #1 only does the trick, though performance is ever so slightly =
slower than before overall.

Is this issue because our project uses CONFIG_PREEMPT=3Dy ?

Data below.

Lonnie

-- 0.0.20180531 reference --
[SUM]   0.00-30.00  sec  2.65 GBytes   758 Mbits/sec  571             =
sender
[SUM]   0.00-30.02  sec  2.64 GBytes   756 Mbits/sec                  =
receiver

-- full patch --  hunk #1, #2 and #3
[SUM]   0.00-30.00  sec  2.53 GBytes   724 Mbits/sec  921             =
sender
[SUM]   0.00-30.01  sec  2.52 GBytes   722 Mbits/sec                  =
receiver

-- hunk #1 only --
[SUM]   0.00-30.00  sec  2.57 GBytes   735 Mbits/sec  807             =
sender
[SUM]   0.00-30.01  sec  2.56 GBytes   733 Mbits/sec                  =
receiver

-- hunk #2 only --
[SUM]   0.00-30.00  sec  1.52 GBytes   434 Mbits/sec   91             =
sender
[SUM]   0.00-30.02  sec  1.51 GBytes   433 Mbits/sec                  =
receiver

-- hunk #3 only --
[SUM]   0.00-30.00  sec  1.51 GBytes   432 Mbits/sec  330             =
sender
[SUM]   0.00-30.03  sec  1.50 GBytes   430 Mbits/sec                  =
receiver
