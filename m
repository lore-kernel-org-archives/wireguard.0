Return-Path: <SRS0=OAC8=NJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B36EC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Aug 2021 21:28:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468ED6104F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Aug 2021 21:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 468ED6104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17390b29;
	Wed, 18 Aug 2021 21:27:59 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57e3027a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Aug 2021 21:27:55 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i6so5368907edu.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Aug 2021 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ExqIjCYSyuGWxJ/zaBuVHsKz1O6gph6y51GW1Biz5p8=;
 b=uZRZJWR7rFT06bauTpi8OBjbxV25rsGjqZtufwz/1s+rMGefOGZsuulNEgH6a9unOw
 6p1IVni5fNax8Vo79Z9FJcyuIcgv558843J1pWZJpQYVSIz9XbK280NKa7wLCACAMZ/U
 uLROo58bdV/wHO8NO2H/koMyezJ13IFSgAH6si73Ze8SNhMVdumq92G0peAiwxi2tw6E
 mQGJ6BrQkZvBz50EezCGwCbbR2SfKlwLUW/cXVSa0GT2HrNjd6iHfhb4O8XmCnnhIAJA
 scL9lHtv84HTNDJ22EvHDDjN7Y6bAT0XOY934pfrJMZF+qXFBDZPoi8JhvIxPkbakSGq
 TKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ExqIjCYSyuGWxJ/zaBuVHsKz1O6gph6y51GW1Biz5p8=;
 b=NcGbGNSVw33HOqRTJhGxejweJOnqO73y+3wese34kC142S1dpenYfGykMbeV4RjqJY
 0SPHs8nSO6zs9spXw8oxOqWNNxL/yLB57UQhdMrVRyfS2M6kA/fngDf+14R0p8I6N1vj
 0Wz0uffQG+8JhiXjjmcTNSaBA0wF0On5W+rhmc1rqUXpuG05QBdKGnja7X7oEGLu5LCJ
 leQQMOCU3h0d/TR1tjU3jYKLZVqJQBUwwYDa03cSN7iRF9Jbhr1R2hxQivvfiI14EpUa
 gP+RQNYqyPl2+zmbwV2Qeryny6bbnAdO6nkiiQSW13meAHxx7b2kLBPHxofYv6WnDQMW
 mQcw==
X-Gm-Message-State: AOAM5305K8dEVbQFDRY6VXJ3Zd0Z9njv7qwAFErphkQWxstZ17Ttyd+Q
 M6Tj5EHSm7cWXyXfQq15GMzAyQ==
X-Google-Smtp-Source: ABdhPJyN4HG8kxz/GAIlIqZ8933YqxQz5i3Xjq+JCTA10Sf4S8ZZGO6SbszIeUHk/ZN4JWXoMaxfpA==
X-Received: by 2002:aa7:db82:: with SMTP id u2mr12685233edt.299.1629322075611; 
 Wed, 18 Aug 2021 14:27:55 -0700 (PDT)
Received: from [192.168.0.107] (80-95-82-192.pool.digikabel.hu. [80.95.82.192])
 by smtp.gmail.com with ESMTPSA id fp5sm399055ejc.6.2021.08.18.14.27.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:27:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.20\))
Subject: Re: Domain as endpoint when using wireguard with network namespaces
From: =?utf-8?Q?=22Tomcs=C3=A1nyi=2C_Domonkos=22?= <domi@tomcsanyi.net>
In-Reply-To: <B255319F-EE48-42F6-8735-36285E490C66@tomcsanyi.net>
Date: Wed, 18 Aug 2021 23:27:54 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <57EC9A43-F6C1-4583-8059-CF6161853B83@tomcsanyi.net>
References: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
 <03667268-5415-4FB0-9D4B-1E51466A3F5C@tomcsanyi.net>
 <781a68d1-6a85-4bb7-9911-003ba722c504@Spark>
 <B255319F-EE48-42F6-8735-36285E490C66@tomcsanyi.net>
To: Waishon <waishon009@gmail.com>
X-Mailer: Apple Mail (2.3445.104.20)
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

Hi,=20

Thanks for the kid and detailed answer, this is quite fascinating, I =
never looked deep into wireguard and namespaces, only dealt with a =
couple of simple IPsec + namespaces scenario before.
To me your issue seems to be valid, I hope you will get an answer from =
Jason sooner or later.

Cheers,
Domi

>=20
>> 2021. aug. 18. d=C3=A1tummal, 23:19 id=C5=91pontban Waishon =
<waishon009@gmail.com> =C3=ADrta:
>>=20
>> Hey there,
>>=20
>> thanks for your reply:
>>=20
>> The reason why it works when using an IP instead of a domain is the =
"birth namespace" concept of wiregurard. You're creating the WireGuard =
interface inside your init-namespace (birth-namespace) which does have =
an internet connection. The UDP socket for sending and receiving the =
encrypted packets is also created here.=20
>>=20
>> Afterwards you move your WireGuard interface into a newly created =
network namespace. The UDP socket is still inside the birth-namespace. =
When you now call "wg set" with an IP-Address from inside the network =
namespace, it "tells" the UDP socket inside the birth-namespace to =
connect to this endpoint over the internet connection of the =
birth-namespace.
>>=20
>> When the UDP socket receives encrypted packets, WireGuard decrypts =
them and puts the network packets in the device queue of the WireGuard =
interface, which is inside the network namespace (I hope I understood =
the source code correctly). So you don't need an internet connection =
inside the network namespace to create a wireguard tunnel, when using an =
ip-address. I've tested it and it works fine, as described in the =
documentation https://www.wireguard.com/netns/.
>>=20
>> However when using a domain, "wg set" tries to lookup the domain =
inside the network namespace (which doesn't have an internet connection =
until the tunnel is created) and not inside the birth-namespace.=20
>>=20
>> I think that the wg-tool should determine the namespace of the udp =
socket and do the DNS lookup there. However I don't know if this is even =
possible to implement.
>>=20
>> Kind regards
>> Am 18. Aug. 2021, 07:54 +0200 schrieb Tomcsanyi, Domonkos =
<domi@tomcsanyi.net>:
>> I am sorry, but I need to ask: if your namespace does not have an =
internet connection how would you connect to your remote endpoint after =
the DNS lookup issue is solved and you received the IP behind =
vpn.example.com?
>>=20
>> Kind regards,
>> Domi
>>=20
>> 17.08.2021 d=C3=A1tummal, 23:06 id=C5=91pontban Waishon =
<waishon009@gmail.com> =C3=ADrta:
>>=20
>> =EF=BB=BFHey there,
>>=20
>> I'm currently trying to setup a wireguard-tunnel inside a
>> network-namespace as descriped in the documentation, which fails when
>> using a domain as endpoint:
>> https://www.wireguard.com/netns/
>>=20
>> First I've created the wireguard interface inside the birth-namespace
>> of the host using "ip link add wg0 type wireguard". Then I moved the
>> wg0 interface to the newly created network namespace, which doesn't
>> have any network interfaces and network connections beside the
>> loopback interface.
>>=20
>> Then I configured the wg0 interface inside the network namespace =
using
>> wg set "INTERFACE_NAME" \
>> private-key <SECRET \
>> peer "PEER" \
>> endpoint vpn.example.com:51820 \
>> persistent-keepalive 25 \
>> allowed-ips ::/0
>>=20
>> This however results in a "Temporary failure in name resolution:
>> `vpn.example.com:51820'. Trying again in 1.00 seconds..." error
>> message, which makes sense, because the wireguard-tool tries to call
>> getaddrinfo inside the network namespace. The namespace doesn't have
>> an internet connection and the lookup fails.
>> =
https://github.com/WireGuard/wireguard-tools/blob/96e42feb3f41e2161141d495=
8e2637d9dee6f90a/src/config.c#L242
>>=20
>> As a user I would expect that the wg-tool does the lookup in the
>> birth-namespace of the interface and not inside the newly created
>> network namespace.
>>=20
>> What is the recommended solution to resolve an domain endpoint when
>> using network namespaces and wireguard? Just manually lookup the
>> domain in the birth-namespace and use the ip as endpoint? The
>> implementation however would be quiete hacky to make it properly work
>> with IPv4 and IPv6.
>=20

