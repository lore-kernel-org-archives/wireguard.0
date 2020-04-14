Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10779C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 09:29:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 964C3206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 09:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ocYzkw5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 964C3206E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71bd82e6;
	Tue, 14 Apr 2020 09:19:09 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ea20928f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 09:19:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64b409f1
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=nCnUrjlsKNnlAzPeOQbmySMahbI=; b=ocYzkw5
 YjTBVYkQNngBcsbir9J+YSitQdXdgGIIe1mD7ZcK5K0TVBa2j2T+H1wowxcB1mnw
 ZtVygws6ZZMw10eVshp9BkVBKAQgfs4HIW6PfAwgAXTFxsltFnZFjjOm2pey2Lzr
 LAKI9qbnoProNQg8gIOpuJx/8BEQqGna6jxysHPQOyo/50ZH0srSOI/81yXvVsnb
 TqpYgQv/houE0TB9FkGcUB6owM7Niewmc74Hh1H4jCjmYnuH+GqydgRIvM0mPid9
 7L5i1/BIDvr3VlbmEruP+peHG65rUdUvo45wU8l+EySjmOXEewVIgRd8/PCsuVG7
 4zJgEhdQgB22//g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb4c6d70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 09:19:07 +0000 (UTC)
Date: Tue, 14 Apr 2020 03:28:55 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [ANNOUNCE] wireguard-linux-compat v1.0.20200413 released
Message-ID: <20200414092855.GA1962743@zx2c4.com>
References: <b9c8be5ee78f3f2f@mail.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9c8be5ee78f3f2f@mail.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


This missing hash from the previous email is:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200413.tar.xz
  SHA2-256: cf166348fbb67419528e73049ce001d29131aea367fa6aef9d3e223f7251e116

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl6Vgi8ACgkQSfxwEqXe
A65edQ//fcfg1TWDShOoZsIpabeoot0kbpLpWr5W98McesV19QRnsJTrzLYVU6Ro
yrt6JkAtJHOZlYkMMeoXwY8TvRh9njTTPCOlp6kPdKh8Fqh7RQ3eiKq0MgDK1s89
BZMo7QzHv/5jgbvqMkf5hsmyX7CWw0XG6mbQy3Git9NBbKu0XxzDtYpz/ztry1SV
EWCgDyzWV7hoQbjFmZvT90ODqJ84ybujkpHS1dRNC8j93trG9QdlsPIUlCIkDQr5
XyQbIi58TnZE+3fYdaLbBVwh9N27jdL8GZRGfM9UYdjI5mNZr2ui/aSEeHct0raN
PEGKIH3rD9zMfFqr69AtVlNx8FSrHxt7BboC3M+L4LG1sYHtFpLOPUvUErbLR1Xt
ysg4veVMhOFB2w8hZdSBNtyAOQQ5MT6NCN55BdiZVP8ofJF+85V+TOecXNG9CEvP
B9tK6SUhTIy6UQA1R+O1B5yvvMk22K4B6ewnCAWbO4drBvbgOewofNHdXLuyvNSO
NFlX9g2g2H/p7yn6R2Lz6vBZN7bb4tPyfcCKpFCj6I65RF95q/kQcLsVjYBrybUd
DLaWwbI6fdqKQbtwOR8MMGAmC2JZFIDUEzfewQ/Il2/096qwgUSZW0k7Lt5QF84w
7Eubeqd6BbnInXK2IXYdlw0rN4t7hz2q2NTGVymFo4r2qyiRet0=
=OucQ
-----END PGP SIGNATURE-----
