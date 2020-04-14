Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D354FC38A2C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 15:03:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E643F20857
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 15:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ajs124.de header.i=@ajs124.de header.b="zFCsbKNq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E643F20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ajs124.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0737862b;
	Tue, 14 Apr 2020 14:52:58 +0000 (UTC)
Received: from mx1.helsinki.tools (mx1.helsinki.tools [2a01:4f8:c010:4014::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d21080a4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ajs124.de; 
 s=20191020-hss;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U68IPYmsx8WxXGt8V4T0goqEMBGI4q7+zWpbfj6D9w4=; b=zFCsbKNqMqpvV9cxM9fJoEM1wv
 ynfstG2EQwJw1O2k01AWbbPy4EjwISJDoDAlByCc0PdMj3V1n4eRDAOPa+9sYnKG1dhxJ2Px6IxQK
 gvp4D40eub9NeNxXwlOJ+dCgRGJMvG31jtC8W/7Tp96NSOOB4uRBxbw1PP9dJLfN9F7Ycyxejj9vx
 MiygxziJA2/P+sNgZGkjV9Yud3vWD95TB5dtMzcxmRUbnZQ8uO3gbmBT9d3bk62b69qJBeod4n/hL
 GQfCzGabGJO5+mQ4u0cGGZgveTgL/dtScTn1yOZKMbgtnfQhgKzlGs3xCxwdFjfjsrDdEgxgbTOnG
 5saPyhZQ==;
Date: Tue, 14 Apr 2020 17:02:41 +0200
From: ajs124 <wireguard@ajs124.de>
To: <mike@pmfarmwald.com>
Cc: <wireguard@lists.zx2c4.com>
Subject: Re: Is there a way to use wireguard as a non-encrypted VPN?
Message-ID: <20200414170241.2d9d5d6d@desk>
In-Reply-To: <9a3401d61035$4d6b5840$e84208c0$@pmfarmwald.com>
References: <9a3401d61035$4d6b5840$e84208c0$@pmfarmwald.com>
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

On Sat, 11 Apr 2020 12:13:36 -0700
<mike@pmfarmwald.com> wrote:

> I have some older routers that run OpenWRT just fine, but are a bit slow =
at
> Wireguard (3-5 MBytes/s for SMB transfers) and which are too slow for
> playing HD movies.
> For these routers/uses I don't care about security, I just want a VPN to
> tunnel (thru Comcast, and other ISPs that block lots of ports.)
> If there was a way to use Wiireguard=C2=A0with encryption disabled, I'm p=
retty
> sure my performance would be closer to 20-50 MB/s which would be more than
> adequate.
> Thanks.
> Mike Farmwald
>=20

If you're actually just looking for an unencrypted tunnel, there is some st=
andardized stuff like GRE[1] or IP in IP[2] out there.

The Linux Kernel supports both of those natively and it looks to me like Op=
enWRT should be able to configure at least one of them through its interfac=
e.

1: https://en.wikipedia.org/wiki/Generic_Routing_Encapsulation
2: https://en.wikipedia.org/wiki/IP_in_IP
