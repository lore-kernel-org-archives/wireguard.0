Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24383C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 14:20:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2D020825
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 14:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lusan.id.au header.i=@lusan.id.au header.b="jS5BMAnN";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lusan.id.au header.i=@lusan.id.au header.b="TzLN3Ifk";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lusan.id.au header.i=@lusan.id.au header.b="PYlOMkOk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2D020825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lusan.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99446a48;
	Sun, 29 Nov 2020 14:14:28 +0000 (UTC)
Received: from lutsk.lusan.id.au (lutsk.lusan.id.au [2600:3c03:e000:11::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d2b4855e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 14:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lutsk.lusan.id.au (Postfix) with ESMTP id C6A28EA65
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 00:20:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
 s=KIEV_LUSAN; t=1606659635;
 bh=H0orqrT1u99pSyfWUiMSDmhZ/eHim988cxhqbcfTuy0=;
 h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
 b=jS5BMAnNXAkWwrCIpsvbaREJZfKpGDGFKgD+KmixtJNze5i2yFuyinMHu1o5inOXe
 o0dOAuApdL5e8MLJb93oV7WHvh39J3dG+8xDABAMmc5RwMhrUQim3pjXDq7fdBNha6
 /Gm5YGBqBU0+8R9gpb2xN7maDpSmwH3tlbtHMy4g=
X-Virus-Scanned: amavisd-new at lutsk.lusan.id.au
Received: from lutsk.lusan.id.au ([127.0.0.1])
 by localhost (lutsk.lusan.id.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rAbnogW8rNaW for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 00:20:35 +1000 (AEST)
Received: from mail.lusan.id.au (unknown [IPv6:2404:9400:10f5:d600::1])
 by lutsk.lusan.id.au (Postfix) with ESMTPS id F3F49EAB7
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 00:20:34 +1000 (AEST)
Authentication-Results: lutsk.lusan.id.au;
 dkim=fail reason="key not found in DNS" header.d=lusan.id.au
 header.i=@lusan.id.au header.a=rsa-sha256 header.s=KIEV_LUSAN
 header.b=TzLN3Ifk; 
 dkim=fail reason="key not found in DNS" header.d=lusan.id.au
 header.i=@lusan.id.au header.a=rsa-sha256 header.s=KIEV_LUSAN
 header.b=PYlOMkOk; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.lusan.id.au (Postfix) with ESMTP id 0EABDE3AC
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 00:20:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
 s=KIEV_LUSAN; t=1606659633;
 bh=H0orqrT1u99pSyfWUiMSDmhZ/eHim988cxhqbcfTuy0=;
 h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
 b=TzLN3IfkX9zEjBLZkbf/0vTWemws8Ye+5RFeJd94YKiFka6dC2YJq3sfUvfivQ0yT
 4itrd2/ijKMoNKyNz1A3WngYMBjVlwE0QCN8mkCEx/XJMi/FNH/0fGpDQeRm3wTA9I
 38vDvuoMtbtRHA1HlUv+WBWpTAX8iGXauNmz7EYk=
Received: from mail.lusan.id.au ([127.0.0.1])
 by localhost (kiliya.lusan.id.au [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6GO7mwcZ97q for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 00:20:32 +1000 (AEST)
Received: from [IPv6:2406:c500:ffd6:2::5] (unknown [IPv6:2406:c500:ffd6:2::5])
 by mail.lusan.id.au (Postfix) with ESMTPSA id CD5F7E3AA
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 00:20:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lusan.id.au;
 s=KIEV_LUSAN; t=1606659632;
 bh=H0orqrT1u99pSyfWUiMSDmhZ/eHim988cxhqbcfTuy0=;
 h=Subject:From:Reply-To:To:Date:In-Reply-To:References;
 b=PYlOMkOkQNCwlU10ip5ERuV1kzNrFGUcIYmNAL+v3NpZMO91sZzlEomsrxkC08rCi
 +AOu690uUjPBW39OPTFMhbC98zVU5sgun+F/PoMLks8Mco/iCngxs+6wPX38apUDv7
 ztiAHny2UKEzj6/tEDw8iVJoBkQYFIGbHRJdB+j8=
Message-ID: <109669cd65b1ffd860fa293ebeea23432a89f63d.camel@lusan.id.au>
Subject: Re: Re[4]: Connection works, ping does not
From: Nikolai Lusan <nikolai@lusan.id.au>
To: wireguard@lists.zx2c4.com
Date: Mon, 30 Nov 2020 00:20:31 +1000
In-Reply-To: <em0d8407bb-2467-41ad-9d4d-5db6dabbe1c6@desktop-g0r648m>
References: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
 <20201123170255.joa7zsjvztukjxd4@desktop42>
 <emb79b6386-4a15-4186-aebf-9a21540c6055@desktop-g0r648m>
 <em1f4c294f-4708-4a7c-b268-300b1b5df65d@desktop-g0r648m>
 <em0d8407bb-2467-41ad-9d4d-5db6dabbe1c6@desktop-g0r648m>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sat, 2020-11-28 at 16:50 +0000, Hendrik Friedel wrote:
> 
> in the mail below the mtr results as picture, as "mtr" opens a GUI 

To keep mtr in the terminal you need to use 'mtr -t' or for ipv6 only
'mtr -t6' :)

- -- 
Nikolai Lusan <nikolai@lusan.id.au>
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVfd4GW6z4nsBxdLo4ZaDRV2VL6QFAl/Dri8ACgkQ4ZaDRV2V
L6TjJg/+K5tHU3bUOvf/PxBp+8QjJEwiEiYJ42ffWJaKtXWIi4YLMUHNCicicFV9
eNO3cIZXKdp3YQtoSAtP8PNswVgaud2NO7/JBTyul1fYnFwuZBVsOgjdgztJ4wCo
ds4WmgBs1yVoyHDlmalAjEi0cK5idLNtt0JEzpMbmL/luAXZqpXbkxm2vSsE8QPT
j7nZAM+BGgDApkqeCFsblUGgv4c68tMHL6SJUH3XoLL5EE0KSC3eQFzWpypSyomW
E6oiHGfDnC7dEIrnfS1NnoI0J3UQF1S9+IGpdf6xOIZwhSqTVCc2fl1Wy43KXfgi
yd4n5+VQ6BbIrw1JXdadk5Rt/O0qhk8TWCtUPM/1W3U0wL3UCY0D9fwY9G46bkdi
eyH1qgr/YCKr07ZCvQwpy4Y8ZUVQkTuadaaGzAl8TUAgfLzwUZLbTg2jnBBfuTG0
CYG98RxCwfdmOTalzwsYw5CoMULTzzl0DUjB7izOlVQwhnmNXFNEBp3E3Ybql1b6
xb3UteD/ziHQ1x/bskQvXZ3EFWm976yqNcR9qZWHSLVLleGknPfztzgfwZWSJwYV
NA/aOz9maQCnUHDsQtNBI62K9IOckoFJ7lW3JUZaakVj72wLvXsXU8SLUK5jI6RQ
NfMt4mv1n4tQzBiHAdbz5kyTYKuWVXwtj120a7VRjKfbAam+fiM=
=e7gK
-----END PGP SIGNATURE-----

