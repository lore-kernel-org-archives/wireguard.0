Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F12CCD195
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Oct 2025 02:12:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ac1e83a;
	Mon, 20 Oct 2025 02:12:35 +0000 (UTC)
Received: from mail.pineview.net (mail.pineview.net [203.33.246.11])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 458efc1b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Oct 2025 02:12:29 +0000 (UTC)
Received: from smtpclient.apple (salt.oeg.com.au [203.33.246.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.pineview.net (Postfix) with ESMTPSA id 7195180105;
 Mon, 20 Oct 2025 12:42:24 +1030 (ACDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike O'Connor <mike@pineview.net>
Mime-Version: 1.0 (1.0)
Subject: Re: Laptop using tunnel on iPhone through hotspot 
Date: Mon, 20 Oct 2025 12:42:13 +1030
Message-Id: <38FEDEE6-1770-41E7-8718-18978650C993@pineview.net>
References: <DU5PR08MB10852082E6694229E649E4F83A0F5A@DU5PR08MB10852.eurprd08.prod.outlook.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <DU5PR08MB10852082E6694229E649E4F83A0F5A@DU5PR08MB10852.eurprd08.prod.outlook.com>
To: Jonathan Aquilina <jaquilina@eagleeyet.net>
X-Mailer: iPhone Mail (22G100)
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

Hi Jonathan

iPhobe do not allow this, and I might be wrong but I think this is also the c=
ase with Android.

You will need to run a VPN on your laptop.

Cheers

> On 20 Oct 2025, at 11:26=E2=80=AFam, Jonathan Aquilina <jaquilina@eagleeye=
t.net> wrote:
>=20
> =EF=BB=BFGood evening,
>=20
> I have a very interesting use case that I would like to run by the list.
>=20
> My iPhone is peered with my opnsense router which has WireGuard.
>=20
> Is it possible if I have a laptop connected to my phone's hotspot to have a=
ll network traffic go over the WireGuard tunnel that my phone is connected t=
o?
>=20
> Regards,
> Jonathan

