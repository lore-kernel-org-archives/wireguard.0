Return-Path: <SRS0=i2uS=A7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029CFC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 14:24:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 699F020B1F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jul 2020 14:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="IBtlPDB0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 699F020B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce6b9743;
	Mon, 20 Jul 2020 14:01:38 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ae85626a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jul 2020 14:01:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E18E428F0CA
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jul 2020 16:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1595255034;
 h=from:sender:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Yruyn+nDTPQOpvl5Y9FeSLFBTbDgYKp4+ZzOBq5GOAg=;
 b=IBtlPDB0grxJkry3ylkBIREfujsU4Y/Nj95IP2BNjeBygj8CLhtwSk3abeLo0/DlMtBBcv
 984s1zA1V3d2hLqTRdPEffzFsOpFfCtP5VYt60NLpRLWMlMHQSpUOtYhKeP0gmgniQMoTj
 GyP48k1M3g904aA4/1Y6YPMdh/wLJMncLlb05g830ZIxT2p8Muu8ykC/Z89FMKRYKxPup8
 tJADvwYEmZMcG7obOMrUvbGmhKh4EgH8bgJLWFuiVPTaMhdYIK6aAQ2/hG2BD7S0uBrsNI
 JLjNZ13F827eqOrhLvKbvWacaT945091q+ANKasL79u8X6OXtktTwB4mXu+P2A==
From: <wireguard@lindenberg.one>
To: <wireguard@lists.zx2c4.com>
References: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
 <1594720777.ugfhft3s9b.astroid@morple.none>
 <09a201d659e4$c6e01c80$54a05580$@lindenberg.one>
 <41f52bae-6caf-75b4-3b69-c0a2e10451db@xand.uk>
In-Reply-To: <41f52bae-6caf-75b4-3b69-c0a2e10451db@xand.uk>
Subject: AW: AW: two client connections -> crash?
Date: Mon, 20 Jul 2020 16:23:54 +0200
Message-ID: <064401d65ea1$66142470$323c6d50$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQH4Yw2c9ZJa5jZqt71DuJomCcR4JAJ1SSEgAproq3YBXC5sOwGDvZh6
Content-Language: en-de
X-Last-TLS-Session-Version: TLSv1.2
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

Hello,
thanks for pointing that out. Actually the idea was to switch over my =
VPN endpoint from one VPS to another one, thus the any address route =
(0.0.0.0/0) was correct, but now it is clear to me it does not make =
sense really to have any address twice. I am trying to test the new =
endpoint with a dedicated machine now (which fails to install =
wireguard).
But I am still wondering why the network stack kind of crashes. Even =
with a bullshit configuration like I did, imho this should never happen.
Thanks, Joachim

-----Urspr=C3=BCngliche Nachricht-----
Von: WireGuard <wireguard-bounces@lists.zx2c4.com> Im Auftrag von Xand =
Meaden
Gesendet: Tuesday, 14 July 2020 15:50
An: wireguard@lists.zx2c4.com
Betreff: Re: AW: two client connections -> crash?

"AllowedIPs" is the list of IP addresses/subnets that should be routed =
via that wireguard tunnel. In your case you've set both tunnels to be =
default route (0.0.0.0/0) for IPv4 traffic.

So it depends on what is the other end of each tunnel - and what you =
want the tunnel to be used for. AllowedIPs might just be the private IP =
address of each peer if you just want to communicate with that.

Xand

On 14/07/2020 14:43, Joachim Lindenberg wrote:
> Good observation. I never really understood  what IPs I should put =
there and also didn=C2=B4t find a good  documentation on that. And =
obviously with one connection it wasn=C2=B4t that important to get it =
right. What IP addresses or network should AllowedIPs refer to? Client? =
Server? Tunnel?
> Thanks, Joachim
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: M. Dietrich <mdt@emdete.de>
> Gesendet: Tuesday, 14 July 2020 12:11
> An: wireguard@lindenberg.one; 'WireGuard mailing list'=20
> <wireguard@lists.zx2c4.com>
> Betreff: Re: two client connections -> crash?
>
>
> Quotation from wireguard@lindenberg.one at Juli 13, 2020 20:53:
>> I am trying to configure one client system (Ubuntu 18.04.4 LTS=20
>> (GNU/Linux 5.3.0-62-generic x86_64)) against two servers. The=20
>> configuration is very similar:
>>
>> root@Mailcow:/home/joachim# cat /etc/wireguard/wg0-client.conf=20
>> [Interface] Address =3D 10.200.200.2/24 PrivateKey =3D *** DNS =3D =
8.8.8.8
>> #10.200.200.1
>>
>> [Peer]
>> PublicKey =3D qn6CTz578gbrYpzYkvV2okoqkIFHKye+mRj4i/I8Sz8=3D
>> Endpoint =3D fire.lindenberg.one:51820
>> AllowedIPs =3D 0.0.0.0/0
>> PersistentKeepalive =3D 21
>>
>> root@Mailcow:/home/joachim# cat /etc/wireguard/wg1-client.conf=20
>> [Interface] Address =3D 10.200.201.2/24 PrivateKey =3D *** DNS =3D =
8.8.8.8
>> #10.200.200.1
>>
>> [Peer]
>> PublicKey =3D QAJANxtuAvdT+HR3fP1I2DXq0Azl0T3jF5s+cW7foSA=3D
>> Endpoint =3D nc.lindenberg.one:51820
>> AllowedIPs =3D 0.0.0.0/0
>> PersistentKeepalive =3D 21
>>
>> Wg-quick up wg0-client ist at system startup. Now unfortunately when=20
>> I do wg-quick up wg1-client the network stack kind of crashes. The=20
>> command does not terminate, and connectivity on all interfaces is=20
>> broken.
>> Is this a configuration issue? Should I change ports to be different? =

>> Is there some other issue?
> The ports are fine because the IPs are different. You use the same =
AllowedIPs for both. And they cover the whole network.=20
> This cannot work. What is the intention of that config?
>
>> Do I have to define two interfaces or could I have just one with=20
>> multiple peers? But how could I then specify which tunnel to use?
> Depends on what you want to achieve. Sure you can use multiple peers =
for one interface.
>


