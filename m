Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8B9C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 09:19:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dc6cf88;
	Sun, 19 Feb 2023 09:19:45 +0000 (UTC)
Received: from smtp3.m7n.se (smtp3.m7n.se [2a03:94e0:255d:2a01:8ce9::4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6010fe6e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 09:19:42 +0000 (UTC)
Received: from [IPv6:::1] (unknown [IPv6:2001:470:de6f:1240::101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp3.m7n.se (Postfix) with ESMTPSA id 7106E3565C10;
 Sun, 19 Feb 2023 09:19:40 +0000 (UTC)
Date: Sun, 19 Feb 2023 10:19:39 +0100
From: Mikma <mikma.wg@lists.m7n.se>
To: wireguard@lists.zx2c4.com, Nico Schottelius <nico.schottelius@ungleich.ch>,
 Mike O'Connor <mike@pineview.net>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Source IP incorrect on multi homed systems
User-Agent: K-9 Mail for Android
In-Reply-To: <875yby83n2.fsf@ungleich.ch>
References: <87bklqd7vb.fsf@ungleich.ch>
 <c83fee12-bef7-d09f-0cc5-d0a193d783c5@pineview.net>
 <875yby83n2.fsf@ungleich.ch>
Message-ID: <60C522A0-DFAA-4A25-9E6C-8C4AF0962F5B@lists.m7n.se>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

Have you tried setting the preferred src address of the route(s) to the add=
resses you desire?

From=20"man ip":

> src ADDRESS the source address to prefer when sending to the destination=
s covered by the route prefix=2E=20

On 19 February 2023 09:01:31 CET, Nico Schottelius <nico=2Eschottelius@ung=
leich=2Ech> wrote:
>
>Let me rephrase the problem statement:
>
>    - ping and http calls to the multi homed machine work correctly:
>      I can ping 147=2E78=2E195=2E254 and the reply contains the same add=
ress=2E
>      I can ping 195=2E141=2E200=2E73 and the reply contains the same add=
ress=2E
>      I can curl 147=2E78=2E195=2E254 and the reply contains the same add=
ress=2E
>      I can curl 195=2E141=2E200=2E73 and the reply contains the same add=
ress=2E
>
>    - wireguard does NOT work because it changes the reply address:
>      A packet sent to 147=2E78=2E195=2E254 is being replied with 195=2E1=
41=2E200=2E73
>
>In general, processes reply with the IP address that was used to contact
>them and not with the outgoing interface address, which would also break
>adding IP addresses to the loopback interface=2E
>
>For full detail, see ip addresses [0] and routing below [1] and tests
>executed [2]=2E
>
>I believe that this is a bug in wireguard=2E
