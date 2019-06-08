Return-Path: <SRS0=8966=UH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065F7C28CC5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Jun 2019 07:35:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27AD620665
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Jun 2019 07:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27AD620665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=activezone.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0169f61a;
	Sat, 8 Jun 2019 07:35:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f396bb68
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jun 2019 07:35:21 +0000 (UTC)
Received: from titan-smx.freebsdcloud.com (titan-smx.freebsdcloud.com
 [82.206.32.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e45eb5b
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jun 2019 07:35:21 +0000 (UTC)
Received: from trinitron.activezone.de (trinitron.vl8-han.freebsdcloud.com
 [159.69.229.114])
 by titan-smx.freebsdcloud.com (8.15.2/8.15.2) with ESMTPS id x587XmKv022330
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 8 Jun 2019 09:33:54 +0200 (CEST)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: ns2.freebsdcloud.com: Host
 trinitron.vl8-han.freebsdcloud.com [159.69.229.114] claimed to be
 trinitron.activezone.de
Received: from mitteilung.com by MTA1  with ESMTP id x587WrX0074245;
 Sat, 8 Jun 2019 09:32:53 +0200 (CEST)
X-Authentication-Warning: trinitron.activezone.de: Host localhost [127.0.0.1]
 claimed to be mitteilung.com
MIME-Version: 1.0
Date: Sat, 08 Jun 2019 09:32:53 +0200
From: Markus Grundmann <markus@activezone.de>
To: Paul Zillmann <paul@zil.li>
Subject: Re: Overlapping AllowedIPs Configuration
Mail-Reply-To: markus@activezone.de
In-Reply-To: <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li>
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
 <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li>
Message-ID: <96221f17c7db0e367e8afa1270616dc1@activezone.de>
X-Sender: markus@activezone.de
User-Agent: Roundcube Webmail/1.3.4
Cc: henningreich@gmail.com, wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: markus@activezone.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4128331940723240055=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4128331940723240055==
Content-Type: multipart/alternative;
 boundary="=_a9a6158a00c161ac279002038c09d66a"

--=_a9a6158a00c161ac279002038c09d66a
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

I'm running a full meshed WireGuard-based Network between three ASN with
BIRD 1.6.4 & 2.0.4 over OSPFv2/v3 without any issues. When I configure
my transport networks I use the following "allowed-ips" schema:
<a.b.c.d/30>,224.0.0.5/32,0.0.0.0/0,::/0 

a.b.c.d = transport network 

I know some networks are redundent but it works very fine in my case
over LTE, DSL and some other L2 links. 

Regards, 

Markus 

Am 2019-05-25 20:39, schrieb Paul Zillmann:

> make this behavior optional. Right now Wireguard isn't very friendly to dynamic routing.
--=_a9a6158a00c161ac279002038c09d66a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt'>
<p>I'm running a full meshed WireGuard-based Network between three ASN with=
 BIRD 1.6.4 &amp; 2.0.4 over OSPFv2/v3 without any issues. When I configure=
 my transport networks I use the following "allowed-ips" schema: &lt;a.b.c=
=2Ed/30&gt;,224.0.0.5/32,0.0.0.0/0,::/0</p>
<p>a.b.c.d =3D transport network</p>
<p>I know some networks are redundent but it works very fine in my case ove=
r LTE, DSL and some other L2 links.</p>
<p>Regards,</p>
<p>Markus</p>
<p>Am 2019-05-25 20:39, schrieb Paul Zillmann:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><!-- html ignored --><!-- head ignored --><!-- meta ig=
nored -->
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
make this behavior optional. Right now Wireguard isn't very friendly to dyn=
amic routing.<br /> <span style=3D"white-space: nowrap;"></span></div>
</blockquote>

</body></html>

--=_a9a6158a00c161ac279002038c09d66a--

--===============4128331940723240055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4128331940723240055==--
