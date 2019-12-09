Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB1EC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 12:44:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB3920726
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 12:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="tTOFyL+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB3920726
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30e44899;
	Mon, 9 Dec 2019 12:43:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c79ba7b9
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:43:43 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f423efb
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:43:43 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1575895421; bh=G2z7odAkzR9JBaN8/WVO3+Ty2ThT2Yl0JDnr6Qd9/3I=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=tTOFyL+4Uq96ckD58Ao7++kcXavR49vsruUVidd1AWa3B3mMrusmA/Kf2sj7T0VLR
 MIB45bx893aJpl0rlU5nLL5wBCBIwd0wdM5P5ErLaWpIsvYZIbQrkrASKx96weO14U
 BPscEF/vpdc9oe59QoywhtTGzio9Oc9Z3pbleWloCfHO65opuYFzUtaYJRdzKv2UIu
 WLajaFfafKyzptp9t8JseIDFMp7ioWTKKYCyykaNXcNJ/zLb9/b/FbahlEyHMtkGJs
 mPyo/YftS7nKcsxfyFdCsuKO2VJ0rj39JWPgWiza2p0sRVOsrmcm2wFn67okvLw6eJ
 pMpIq6zN8wN2w==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>
Subject: Re: organization of wireguard linux kernel repos moving forward
In-Reply-To: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
References: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
Date: Mon, 09 Dec 2019 13:43:41 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87d0cxlldu.fsf@toke.dk>
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

> 2) wireguard-tools.git will have the userspace utilities and scripts,
> such as wg(8) and wg-quick(8), and be easily packageable by distros.
> This repo won't be live until we get a bit closer to the 5.6 release,
> but when it is live, it will live at:
> https://git.zx2c4.com/wireguard-tools/ [currently 404s]
> https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-tools.git/
> [currently 404s]

Any plans for integrating this further with iproute2? One could imagine
either teaching 'ip' about the wireguard-specific config (keys etc), or
even just moving the 'wg' binary wholesale into iproute2?

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
