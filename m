Return-Path: <SRS0=p9ce=ZL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4CCC432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2019 16:07:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 101F322362
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Nov 2019 16:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="dsKpxv7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 101F322362
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b28cb6e9;
	Tue, 19 Nov 2019 16:07:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8f8384e
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2019 16:07:20 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f252b81
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Nov 2019 16:07:19 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1574179638; bh=8ruBbKtu+CPus2bgIZqZ5JYDyMtq4FGDZ/fRY1obxOI=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=dsKpxv7ZcrEooUc2GNfJ7Y/s8hC464Oa5PVCAGDvVHoDBSfJ52lYQtcTO93aI/Ff8
 ZkUd7/uf1GlCroG/mqI2JuGPpYItcg+qmXzxjmKCj3BJP1aOvQ0o2Jx2vsnvRlWC6p
 lZcSaxn8wFVb4Yyr5WMjyPylHrZJGGfveAduAnrm8i3bvFpB+DP4Rjv2dDsm7Q2ATu
 WZ21CRewR9Z71xxph0JRF2BN1dnNW9hcJfb2klhMB/MwZdz2w45FwJHG74tcZxajJv
 Bl6lrKWwvL7Gb4grMG8TiR2SsqR1Zc0GQIRgzTkBFfZVfY8vjm5+rm5KXmTgqaAVzP
 oxtmV+b4x5QYQ==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WireGuard to port to existing Crypto API
In-Reply-To: <CAHmME9pPDQxVO5m1gRzWkDn5GfRn7yDdNa3_hy7QC-1RmE0H=A@mail.gmail.com>
References: <CAHmME9pmfZAp5zd9BDLFc2fWUhtzZcjYZc2atTPTyNFFmEdHLg@mail.gmail.com>
 <CAHmME9pPDQxVO5m1gRzWkDn5GfRn7yDdNa3_hy7QC-1RmE0H=A@mail.gmail.com>
Date: Tue, 19 Nov 2019 17:07:17 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87eey3alze.fsf@toke.dk>
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey folks,
>
> Small update on this thread: it turns out that at the same time as I
> was stepping toward compromising and using the old crypto API here
> with this thread, other kernel developers were interested in
> compromising to upstream some aspects of Zinc. The result is that
> everybody took constructive steps toward each other, and the first
> part of Zinc has been merged:
>
> https://lore.kernel.org/linux-crypto/CAHmME9rxGp439vNYECm85bgibkVyrN7Qc+5v3r8QBmBXPZM=Dg@mail.gmail.com/
>
> It's not called "Zinc" any more, and some of the design decisions I
> liked aren't there, but I think the lion's share of what we were after
> is there, and a few other pieces should be possible to upstream one at
> a time.
>
> These steps forward should unlock WireGuard upstreaming, which I
> expect to get rolling again soon. WireGuard is probably mostly okay,
> but I still do anticipate review with lots of feedback to incorporate,
> since now there's more impetus for people to take the patch submission
> seriously. I'll keep this list updated as we move forward.

This is great news! I'll keep by eyes peeled for the wireguard
submission. Do note that net-next closes during the merge window,
though, so you'll probably have to wait until after 5.5-rc1 is out the
door to submit that (and so we'll get Wireguard with Linux 5.6).

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
