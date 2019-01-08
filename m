Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165D8C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jan 2019 20:17:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CAC020859
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jan 2019 20:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=netravnen.de header.i=@netravnen.de header.b="CWOK1lvP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CAC020859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netravnen.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db4300b6;
	Wed, 9 Jan 2019 20:13:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 237d8e69
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 08:16:20 +0000 (UTC)
Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com
 (mailrelay3-2.pub.mailoutpod1-cph3.one.com [46.30.212.2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd0c3036
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netravnen.de; s=20140924;
 h=content-type:in-reply-to:mime-version:date:message-id:from:to:references:
 subject:reply-to:from;
 bh=LvFDxg6Dfw6Gt6fSGAEW/6uTVivDDSmte56doZE7I/E=;
 b=CWOK1lvPDYrRlrOxC5s4vwAeL/BbFVc1U5swmtz0t6Ho+X283VM0ied8GU3yB2AvkUgysczCRTQui
 vOc/r3C85eOxB6rgGeMi9KuouJcnGyFD3a+gs6b5sJ2RVI8otqxhcVCiSgMz+fE48+mUnsMiWxDBJF
 Cv2vxoLjQuaDyjhQ=
X-HalOne-Cookie: d88d030d1b05204a824269db418c147fb8b3cc5a
X-HalOne-ID: 1c3fc878-131e-11e9-bfd0-d0431ea8bb03
Received: from [192.168.43.151] (unknown [212.27.22.143])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 1c3fc878-131e-11e9-bfd0-d0431ea8bb03;
 Tue, 08 Jan 2019 08:19:26 +0000 (UTC)
Subject: Re: DNS tunneling only
References: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>
To: mariogdlt@gmail.com, wireguard@lists.zx2c4.com
From: Christoffer Hansen <christoffer@netravnen.de>
Openpgp: url=https://keybase.io/chri/pgp_keys.asc
Autocrypt: addr=christoffer@netravnen.de; prefer-encrypt=mutual; keydata=
 mDMEXAAS+xYJKwYBBAHaRw8BAQdALbnw1RxC+0YdAmJ1+yfqVZk0c47PpF1yhCZFrmUBPZq0
 LUNocmlzdG9mZmVyIEhhbnNlbiA8Y2hyaXN0b2ZmZXJAbmV0cmF2bmVuLmRlPoiWBBMWCAA+
 FiEEGN0jxVApMJjeBwUqnc8soAjr0ugFAlwAEvsCGwMFCQtJi7UFCwkIBwIGFQoJCAsCBBYC
 AwECHgECF4AACgkQnc8soAjr0uglrwEAswZ2Bl4wdTriXbJ9SxcB0OZdclc9DW8I/Kw+BlIS
 Kh8BAPijRMhM2Nrqf05wLjJ34rtwhBwjIHeXBr+J355R6Z4AuDgEXAAS+xIKKwYBBAGXVQEF
 AQEHQEN5FPc25RO2t5S1PS6u0nBiuP0A4PI+8wl5Rcg5oCEXAwEIB4h+BBgWCAAmFiEEGN0j
 xVApMJjeBwUqnc8soAjr0ugFAlwAEvsCGwwFCQtJi7UACgkQnc8soAjr0uhz6gD/dvSGpgZL
 K4CabU6LtAgSG5+R0uvwGjubKTXUpEhy3FMA/2uvgG5QHH5JLMwY3XJYSTTUBtkYz1jdQF5a
 fgBUZacF
Message-ID: <2dfe0f17-7834-0aac-0b00-30ef4e14f8ed@netravnen.de>
Date: Tue, 8 Jan 2019 09:19:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>
X-Mailman-Approved-At: Wed, 09 Jan 2019 21:13:45 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: christoffer@netravnen.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7524337928613019949=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7524337928613019949==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bHgbnKCpRoVL9mYHsFvDgcfzeLFintGIQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bHgbnKCpRoVL9mYHsFvDgcfzeLFintGIQ
Content-Type: multipart/mixed; boundary="gnXPSJQVjwt4lMBGXHTQp2YkIBt5u6lrr";
 protected-headers="v1"
From: Christoffer Hansen <christoffer@netravnen.de>
Reply-To: christoffer@netravnen.de
To: mariogdlt@gmail.com, wireguard@lists.zx2c4.com
Message-ID: <2dfe0f17-7834-0aac-0b00-30ef4e14f8ed@netravnen.de>
Subject: Re: DNS tunneling only
References: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>
In-Reply-To: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>

--gnXPSJQVjwt4lMBGXHTQp2YkIBt5u6lrr
Content-Type: text/plain; charset=utf-8
Content-Language: da
Content-Transfer-Encoding: quoted-printable


On 07/01/2019 07:09, Mario Garc=C3=ADa wrote:
> Is it possible to tunnel DNS requests only from the client to the
> wireguard server?

Policy based outbound firewalling, udp dport 53?

--=20
Cheers

Christoffer


--gnXPSJQVjwt4lMBGXHTQp2YkIBt5u6lrr--

--bHgbnKCpRoVL9mYHsFvDgcfzeLFintGIQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQQY3SPFUCkwmN4HBSqdzyygCOvS6AUCXDRdDQAKCRCdzyygCOvS
6CZ2AQD5fBEbN8xAHwl6fUiW/4U/dLEosxbBZJHUV/cqWJhPsQEAkhV3/32+LN//
CW7qCYUBqieQdgNNzmdKaodhcKvdPgY=
=su2c
-----END PGP SIGNATURE-----

--bHgbnKCpRoVL9mYHsFvDgcfzeLFintGIQ--

--===============7524337928613019949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7524337928613019949==--
