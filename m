Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC16C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:29:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E666C21871
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:29:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdoC692P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E666C21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5622985;
	Wed, 2 Jan 2019 18:26:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c89c3b49
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 20:27:48 +0000 (UTC)
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 938a53a2
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 20:27:48 +0000 (UTC)
Received: by mail-it1-x12e.google.com with SMTP id g76so38847805itg.2
 for <wireguard@lists.zx2c4.com>; Tue, 01 Jan 2019 12:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Sp+G2q6WnhNzvNj2JzcBD4NfV0lA1E+uLjoWQp+w6sg=;
 b=rdoC692P7c6oYMwbavmlL9ObB+5O5UjrJ2mdyvnW0XotsVyARCJ/hOG0f8+Ne84OAl
 4MpWEg/Mg564E1JyoLxjw05G58KjvlxHdqOcTbMZQYcX4j5vJOTZnsMist0G3hjHAmjS
 Yyp9iwG0oBcTGKTUPIkqv5EotRZZDg21nhPQGZQenkeNlCafgMk17eb2XWtferwP4LSx
 56nmN0s8/MwNU5Of+6Bh6/2wRyIbKlDBQOvhmlJPRdFHT7yr2ckxNSYDB35TE/HVRzuK
 TaHZ4gUPeaI95acoJOOUMRkOV5aaIikOd08IA7F3pQ7m+tBntw3Ae6C+nlohlPUMsT21
 Q4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Sp+G2q6WnhNzvNj2JzcBD4NfV0lA1E+uLjoWQp+w6sg=;
 b=NNErsmVlyjBi9K5B3Ku+AzRg6iqluoM0FO/7Wk8/D/H+4LctqNTyCLDKZnvbPeXsoy
 LjjZZTmTQD5fR/2Bjz0FE+YznwHhi3LAaF4ZkGMI9fqAipqyFjIjaempBGfA9hrEUU6g
 l1msxHwU2Zx6R79I0u7Zt6Nk9q7lFaUwAw9qJ7Muy2hEfE0SJZBUfoHWyiCkRCIjUqaw
 j+XGS5PE3aQWykMjx+PlRqlxocQlDcBxmMSQsGW0jxGuMdhBbn4B6Yt3ffzCBzsFpKvc
 u73+T7wJU6t6tj16H4w0NOeXRhQcPAmDINZ0TWmRq96lahlyoeyJ68ob0RSlT2yWELco
 QpuA==
X-Gm-Message-State: AA+aEWarl4mn61hhK1ST5e58dnnBfGv/lp7rqrhjdwYSetEejCUJ4LgJ
 nidUrwR5kAW6JU72v3uwOW23FbU+I7MXxC42g5foiprt
X-Google-Smtp-Source: AFSGD/VPDln6wbA6NQrlLzpZ5oArYB1VmIq6U/PgnnPS3T/6ZT6YX2URsnEkyyawlErNBuNODW9RvTP/nNq7UUtwS2E=
X-Received: by 2002:a02:98d2:: with SMTP id c18mr25802486jak.11.1546374604863; 
 Tue, 01 Jan 2019 12:30:04 -0800 (PST)
MIME-Version: 1.0
From: Justin McAfee <justinamcafee@gmail.com>
Date: Tue, 1 Jan 2019 14:29:53 -0600
Message-ID: <CAFf4X82x1VdU8vDntbrOyFJgLFKYEov-yXLiKB9MkAJ_sLvRwA@mail.gmail.com>
Subject: iOS passing data around VPN
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:26:38 +0100
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
Content-Type: multipart/mixed; boundary="===============3912066332570653400=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3912066332570653400==
Content-Type: multipart/alternative; boundary="000000000000033c64057e6b658a"

--000000000000033c64057e6b658a
Content-Type: text/plain; charset="UTF-8"

BLUF: Linux Server passes data for Linux and Android clients. No traffic
flow for iOS.


 Server Debian 9 all updates
Devices
Samsung s7 - Works
Samsung s6 active - Works
Linux Mint 19.1 - Works
iPhone 5SE iOS 12.1, Latest App Store WG 0.0.20181104 (7)  - Connects,
Server shows latest handshake.
iPhone 6 iOS 12.1,  Latest App Store WG 0.0.20181104 (7) - Connects, Server
shows latest handshake.
iPad Pro iOS 12.1, Latest App Store WG 0.0.20181104 (7) - Connects, Server
shows latest handshake.

nload and other traffic programs on the server show that data is being
passed when the devices marked *works*  are connected. No traffic is
received from iOS devices (beyond the handshakes). However, iOS is ignoring
the failure of the VPN, leaves it marked active and receives data from the
cellular network. But, if the iOS device is on the same wifi/lan as the
server, then no data is passed and a hard failure is noted by the iOS
devices.

Any help is appreciated,

Justin McAfee, Owner
McAfeeMediaSolutions.com

--000000000000033c64057e6b658a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>BLUF: Linux Server passes data for Linux and Android =
clients. No traffic flow for iOS. <br></div><div><br></div><div><br></div><=
div>=C2=A0Server Debian 9 all updates <br></div><div>Devices <br></div><div=
>Samsung s7 - Works <br></div><div>Samsung s6 active - Works</div><div>Linu=
x Mint 19.1 - Works <br></div><div>iPhone 5SE iOS 12.1, Latest App Store WG=
 0.0.20181104 (7)=C2=A0 - Connects, Server shows latest handshake. <br></di=
v><div>iPhone 6 iOS 12.1,=C2=A0 Latest App Store WG 0.0.20181104 (7) - Conn=
ects, Server shows latest handshake. <br></div><div>iPad Pro iOS 12.1, Late=
st App Store WG 0.0.20181104 (7) - Connects, Server shows latest handshake.=
 <br></div><div><br></div><div>nload and other traffic programs on the serv=
er show that data is being passed when the devices marked *works*=C2=A0 are=
 connected. No traffic is received from iOS devices (beyond the handshakes)=
. However, iOS is ignoring the failure of the VPN, leaves it marked active =
and receives data from the cellular network. But, if the iOS device is on t=
he same wifi/lan as the server, then no data is passed and a hard failure i=
s noted by the iOS devices. <br></div><div><br></div><div>Any help is appre=
ciated, <br></div><div><br></div><div>Justin McAfee, Owner</div><div>McAfee=
MediaSolutions.com<br></div></div>

--000000000000033c64057e6b658a--

--===============3912066332570653400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3912066332570653400==--
