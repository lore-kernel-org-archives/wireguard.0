Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A54C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 21:56:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F1723435
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 21:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F1723435
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=zealid.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6806e914;
	Thu, 7 Jan 2021 21:55:12 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cadd3929
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jan 2021 16:46:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w5so2986632wrm.11
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jan 2021 08:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zealid.com; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=f+K1ZZjgZmxIpCHBiPWWZ6ibNt2e4gUSBkXNO2Vb0Ow=;
 b=T34BVKaLHJCaTuuxZBgGaKhQCRa3hYC95/Vy3i+O2g5JbdOM0r/W8+HykbrcssBd/5
 j3bl+YPgrdnet3B2afwYo3R/5AZHCYRWTKzUHMbJY9rueZrIYxX+qcPTqqducr1S4Cba
 sFCD+dnBq6w34NEKr4jE64ieeM9JSgQmYoArzUvqxHFHOExLpS6vuX5y5XvFmd0+NuwZ
 VlzKWwt/yUpaDCWA0S35KR9urvtwHFNbIMwvZz0nUz8LGOomC8hkVOnRmJBBNQO9cTW6
 GF1+uuLIrpIgRlRMfvzZU5GMfniwniLzTIdVpOgKg4SHLZiSTKX/pqYUW47jvrquB0Vu
 pF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=f+K1ZZjgZmxIpCHBiPWWZ6ibNt2e4gUSBkXNO2Vb0Ow=;
 b=PDdRwx5V87eqhenNJi6h8XNaezi6B4DrxnZrT1lgMQ/klQ8e9L1hA8vtP2uNrN6vSG
 p4XxOxM2Vj1x8Kx6LRMMqRqg/xdqha78XjcfGOKv+MKxTwbUW7kvkENNUgKKwa2wyLB6
 qJW4UMKmcwWNO1Mcj9vHd4kM1QgeN7M4LJfX+VPu1FhBfLZCUor1h/PkgJhCU4kHGM8+
 RWxuaCp6aoDlPI2ZdK3nMVmZ4WpmW6Nxqwir/OwORNfon559wu28zFy9cUjBw8Ww7eXS
 OhE5I6wJVgavRTawt+zMw13bxoxEmVBj6SgZPpv6DBrp+AmHilskys8PMoaNNLtQMdqR
 GPRA==
X-Gm-Message-State: AOAM531/PdLPjRvp0cd941tue31DBMFu35sdiPLn41VFf7XkUWvsv8c0
 LSSO/diZCIgOG0Or/17dkb2FDI3f7Vs3tQ==
X-Google-Smtp-Source: ABdhPJy38R9873T4MNeDZsouzZKI8BIgp4PkJi4gcu8Tc8dJc9xjZZsdsw1plK5OtKNFukjHP63PGA==
X-Received: by 2002:a05:6000:1188:: with SMTP id
 g8mr5265823wrx.111.1609951602301; 
 Wed, 06 Jan 2021 08:46:42 -0800 (PST)
Received: from [10.77.8.8] ([79.142.127.170])
 by smtp.gmail.com with ESMTPSA id w189sm3691127wmg.31.2021.01.06.08.46.41
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Jan 2021 08:46:41 -0800 (PST)
From: Dmitrij Gusev <dmitrij.gusev@zealid.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: macOS wireguard client: traffic to wireguard interface self IP
 travels through VPN server
Message-Id: <5A7F7841-4B7F-4E7A-AB39-32EC787D14E0@zealid.com>
Date: Wed, 6 Jan 2021 18:46:40 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Mailman-Approved-At: Thu, 07 Jan 2021 21:55:11 +0000
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

Hello.
We just started to use the WireGuard VPN in our company.
Thanks for the great software!

I discovered, that while using the macOS wireguard client a traffic to =
the wireguard interface self IP travels through VPN server.

So for example if I ping wireguard interface self IP from macOS machine =
- both echo-request and echo-reply goes through WireGuard VPN server=E2=80=
=99s nftables =E2=80=9Cforward" chain.
Normally this kind of traffic is expected to travel locally.

Is it a bug in the WireGuard macOS client or is it related to macOS =
network (tunnel) stack glitches?
Are you already aware of a such behaviour?

macOS Big Sur version 11.1
WireGuard app version 1.0.12 (22)

macOS wireguard config looks like this:
[Interface]
PrivateKey =3D <PRIV KEY>
Address =3D 10.0.0.5/24
DNS =3D 10.1.0.53, example.local

[Peer]
PublicKey =3D <PUB KEY>
AllowedIPs =3D 0.0.0.0/0
Endpoint =3D vpn-srv.example.com:28283
PersistentKeepalive =3D 20

Thanks,
Dmitrij Gusev
System Architect
dmitrij.gusev@zealid.com
+370 6330 5550
ZealiD

