Return-Path: <SRS0=mIIS=PF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E67C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 20:30:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C919260F59
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 20:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C919260F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b54c004;
	Sun, 17 Oct 2021 20:27:08 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2053.outbound.protection.outlook.com [40.92.19.53])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b483714
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Oct 2021 20:27:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Biw5BA9F/glnr4IyNay2ZuGfadUxKOEGkhqjbxUvRlztM1aDNa3hWaivnu43nZbbIgxI2gbQbv1bGuymTGU1r35UC0fjqmKIYIQv6DV7UHDFt+UcpesPiv+N1J5lY5cesYUiKgfI2XOx9U7JVLfRt1/3jfPVtFY6pqgswrE04YdP/QFaWAuOVoDPPrdoWQPiWELGBtuwyVbE4GUURh301DEqiDEvPCWJ7m8ezJlJt236b81ebFMH1K0tIKiQaBTED2rjwCgb8WXwwyT32oOywaux8iRoaaY/ztJxFIV9mhsNYu85KHN7tjY0vywNG33pe0WPlsN1EEkgJe+Ef7vJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxiTzniJvNH83xp7OtY6mAhBbVyCv2CWlnLyMqHfi/0=;
 b=E5uLh5einKE5R0v6/ct3QqJOMOFozAPKtT3v600ASvVsBBA16Adk+DE2T3hyc4myc/kTVVimwrZsUOyApgbMGW1txRu+zRTNAIudfkLLuGSNF4Kx51PkvBYKjEbYdojPDS2ORFRuJkJBmAwgDnayAWkVbXNnSFleJAfMM4PkXyRDZj2DDx28l9PKKANfAPlMSf2Ut1GXGzpCZAcDuFmrB9VnXF6mWgtf5zkohLiRRQ0dhhsy7Td0qyTPCz8+aXhW7cvF7kviXUnBrmIKUMk/rzYfQ/Zb4hXz94Ss3IHzK5F1RNjEM/nx+kG3W0sYIxmD0+lkv+A1QWXGNLJDplCA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxiTzniJvNH83xp7OtY6mAhBbVyCv2CWlnLyMqHfi/0=;
 b=cNZ5LTOtBjYk+0AsHa7N4sSR31tPuqYQ8jtMTmK538PFDffsFZ8ZkcOgCicDM+6xB2UjjDp58ZXCSe4FUYtSvFqIk0HrgTI6o1AEN0llwMZ6O6N9X3odJwKYP68SGZENVro3sI4e7fyY6v3UYDzbSmorSJKkDCELodf2dTL2NhMQnnEZV0pbtLaGhYDSGVJBsqIQ8vuel+ZQwF5Me4k/Wc+fJ7kQXHMkCZfckbNQRG9iA2rueV0QxCYIjeot7vUchhdVdH26wfPlOUBZCqNZ6LVTtE6TlZfGUMfx0p1rWzdF3bdwCcmyX8r4fLNOSNxHWIHZJh78G0f6oaPN3f1P/w==
Received: from DM6PR01MB4444.prod.exchangelabs.com (2603:10b6:5:78::15) by
 DM6PR01MB5929.prod.exchangelabs.com (2603:10b6:5:1dc::32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Sun, 17 Oct 2021 20:27:04 +0000
Received: from DM6PR01MB4444.prod.exchangelabs.com
 ([fe80::647d:582c:3061:3679]) by DM6PR01MB4444.prod.exchangelabs.com
 ([fe80::647d:582c:3061:3679%3]) with mapi id 15.20.4608.018; Sun, 17 Oct 2021
 20:27:04 +0000
From: Aaron Avery <aavery77@hotmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] Fixed null pointer exception when user namespace is empty
Thread-Topic: [PATCH] Fixed null pointer exception when user namespace is empty
Thread-Index: AQHXwtC96MYDvK89b0CKC6uKMKheC6vWXOcAgAE7csQ=
Date: Sun, 17 Oct 2021 20:27:04 +0000
Message-ID: <DM6PR01MB44446FF0D5FB0D11873C337ED7BB9@DM6PR01MB4444.prod.exchangelabs.com>
References: <DM6PR01MB4444144DA39B5197C71D9762D7BA9@DM6PR01MB4444.prod.exchangelabs.com>
 <CAHmME9p=qmQhJ5SQRhorjZJzVDpaX7BK1EA7douTwY856y9t1A@mail.gmail.com>
In-Reply-To: <CAHmME9p=qmQhJ5SQRhorjZJzVDpaX7BK1EA7douTwY856y9t1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 583eb77a-56b8-5d80-754d-5a0f37b0c91c
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2AgAvsIZwCDLYk2e9VbhqNtJ2WJGVANP]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a7c877c-2fc1-48d4-35b0-08d991ac7b88
x-ms-traffictypediagnostic: DM6PR01MB5929:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T6dAl/H10PEW72b/2JDdeC+qiv77b/3yYsJ9lJzx+IbJgUXC+s5BmjrU1gpmxyY/2qU/M2lTCxv/lSWTkc6yCCedorZwoGYbzNReRyixNMZKQMEO1r4r9ZACOAoxsHBb6QyufbAGIw1CeGMOBAgWbNIJOfhxam5qUKHM8SMwaCscS9D2DaFXk0p+8u6InVVpJVzvV0sjfevCGpntT/h2bLDFHfKj/4cmePiD59rsxpjSXI77Be4Gs/wVX1xMjgUGXW3AXm7sdTMgFI7cBCU/di4qogJdohA/Ti8rATgghIruyvwZfYDluLy3WqtK865P/67pAiQ70QdFDuNUGC8W8HFkhETYPJQt9qDK5VJT926GRDKhiGRkgYN/XSW/IMAlzh+BXbass3yDk7ssqyn2l2XDFLWrW7sBOBwFY6gmKUcnLutAmvl6mhncjEt/mV14D8W6vM9hjG2eDVkFi0bR5SkwRigI9z486UrBR7B+3Z1RqLYE4in4Ug+jv/qUM25rUKzDIj+Rbcu3EaLSf48RECHIBQ5tvdogqC1kS2+N44VOB6oPUYjl4mB6hZj14FlyHQzd2NkPwInBddR00FIeeg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 17h3DPGT92L2QM8Wrb35iCaVnyrTWu8KE0trEmQ7c1cVL03rmzxQNUs6LxOR+GwJwU2i3RpIbZWZxUEqxTQcV1eIGW5onXMVqNXQz8NTBRcsqUHehinB/HSUtYqxvv8SeKIni5N92z2QP1GuRulrrA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-48c30.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4444.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7c877c-2fc1-48d4-35b0-08d991ac7b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2021 20:27:04.1463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5929
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

Thank you, Jason. Sorry I missed the Signed-off-by. As I said, I'm not that=
 familiar with Linux development.=0A=
I'm quite sure I have the correct .config for my QNAP's kernel, and the WG =
kernel module I built works perfectly, with this patch. All of the *_NS ent=
ries in their config file are enabled.=0A=
=0A=
After more research, I agree with you completely that this could easily be =
a QNAP-specific bug so shouldn't be merged. As a NAS, they probably have so=
me custom network driver code and may have failed to initialize user_ns in =
this situation. The only somewhat-relevant kernel commit I could find for r=
tnetlink.c is https://github.com/torvalds/linux/commit/f428fe4a04cc339166c8=
bbd489789760de3a0cee and version 4.14.24 is more recent than that.=0A=
=0A=
A lot of people like me use a QNAP NAS as their always-on "home server". Ho=
pefully Google will crawl this message list so that tech-savvy people searc=
hing for Wireguard QNAP will find this patch and have a chance to use WG to=
 remotely access their home network.=0A=
=0A=
- Aaron=0A=
=0A=
From: Jason A. Donenfeld <Jason@zx2c4.com>=0A=
Sent: Saturday, October 16, 2021 7:52 PM=0A=
To: Aaron Avery <aavery77@hotmail.com>=0A=
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>=0A=
Subject: Re: [PATCH] Fixed null pointer exception when user namespace is em=
pty =0A=
=A0=0A=
Hi Aaron,=0A=
=0A=
That patch is missing your Signed-off-by line, so I won't be able to=0A=
take it as-is.=0A=
=0A=
However, I also wonder if it makes sense. I just grepped the entire=0A=
kernel and I couldn't find any other instances of net->user_ns being=0A=
NULL checked. Is it possible that there's a bug in QNAP's kernel=0A=
somewhere? Or you're compiling against the wrong .config so the struct=0A=
offsets are wrong? Or something else? When should net->user_ns be=0A=
NULL?=0A=
=0A=
Thanks,=0A=
Jason=
