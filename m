Return-Path: <SRS0=I1qK=KF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5619FC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 18:27:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D123613CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 18:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D123613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95676b01;
	Mon, 10 May 2021 18:27:42 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7af17ce3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 May 2021 22:37:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z6so14628263wrm.4
 for <wireguard@lists.zx2c4.com>; Sun, 09 May 2021 15:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=wlz+VfAung77zIb3Dyn5eyKUBk9O3fwff6kV+LaDeUA=;
 b=T9ptQ4JMwK4/9l1q8e/HHbeLC60f/dcSBKuB7l7ptAoTmuV3EjmmTmEShkYUrx4MNJ
 VaW3PcYVgXqeTgQ0vuWY8Sg9Sdqrrx75PwSqqS2Zzgp+rfJDiL0r8YJpaJj1b44EnPuh
 AHn/o08yrd7/Z0f+93fSD/y3ID9s7bwxW+A1TFRmX4Uetprcnrz5NayvipToz0S35osz
 xgTDWiQ4sNWNXbBxIXp/h1TYWwgODEgBMZpLq9R5bfnhHS5dMmOnUweKKaO6vP6bhWia
 lo6jCUiyAW9zdA4erwZ0SNXj6tyRSxfJ/xRz+xh0ett9R1w+E3bnzDvwrgTsBLmsPMEX
 /Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=wlz+VfAung77zIb3Dyn5eyKUBk9O3fwff6kV+LaDeUA=;
 b=FjkbDQfJzWf2uFNdQOwdX4TqSWH6oqvZKphFzvd6524pLYkF0LkxGspAzGKOwZh+xK
 os8jmO90tSe0D+KLa/hXhYFjgShUOFqGuht/TzqATKlJm1y5zi9Igfv0aWMPN37gpR6p
 5YQy8FXw5iLDnDjGhCNhJN5vMIHZpwNJp6UR9F8vO1JrstCKSw3jQh4TaA8ZIT1j5bnr
 8rKXrQBdwgCr47gLROAmYy9oPXy/9smSDRmoRxTJHjaBGdXYkSX+LY3UHGnepbY/zdHV
 H03adoK4e71NeI4gR0yshrWiDXvtH3fb928WxI9e6hRaShi2lJDEOejWdI0f+VHNmEjN
 fH9w==
X-Gm-Message-State: AOAM533Nz247ERgKpRD8ARTj16XqY+QpIdrGyVCICzTSBG7YwqxDu7Gx
 RBvGFa9X8d8SPcxl587yRP0EcUb+Of8=
X-Google-Smtp-Source: ABdhPJypGVnTqaEU5Zudfxk17RRbAjiD1f2gYvKH4FZ3CMZ71SN3HNgjjyoGriDyIj4pjMywEB4yTw==
X-Received: by 2002:a5d:524f:: with SMTP id k15mr26786717wrc.412.1620599839171; 
 Sun, 09 May 2021 15:37:19 -0700 (PDT)
Received: from smtpclient.apple ([2a02:8071:43b0:5100:9092:670f:651a:742c])
 by smtp.gmail.com with ESMTPSA id z7sm19682954wrl.11.2021.05.09.15.37.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 May 2021 15:37:18 -0700 (PDT)
From: Thomas Keppler <winfr34k@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: WireGuard on macOS sets default route when it shouldn't
Message-Id: <4686FAEA-B9C0-4897-8422-954AB84B4E78@gmail.com>
Date: Mon, 10 May 2021 00:37:17 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Mailman-Approved-At: Mon, 10 May 2021 18:27:40 +0000
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

Hello everyone,

on a remote system I administer, I have setup a WireGuard VPN. All in =
all, this process has worked swimmingly. However, I have got one big =
issue on all of my macOS clients and I'm not sure if it's a bug or if =
it's me just using the software aka holding it wrong.

I am not quite sure if this Mailing List is the right place to bother =
with questions like this, but I will try my luck anyways :-)

Given a client configuration like so:
------------ 8< ------------
[Interface]
PrivateKey =3D <privkey>
Address =3D 192.168.1.1/32
DNS =3D 192.168.0.253
MTU =3D 1420

[Peer]
PublicKey =3D <pubkey>
PresharedKey =3D <psk>
AllowedIPs =3D 192.168.0.0/24, 192.168.1.254/32
Endpoint =3D <endpoint>:51820
------------ >8 ------------

When I activate the tunnel connection, I always get several routes =
pushed, all of which are OK except the default route:
------------ 8< ------------
default via link#19 dev utun6
192.168.0.0/24 dev utun6  scope link
192.168.1.1/32 via 192.168.1.1 dev utun6
192.168.1.254/32 dev utun6  scope link
224.0.0.0/4 dev utun6  scope link
255.255.255.255/32 dev utun6  scope link
------------ >8 ------------

=46rom what I have read so far on other forums, Reddit, StackOverflow =
and such, the specific "AllowedIPs" I'm supplying should prevent the =
default route from being pushed. I have also tried to locate the code =
responsible for pushing these routes, but so far I could only gather =
that a "routeSocket" is established and watched in the Go internals that =
seems to be only read. The macOS app also does not seem to modify this =
socket (or any part I have read so far).

So given all of this, I have got two (main) questions (and an aside):

1.) Am I using WireGuard just plainly wrong or is it a Bug/Known Issue?
2.) Where is the code responsible for pushing routes?
3.) ...and what are good resources to check to get a better =
understanding of how this works internally?

Thank you very much for any response to this message in advance. I =
cannot wait to figure this one out!

--
Sincerely
Thomas Keppler=
