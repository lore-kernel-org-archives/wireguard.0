Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D21C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 13:31:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539E864EEE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 13:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 539E864EEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34692554;
	Mon, 15 Mar 2021 13:31:16 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1a7f5f7e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 13:31:14 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 24A5D1E3037;
 Mon, 15 Mar 2021 09:31:13 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 02D361E302F;
 Mon, 15 Mar 2021 09:31:12 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: Enhance the "AllowedIPs"
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
Date: Mon, 15 Mar 2021 08:31:12 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E047ABCC-8C43-4608-A518-B48BF9976B58@lonnie.abelbeck.com>
References: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
To: Feng Li <lifeng1519@gmail.com>
X-Mailer: Apple Mail (2.3445.104.17)
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


> On Mar 15, 2021, at 2:57 AM, Feng Li <lifeng1519@gmail.com> wrote:
>=20
> As we know, the AllowedIPs will set the route table. However, if we
> want to set the CIDR, but except for some CIDR range, it's not so easy
> and out of the box. For example, if I want to route my all traffic,
> except the 192.168.0.0/16. I have to calculate the two CIDR
> difference:
>=20
> AllowedIPs =3D
> 0.0.0.0/1 + 128.0.0.0/1 - 192.168.0.0/16
> =3D
> =
0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2=
,128.0.0.0/2,192.0.0.0/9,192.128.0.0/11,192.160.0.0/13,192.169.0.0/16,192.=
170.0.0/15,192.172.0.0/14,192.176.0.0/12,192.192.0.0/10,193.0.0.0/8,194.0.=
0.0/7,196.0.0.0/6,200.0.0.0/5,208.0.0.0/4,224.0.0.0/3,10.99.0.0/24

For giggles, I though this might be a clever solution:
--
[Peer]
PublicKey =3D <remote PublicKey>
Endpoint =3D remote-vpn:51820
AllowedIPs =3D 0.0.0.0/0, ::/0

[Peer]
PublicKey =3D <local PublicKey>
Endpoint =3D 127.0.0.1:51820
AllowedIPs =3D 192.168.0.0/16
--

I tested, but wg silently ignores peers to itself.

Lonnie



