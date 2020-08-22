Return-Path: <SRS0=L39c=CA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F467C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:38:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 488C82078A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uhEUnK7w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 488C82078A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98e66f0c;
	Sat, 22 Aug 2020 19:11:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb414c16
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 19:11:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a109f94f
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=HWpRURwsxPnBmmTXG2hR0Du11xk=; b=uhEUnK7
 wNUOid/vVDZKBEc6mcS+yDhfYTPqbfTPY9gfINB0cpxaERt3Jd2c5d56DyOUn9si
 xnw53+fIaAZKlxfQqbLAg2t0jMRwFIL2RkeBzWUt+q15bkD02xGheW4Khig0IzY2
 4U3Ybm6Uh5/Cf+cb3ZoVVNzvLsJuIQ58gDiFDL+R6oZWk1A8GeEoe9iNrVfc3iiM
 JAubATtQAZD/aAagzxYY3tiveMgI4GLRMo246tBQDrvdpnpWWlGctffDG3abYgBg
 CdNvNq1UmOqlcq5t2QsDtjEWD1310IdjoxnggKLOheH7EcV0+RVZBb3ExSa1anAP
 kPC8JxkOdTVqJqg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 85fe0010
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Aug 2020 19:11:39 +0000 (UTC)
Date: Sat, 22 Aug 2020 21:38:20 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [ANNOUNCE] wireguard-tools v1.0.20200820 released
Message-ID: <20200822193820.GA13202@zx2c4.com>
References: <9df92b74b25ead68@mail.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9df92b74b25ead68@mail.zx2c4.com>
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

Looks like the SHA256 was missing. Sorry about that.

$ sha256sum wireguard-tools-1.0.20200820.tar.xz 
7735a04c68fffb101a10a67e3bd97a171f2b8eb47e9ddce2be68eb6538b013d0  wireguard-tools-1.0.20200820.tar.xz

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl9Bc8sACgkQSfxwEqXe
A65FKg//XfGibh24rSSjzumtQv+piCRARHBuJYJntm+WwDWP14almwhLYmzvMrIX
EUftU0SV7/BbKAYbx7qclw1EDpGCnj3OVdfbeSqy+Mi7RyfJ/uIvDr1bix/b1Sc3
Ss+jXFoEJ1u3p9JT/LywiCVrsiAKDICL/DTkv2HlJ7gcGfKHgysTmYeA0v4Rolq4
/ZqdQzgrj524PpRHZw/u2opQKzxD7hLjLiYJX07AISZh7XHhMhtyLdZOuUgSetlQ
pSccWz1wdLqrbZ9jYeoB8DOYhHwZbFXkkeFXlBf3/g1JqK3Om6OHPOTQDKQrbapf
moGS4SS/MrD9ZACTqJX5V0hClqeZlsHiD2yIqN14j7bQ1OC/Yz2g3EnxGB58zxBw
ii4x/b4Ig38XNjoh3DCDCjWv00FkBAhkIBqm9Z8A1rzqJFGxPqRxQuFl8xY7sJq4
cCjAtUF+em2+GZSWj9qWljVK0FhJr+yFaTBBlByTFdjgB5NGxbxaCoz1vChJIcrN
43JJ5Th2vhUOEVXndhcmqeKuMcteDV/KtQ5gKxh+4WpUo1viiagUI6IZwUnU2mrW
uyMTFu/jiQIVaHc5NnFjZwmRbMZi3eQfDtFIG3nN30sB15suMPXUxNkPOjqpEthF
Ab3W/vdMD3BrUaApXi+coJiplH9uqkrfNvK2u0uAer4L+LzcaZY=
=/Vw1
-----END PGP SIGNATURE-----
