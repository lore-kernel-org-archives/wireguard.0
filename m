Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F1EC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jun 2024 10:49:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12076195;
	Fri, 21 Jun 2024 10:47:46 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7ef05ce1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 10:47:42 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso26554191fa.1
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jun 2024 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi.net; s=google; t=1718966862; x=1719571662; darn=lists.zx2c4.com;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=sWFKNxi9InMKumb1Ri0fRbqC9VgQ9hPwNh5J2MiVVkk=;
 b=ebglOeTrgqdY5n/uKteS55lmYaybCCbI7GIfU2raRwcKtGxnnxyjKzlUBH37xhLYB6
 3g2vDVioscHpnPNqA/K6EM46lWG6qXuB+lfoiIeMP7pINSUfubTREvmigiDji7vdV+Df
 Lfu7NlJ7rcOHbcEYHl7xLXtDXOuG4jZoYBNzjUs5x8/P2KJLu5DQGcb2MPqfGRPa7QuP
 Is9+RYByWOteyPA1dYz7mWOCm7M4iy8BJ3C5NWz1wMrWDXeVYRO2LzOsoAcCiaghkRcp
 JeF6rPuwiaxZQuV1vzJnaZWvaIVwfs6WTj0MxFMl37LTlhsDfAmi7865YXpBMvlVS2Da
 sdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718966862; x=1719571662;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWFKNxi9InMKumb1Ri0fRbqC9VgQ9hPwNh5J2MiVVkk=;
 b=IMq5dsavQVsiI+R/FifGAMvQEa+8Y1OWpTZhVJy5j9Lz/yh10Wq/nPerrXVZ8nIf57
 wJNyJIBZKaEhzKpwrOXUo4Cp3fka5wgwuiTkp63WhnejD8zJTgDSdoV2obm3fF/zS3+o
 tb4dEtP1kIScTY8UX2LgTH9zW3q3v5nHffDD3Qcy/DYBUF1dvsrWK6dB0yQFrcJRClyq
 Lr82mWGJXBrzEG5u7U+Vk7PgRsoJlxPT/10pNkwYk6862ckUrmBK7g48112IywPT2HlH
 jluEyl06kZIkXnsF+SzVOcA8xL9LHEcIPdqDaR0+2vlVHGQVZAfZGw6sOkSmscyriNk/
 64pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyy8e3DA+N5XWjuTXrY/c3tuEGf0vtD/wNc8dkxZCENDZTVqZiE6mXmU1qIrmD2dtbuUQw7dkvXVEG6lpal7DPKWY5qWs9ZdCb
X-Gm-Message-State: AOJu0Yw0UpL+qZDL2fjeT8O4yKN4aKOPFih+zhA7gaiU/jrXrjzJVF/3
 0zuSjsd83fOjFHXRHgoYDf4rF2yJY9gQV00AtFGE9I7NRdPbfXcG4R15jJLL9bF1jPmFK8X7yLk
 tnVs=
X-Google-Smtp-Source: AGHT+IF7lwB2BXB6j2funLBlxwipYybbdu7Sg5qTV/YoE9p8Sb3VP37qeAaycmVbQOVTdud4X/FWYQ==
X-Received: by 2002:a2e:9a86:0:b0:2ec:1613:a2a with SMTP id
 38308e7fff4ca-2ec3cfe99eamr60460101fa.42.1718966862011; 
 Fri, 21 Jun 2024 03:47:42 -0700 (PDT)
Received: from smtpclient.apple ([2a0a:f640:1400:663a:68c4:6282:a390:b6f4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf548fe8sm70616366b.129.2024.06.21.03.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jun 2024 03:47:41 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: How to detect the IP CAM on LAN from WG tunnel ?
Date: Fri, 21 Jun 2024 12:47:30 +0200
Message-Id: <4B7285ED-C08C-4AAB-827C-AF511D606D03@tomcsanyi.net>
References: <1f7f4177-86b1-4a33-876b-06bf4e4f1cbd@gmail.com>
Cc: Mark Lawrence <mark@rekudos.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <1f7f4177-86b1-4a33-876b-06bf4e4f1cbd@gmail.com>
To: Nohk Two <nohktwo@gmail.com>
X-Mailer: iPhone Mail (21F90)
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

In case the camera app uses something below IP, eg ARP to discover you don=E2=
=80=99t have a chance, since it will never cross the wireguard tunnel.
You should try to capture somehow what the app is doing, and then work from t=
hat. Either they do not accept the Wireguard routes or they are using non-IP=
 discovery that does not get routed through wg.

Good luck!
Domi

> 21.06.2024 d=C3=A1tummal, 12:42 id=C5=91pontban Nohk Two <nohktwo@gmail.co=
m> =C3=ADrta:
>=20
> =EF=BB=BFOn 2024/6/21 17:18, Mark Lawrence wrote:
>>> How do you solve this problem ?
>> Iterative fact checking, from the lowest levels of the network stack to t=
he highest.
>>     - Are the devices actually connected where you think they are?
>>         - With the tunnel disconnected, does your phone connect to the   =
        camera?
> I use wireguard VPN while my phone is using mobile data (4G LTE). With the=
 tunnel disconnected my phone can't connect to the camera since it scanned a=
nd cannot find the camera.
>=20
>>     - Is your Wireguard tunnel set up properly?
>>         - Can your phone ping the wg0 address with the tunnel active?
>>         - Can your phone ping other .100 devices with the tunnel         =
  active?
> I don't know how to ping from my phone. But the phone, with the wireguard t=
unnel connected, can visit my LAN website which is in the network 192.168.10=
0.0/24.
>=20
>>     - Does your eth0/wg0 machine have IP forwarding enabled?
>>         - sysctl net.ipv4.ip_forward=3D1
> Yes.
> $ sysctl net.ipv4.ip_forward
> net.ipv4.ip_forward =3D 1
>=20
>>     - What does packet tracing show?
>>         - I.e. `ngrep -d wg0 .\* icmp` or the tcpdump equivalent, also   =
        against eth0 for the wireguard UDP port.
> I use `ngrep -d wg0 .\* icmp`, but nothing dump. However while I open my p=
hone's browser to visit my LAN site, it did dump something.
>=20
>>     - Does the mobile App actually support remote (routed) cameras or    =
   just on the local network?
> This is the point I said in my original mail that I think my phone and the=
 camera are in different networks. I believe this App is for LAN network.
>=20
> For this scenario, are there solutions ?
