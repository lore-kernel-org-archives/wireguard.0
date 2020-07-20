Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAF1C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:15:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9F620702
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 15:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9F620702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bf5e818;
	Mon, 20 Jul 2020 14:52:37 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b97c6a79
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:52:35 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id DFC91396;
 Mon, 20 Jul 2020 15:14:56 +0000 (UTC)
Date: Mon, 20 Jul 2020 20:14:56 +0500
From: Roman Mamedov <rm@romanrm.net>
To: <wireguard@lindenberg.one>
Cc: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, "'WireGuard mailing list'"
 <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
Message-ID: <20200720201456.6dfc12df@natsu>
In-Reply-To: <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 20 Jul 2020 17:04:46 +0200
<wireguard@lindenberg.one> wrote:

> Yes, it is up to date.
> Joachim
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jason A. Donenfeld <Jason@zx2c4.com>=20
> Gesendet: Monday, 20 July 2020 16:49
> An: Joachim Lindenberg <wireguard@lindenberg.one>
> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> Betreff: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
>=20
> Is your system fully up to date? `apt update && apt upgrade`?

Seems like it's available only starting from Ubuntu 19.10:
https://packages.ubuntu.com/search?keywords=3Dwireguard&searchon=3Dnames&su=
ite=3Dall&section=3Dall

--=20
With respect,
Roman
