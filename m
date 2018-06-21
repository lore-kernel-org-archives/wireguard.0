Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b20d0825
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 00:17:31 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3e21f82
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 00:17:31 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 930BB1E3038
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 20:22:21 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-148.om.om.cox.net
 [70.184.211.148])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 6505A1E3037
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 20:22:21 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180620` Available
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9oP5tPNbyYECJN4wgcPc4zg3QE9n2edx_TQQmn5tCbWjA@mail.gmail.com>
Date: Wed, 20 Jun 2018 19:22:20 -0500
Message-Id: <3052A12F-768F-4E3B-AF68-77CB34D58D98@lonnie.abelbeck.com>
References: <b9a4b41fbe912803@frisell.zx2c4.com>
 <8B706799-0A06-449B-960B-08C017C58412@lonnie.abelbeck.com>
 <CAHmME9r+uOOT_50zG3XQwB79reOhFBysE04=3=btubVQMdbuyQ@mail.gmail.com>
 <981DB695-E660-431D-B5E9-ABD2D1352F9F@lonnie.abelbeck.com>
 <CAHmME9oP5tPNbyYECJN4wgcPc4zg3QE9n2edx_TQQmn5tCbWjA@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jun 20, 2018, at 6:47 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hey Lonnie,
>=20
> Thanks for helping to debug this.
>=20
> On Thu, Jun 21, 2018 at 12:37 AM Lonnie Abelbeck
> <lists@lonnie.abelbeck.com> wrote:
>> Hunk #1 only does the trick, though performance is ever so slightly =
slower than before overall.
>=20
> It's good to hear that hunks #2 and #3 don't have much an effect,
> though it does still seem to have _some_ effect.
>=20
> Looks like hunk 1 is rather worrisome though. Can you try out
> https://=D7=90.cc/eaxxpxbB and let me know if it has any effect?

That patch, as is, is very bad
--
[SUM]   0.00-30.00  sec  1.26 GBytes   360 Mbits/sec   98             =
sender
[SUM]   0.00-30.03  sec  1.25 GBytes   358 Mbits/sec                  =
receiver

I then edited the patch to add back in local_bh_disable() / =
local_bh_enable(), much better
--
[SUM]   0.00-30.00  sec  2.62 GBytes   751 Mbits/sec  1389             =
sender
[SUM]   0.00-30.00  sec  2.61 GBytes   748 Mbits/sec                  =
receiver

essentially back to 0.0.20180531 performance, hunk #1 from previous =
patch and hunk #1 from the latest patch.


> Are you sure
> the benchmark conditions were the same in other respects?

Yes, quite sure, but there is some variation of the iperf3 results on =
each run ... I perform a few runs and then pick a median sample.

Lonnie
