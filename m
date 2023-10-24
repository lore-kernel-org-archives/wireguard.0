Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900BEC07545
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Oct 2023 11:09:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d345ac57;
	Tue, 24 Oct 2023 11:09:04 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 516efcdb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Oct 2023 11:09:01 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 08BDA1FE30;
 Tue, 24 Oct 2023 13:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1698145741;
 bh=cw6rG7AZvii5L5BFEksgeOiVViOjus8c0Do/gc7NdEY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=AJQ7D1nuGmTDRULGCazxYQrN+zGHQsBZIwV/oVacacC0P8eU9CEJqw/6VKWshWmVk
 bfrQu/vpiUhJi5WKdxziurrkxkyCYYcugx0TBvKZztvVhY7MZgCUsTom+peJ4sijKW
 IAIbbHlNFiv654ehaJ+vjenePPyTqP4kZgeTl6BjInu+rKK4/cmpjIU3sd9/GApd2D
 vqMVWGPV1alPGegY/CQdlRzjggT3pKftbEfx5qyeBYBeBCsyyPEr1z9bx1kQrDWh32
 mXn0is6chOJiv6XbfZZgWxU8Kp+x4UT1T4iHQ0H+VjExZ4b2qr9taRSWsB8wADOFPB
 xjVxGRJ89tw/A==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 8327814C0130; Tue, 24 Oct 2023 13:09:00 +0200 (CEST)
References: <63bb2149-2d0b-df64-27f9-6e003dfdc577@openoffice.nl>
 <20231024113755.6a786c71@parrot>
User-agent: mu4e 1.10.7; emacs 29.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Marek =?utf-8?Q?K=C3=BCthe?= <m-k-mailling-list@mk16.de>
Cc: v@sess.ink, wireguard@lists.zx2c4.com
Subject: Re: AllowedIPs = ::/0 routes IPv4 - on Android?
Date: Tue, 24 Oct 2023 13:08:14 +0200
In-reply-to: <20231024113755.6a786c71@parrot>
Message-ID: <875y2wgtv7.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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


Hello Marek,

since when does ::/0 refer to IPv4 addresses? To my knowledge,
::/0 is the IPv6 all route and does not include any IPv4.

Best regards,

Nico

Marek K=C3=BCthe <m-k-mailling-list@mk16.de> writes:

> [[PGP Signed Part:Undecided]]
> Hello Valentijn,
>
> ::/0 does not describe no IPv4 address, but all IP addresses. So when
> you write ::/0, all IPv4 addresses are routed through the tunnel. If
> you don't want IPv4 routes, you can simply omit them in AllowedIPs (so
> only put IPv6 addresses there, or only address which should go through
> the tunnel).
>
> Greetings
> Marek K=C3=BCthe
>
> On Tue, 5 Sep 2023 16:04:34 +0200
> Valentijn Sessink <v@sess.ink> wrote:
>
>> Hi List,
>>
>> I have a WG endpoint configured with
>> AllowedIPs =3D ::/0
>> ... on an Android phone.
>>
>> To my surprise, I found out that this also tries to route IPv4 addresses
>> to the other WG side.
>>
>> I was able to change that with a single "bogus" IPv4 address,
>> "AllowedIPs =3D ::/0, 192.0.2.99/32"
>>
>> Is this a known feature? Android 13, WireGuard for Android
>> v1.0.20230707, (from AOSP).
>>
>> Best regards,
>>
>> Valentijn


--
Sustainable and modern Infrastructures by ungleich.ch
