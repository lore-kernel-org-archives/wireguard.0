Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF9DC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:10:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00C6420732
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 14:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lusan.id.au header.i=@lusan.id.au header.b="czMoniMt";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lusan.id.au header.i=@lusan.id.au header.b="EPKomR2n";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lusan.id.au header.i=@lusan.id.au header.b="A+MFLfuR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00C6420732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lusan.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05acbb91;
	Mon, 23 Nov 2020 14:04:50 +0000 (UTC)
Received: from lutsk.lusan.id.au (lutsk.lusan.id.au [207.192.70.61])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ed4686f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 12:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lutsk.lusan.id.au (Postfix) with ESMTP id 022C6DD29
 for <wireguard@lists.zx2c4.com>; Sat, 21 Nov 2020 22:59:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
 s=KIEV_LUSAN; t=1605963569;
 bh=PxZ5aDIeW2ubv1ImTu0arbPzMZ7GhHlHq7360cHJXUY=;
 h=Subject:From:Reply-To:To:Date;
 b=czMoniMtkTbTHNWV2ICjEBgIofLSkvxR7Uswz1qBUyqmx7Vt0YBPQoFXp6h/UnYtr
 MtK4gXKrqvk7BFxAAsMCEsZIoOEg4kAGUBAFnovq6aDV3mLC8HKQfTpdLLPUyZmXlK
 i4Ms280bv6NI2NuAt8vcCcgs2c1s97AOB81pUtjI=
X-Virus-Scanned: amavisd-new at lutsk.lusan.id.au
Received: from lutsk.lusan.id.au ([127.0.0.1])
 by localhost (lutsk.lusan.id.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hv9yGnJWgriR for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 22:59:25 +1000 (AEST)
Received: from mail.lusan.id.au (unknown [IPv6:2404:9400:10f5:d600::1])
 by lutsk.lusan.id.au (Postfix) with ESMTPS id 14F9FDCB8
 for <wireguard@lists.zx2c4.com>; Sat, 21 Nov 2020 22:59:21 +1000 (AEST)
Authentication-Results: lutsk.lusan.id.au;
 dkim=fail reason="key not found in DNS" header.d=lusan.id.au
 header.i=@lusan.id.au header.a=rsa-sha256 header.s=KIEV_LUSAN
 header.b=EPKomR2n; 
 dkim=fail reason="key not found in DNS" header.d=lusan.id.au
 header.i=@lusan.id.au header.a=rsa-sha256 header.s=KIEV_LUSAN
 header.b=A+MFLfuR; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.lusan.id.au (Postfix) with ESMTP id 09BC3C454
 for <wireguard@lists.zx2c4.com>; Sat, 21 Nov 2020 22:59:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
 s=KIEV_LUSAN; t=1605963559;
 bh=PxZ5aDIeW2ubv1ImTu0arbPzMZ7GhHlHq7360cHJXUY=;
 h=Subject:From:Reply-To:To:Date;
 b=EPKomR2ngNfsE9zQKdhTHo0Be4bK4dd4q0//RxbklSBHihElk2U1a9KmRn2304TtJ
 OUFlOl7eX3ZuN2Y0F3wDom5KFEPYTYR9wfi8zqtS4chqNDfkzh490oa+s/JBevftJq
 tnGdTtKc1eyraPQcLDAKgFS95d9zgO1BZlfo9B9I=
Received: from mail.lusan.id.au ([127.0.0.1])
 by localhost (kiliya.lusan.id.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFFmuwhdWSjW for <wireguard@lists.zx2c4.com>;
 Sat, 21 Nov 2020 22:59:18 +1000 (AEST)
Received: from [IPv6:2406:c500:ffd6:2::5] (unknown [IPv6:2406:c500:ffd6:2::5])
 by mail.lusan.id.au (Postfix) with ESMTPSA id C40A7C452
 for <wireguard@lists.zx2c4.com>; Sat, 21 Nov 2020 22:59:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
 s=KIEV_LUSAN; t=1605963558;
 bh=PxZ5aDIeW2ubv1ImTu0arbPzMZ7GhHlHq7360cHJXUY=;
 h=Subject:From:Reply-To:To:Date;
 b=A+MFLfuRt0dL1tyVr/ZltDSrlQjrsXYu7t80X2mJm+88b1S+D1QghAfrIAE6XIAXW
 D2gJ82teEWW+p3Mu6IckybQccypVPCk09CnWx34LQ8s3UdYG+s2vj2W4UonyUx2x6f
 mQKgLpyswJmVJyoO5nmGOIeBN6q26mkGG2A3SDUY=
Message-ID: <6492535965d6a99ee429384b762b29b8631e2ec5.camel@lusan.id.au>
Subject: Using wg-quick without having it set routes
From: Nikolai Lusan <nikolai@lusan.id.au>
To: wireguard@lists.zx2c4.com
Date: Sat, 21 Nov 2020 22:59:17 +1000
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Nov 2020 15:04:50 +0100
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
Reply-To: nikolai@lusan.id.au
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

I have recently started using wireguard as a VPN between my home
network[s] and my external servers. In addition to this I have been
deploying it on other machines I would like to have connected to my
network via VPN (mostly friends who I want to have access to my
internal network, and me to their machines for remote admin/trouble
shoothing).

I am running Debian and had set things up using
/etc/network/interfaces.d/ files. I was wanting move to use wg-quick
with systemd - trying to bring up newly created interfaces on the main
server/termination point using wg-quick leads to wg trying to create
routes for all IP ranges in "AllowedIPs". I would like to be able to
_not_ have this happen, is it possible? Or should I just stick with the
interfaces.d file method and "auto wg[0-N]"?

- -- 
Nikolai Lusan <nikolai@lusan.id.au>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAl+5DyUACgkQ4ZaDRV2V
L6RDvBAAsxW7dmnX8ObVkiv57IB2tgIUtdSkMNqcx75HfTp7WBBH0t2tq9LZRs8j
TcWrBXM1JK9MCcjtHTVDRZJaAXlwZlvvhnEUjEHkFiBHpU/3yTb053GZpGP2YYnE
al6z1EcifqDXTmO07w8TVhRmYMsS0hFnCtD6AxpS/OHRr676SVfNuyYt6KYeQnOW
0HrD7LkLyukOXtFMQ+0HO0Vd5+I4YN1w5eMKP7nakBEJSPjp5drxNqFVib+MvL4t
b/bNCU+nPvA4noVnsMTwx/Th7UalnqFrpeoQHmuxymGz0EzXuMgTQqdUyZcUPOhN
Hg09+0BQ9X1x8H1qE8BP0T24/tpe6qttqrk5gy7XVZcS/Vpum0GMoPMloBgQK/8t
Jezj2I4O9D+Tc2as/1CeOuqbAoHC6sldSMeJerUv5gihaHQ4Eux4qXcBqrLnKFV7
ndQI2+wmEkd25zYADeia03zbVgBD/Y6iHr9WCIOSaWvm6dFXfQfo+FssSnyqeIOs
f45Ww6n88fJfLLtTIs9eoM+JlnsoXZUWq+aKdloeMRxMfOmcGNUlZn7sa12Jq3dm
xjvI9Y1CTGL8soi6Zb7wrxK2wvr/svDaFYjy9oDd6IRZRAp3zcrnqElYyt7kXr4z
9hg9Vzo76Gh14rrE2Fof6R5HXbc8JgMSODvv9UelWgyMvG2Y/24=
=1T+E
-----END PGP SIGNATURE-----

