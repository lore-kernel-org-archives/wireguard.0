Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A40C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 12:14:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0112064B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 12:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/V5IQht"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0112064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb39f1c3;
	Mon, 3 Aug 2020 11:50:07 +0000 (UTC)
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [2607:f8b0:4864:20::844])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e140d63c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 11:50:05 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d27so27959779qtg.4
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eYlxsgyjIjotBuSfWyn62FbIMXer/RGFVWLF+N0Ejew=;
 b=A/V5IQhtwsPwdDvj63yDY7ceXJPL0jiorvAY/HsaajO6CAjZCRKC8HqZI0Gy4NtTRB
 6McH2hD6mAlgWbl26bZPxKtAXKT/Va+W31sBDj7GzbdjLjXDxNu9wkj4LRKu6FAkhTS0
 6Qvkfr50FAizW6MCTa3o3g/Ha+LWltMfGYMqS0+WnwhFvweeSqfcdvLtT0455WQgTWfZ
 S/1E09ZVB0hhgFHiFWizG/7RyTjwFdkMGfvhM3X/dU4gUah1Hn+AYRogZlww75/sAGvn
 xNE8jt1gTmNG4smVm3MJ2OzKnBhE4W8xK9BDNyvC0xliKqIgQ+O0RYnMzmy367ZGId2W
 qClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eYlxsgyjIjotBuSfWyn62FbIMXer/RGFVWLF+N0Ejew=;
 b=qb5LajA4yn2lnVNDmcOwcHs4AfOW/luvxYuIcQqTdcvo5nUASrwTzRXbWzhtOAa/iu
 SC5SIzRenK0c2dfaTimSy1vLfqOKweHrGMBV8RhD6lhBwdLd9UISqV6JCzKshcECkzcH
 Cta2LYAdYdWfud1tez2Se+D/5avQ6z6rQ5rJZWQ2dytGkXwE4L/lUHUGns5zzv5XaqIm
 B/HDGbboTV9azOgTzpv7w71CGYWYX2yib0ryGt8nLRv+poQlXxRZmTdMNbH/qUe9Sfam
 RDqBfcw4+62swgleYhJm9ZAn7fgapozgLxxqt4foyZwfl1Lxl6sn/7BlU7nubqII936z
 XUvQ==
X-Gm-Message-State: AOAM531c+AdKk5Mu0m2+OYwfYcrpC9LVsomigJ4Asrz11VMohA95HdOH
 QK/PnCKytKR5zfp/P3IxfIR6S9NAZ5poapjtT6I=
X-Google-Smtp-Source: ABdhPJxQ3L/a+MqpCHfU5y98jH47oE1jORDScmYD4Lqa86wdclcOxZFINr7Qt4xSAFsS7ssrhlZIEbrX1JWFYyttwnw=
X-Received: by 2002:ac8:7b9c:: with SMTP id p28mr16952083qtu.283.1596456857427; 
 Mon, 03 Aug 2020 05:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAO8prk+D0zuzExJ9KcD5xJT1tGiVVHQO1Bs3ExBoUy7=Y0mhoQ@mail.gmail.com>
 <AM0PR07MB614721A4B6B17011C3DFF7C0964D0@AM0PR07MB6147.eurprd07.prod.outlook.com>
In-Reply-To: <AM0PR07MB614721A4B6B17011C3DFF7C0964D0@AM0PR07MB6147.eurprd07.prod.outlook.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Mon, 3 Aug 2020 14:14:05 +0200
Message-ID: <CADn-QaMEbXB9T9xMz3QQ0rFOKSGnR0mTgEtydAUrYoPJgULaSQ@mail.gmail.com>
Subject: Re: WireGuard macOS App doesn't set system default DNS
To: Gijs Conijn <egc112@msn.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hello Erik,

yes, I know that the DNS is private. This is why I have that on my macOS
configuration:

# =E2=80=A6
AllowedIPs =3D 10.136.16.0/22, 169.254.169.253/32
# =E2=80=A6

Cheers,
Alexander

Am Mo., 3. Aug. 2020 um 14:02 Uhr schrieb Gijs Conijn <egc112@msn.com>:
>
> The DNS you are using is private and only works if routed through the tun=
nel.
>
> You have to add the DNS address to the allowed IP's so that it is routed =
via the tunnel.
>
> Regards, Erik DDWRT user
>
> Alexander Skwar <alexanders.mailinglists+nospam@gmail.com> schreef op 3 a=
ugustus 2020 11:15:21 CEST:
>>
>> Hello
>>
>> I'm having issues with the macOS App. tl;dr: It doesn't set the system
>> DNS to the IP of my resolver which is only reachable once the tunnel
>> is up.
>>
>> Here's my "clients" (macOS) configuration:
>>
>> #####################################################################
>> [Interface]
>> PrivateKey =3D ...=3D
>> Address =3D 172.31.0.3/24
>> DNS =3D 10.136.16.2
>>
>> [Peer]
>> PublicKey =3D ...=3D
>> AllowedIPs =3D 10.136.16.0/22, 169.254.169.253/32
>> Endpoint =3D wg.....ch:51820
>> #####################################################################
>>
>> Matching "server" configuration (Debian 10):
>>
>> #####################################################################
>> [Interface]
>> Address =3D 172.31.0.1/24
>> Listenport =3D 51820
>> PrivateKey =3D ...=3D
>> PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o
>> wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
>> PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -D FORWARD
>> -o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens5 -j MASQUERADE
>>
>> [Peer] # alexander-mac-1
>> PublicKey =3D kw6A7iN/sF0k2bePr15M10e6Ufhp7sJVWhZcZvGcrT8=3D
>> AllowedIPs =3D 172.31.0.3/32
>> #####################################################################
>>
>> When I activate this tunnel on my mac and do a "dig" or "host" query
>> for some name which only the private resolver 10.136.16.2 knows, I get
>> an NXDOMAIN (query failed).
>> When I do "dig @10.136.16.2 $sameName", the name gets resolved (ie.
>> when I manually s). This shows that the routing is working fine.
>>
>> As some extra tests, I set "DNS =3D 208.67.222.222" (OpenDNS) and tried
>> to resolve their test site www.internetbadguys.com. It resolves to
>> 146.112.61.108, which means that OpenDNS is used (I'm normally not
>> using it). It also shows on https://welcome.opendns.com/.
>> Same result with setting "DNS =3D 1.1.1.1" and then going to
>> https://1.1.1.1/help - DNS is set.
>>
>> This means that the macOS App *IS* able to set the system default
>> DNS, but for some reason doesn't set it to my private DNS IP of
>> 10.136.16.2.
>> There is ONE (bad) work around: When I set "AllowedIPs =3D 0.0.0.0/0",
>> then the App DOES set the system default DNS to 10.136.16.2.
>>
>> The log of the application doesn't show anything regarding DNS.
>> Pasted at https://paste.ee/p/ziqrg.
>>
>> Well=E2=80=A6 Why does the macOS App refuse to set the DNS to 10.136.16.=
2?
>>
>> Versions used:
>> App version: 0.0.20191105 (16)
>> Go backend version: 0.0.20191013
>> macOS: Catalina 10.15.5 (19F101)
>>
>>
>> Cheers,
>> Alexander



--=20



Alexander
--=20
=3D>        Google+ =3D> http://plus.skwar.me         <=3D=3D
=3D> Chat (Jabber/Google Talk) =3D> a.skwar@gmail.com <=3D=3D
