Return-Path: <SRS0=S+OT=BR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98B6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Aug 2020 04:29:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE302086A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Aug 2020 04:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbxKIjEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE302086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a05b0591;
	Fri, 7 Aug 2020 04:04:35 +0000 (UTC)
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [2607:f8b0:4864:20::f42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f58ef43
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Aug 2020 04:04:33 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id l13so198553qvt.10
 for <wireguard@lists.zx2c4.com>; Thu, 06 Aug 2020 21:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
 :content-transfer-encoding;
 bh=kWgv5psTER60A2tYHgMHCibqnLVJXphx4wx7ocrUT5I=;
 b=ZbxKIjEm0KT/GkHzY9G+t4gUcBDhcu1PKKy9Mo2RjXh3HZ1nyoHS0Hqi6dpidx/mWx
 nPvcPP/AstF0ZHlPaAwrqZtAUNlD39rO8eWf1ZfCadWK0eigZo6hpUZv0SuQDBZVJ8db
 taNudV8Yj5cFYzdbZn0CO8eRNNDskgFsX93z6EfzWgbbgynPH1cyiqvw0vbuITWFZ8kb
 2+2tqiExFMiuSN8/rr8eexeQVeD3r8E66hp902wv9+kNzSDkEJkc3KWeySkHebEzDbOs
 8IH31NKlt5Gfpq5OywVMJUjCNhgcRrtMN16SED/bB8W+BWiT5YqEmAyzCkxNiIr83+3/
 jtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc:content-transfer-encoding;
 bh=kWgv5psTER60A2tYHgMHCibqnLVJXphx4wx7ocrUT5I=;
 b=o3gZ4CtbrX6yGsrTVx39GlaAmQBJScQdlNmz0JzTGG9sPXcGe+ByiqbBpxFO9x7uhk
 n9oQt+fG2Rj4QMRTTB4zX7fkcQWdgrAC89iQJ+HqIW9Egc6N/by0oXm97Rib8qETB7SP
 bBixy1Fh7DdwhBlWJVvRCgctOMc2dDjPSdsiSVCtDzlDZIO8a/qMqMaYTUbXMmyzkHrh
 eK85/s060/aevc/6QuHx8Gh7Al0fQgz9ag5Ez51C/BUg82nD77xMl10IBRLuQsNswRtb
 x6rTcR0sA7Qv/2gKGvC6gSsL8hN08nWkk5Ixh5mFCO+25Z1krvcheHN/TcJMbPKmAGg6
 ltkg==
X-Gm-Message-State: AOAM531J92p9yBzzB6CHLMW110zwmUHYi5PznPvgn9Rt0LOI+ApCw32L
 5oKCbGN6N5E1RATuKhyN70j7uDvyJdwMID17/eAlrhiPMdA=
X-Google-Smtp-Source: ABdhPJwheWVCOwAJiThZOD4q7eJ5DdpkS1XqdQW5xS5S95za3RQJj/Amj5HXvNj84zSCl1gAnoJnmjX/AgvXotz+ORs=
X-Received: by 2002:ad4:4c89:: with SMTP id bs9mr12159569qvb.210.1596774554440; 
 Thu, 06 Aug 2020 21:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <aa041580-d6e8-6fa1-abc6-86de7f2ef53b@gmail.com>
In-Reply-To: <aa041580-d6e8-6fa1-abc6-86de7f2ef53b@gmail.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Fri, 7 Aug 2020 06:29:01 +0200
Message-ID: <CADn-QaO2gn8vX0qA9jeitSGiSK11qengh0U5_JjonTmSND84Tg@mail.gmail.com>
Subject: Re: Android App not setting DNS when allowed IPS not 0.0.0.0/0
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

hello

Welcome to the club =E2=80=94 that is EXACTLY what I'm talking about in the
thread "WireGuard macOS App doesn't set system default DNS".

Are you on macOS as well? Using the WireGuard App or are you using wg-quick=
?

Regards,

Alexander

Am Do., 6. Aug. 2020 um 16:20 Uhr schrieb Mauro Santos
<registo.mailling@gmail.com>:

>
> Hello,
>
> Like the subject says I have found that when I'm not routing all traffic
> through the vpn then my dns setting seems to be ignored (tested with
> nsleaktest.com).
>
> If I route all traffic through the vpn then it works as expected.
>
> home network: 192.168.20.0/24
>
> vpn "server" is at 192.168.20.10 and internal vpn address is 10.4.4.1,
> where I have the dns server running and a few other services accessible
> only though the vpn.
>
> "server" config (with systemd-networkd)
> wireguard.netdev:
> [NetDev]
> Name =3D wireguard
> Kind =3D wireguard
> Description =3D WireGuard VPN
>
> [WireGuard]
> ListenPort =3D 4911
> PrivateKey =3D ...
> #Publickey =3D ...
>
> # Phone
> [WireGuardPeer]
> PublicKey =3D ...
> AllowedIPs =3D 10.4.4.3/32
>
> wireguard.network
> [Match]
> Name =3D wireguard
>
> [Network]
> Address =3D 10.4.4.1/24
>
> "client" config (android vpn app):
> [Interface]
> name: msi
> public key: ...
> addresses: 10.4.4.3/32
> dns servers: 10.4.4.1
>
> [Peer]
> public key: ...
> allowed ips: 10.4.4.0/24
> endpoint: 192.168.20.10:4911
>
> The problem also persists if I access the vpn from outside my internal
> network and is "fixed" if I change the allowed ips from 10.4.4.0/24 to
> 0.0.0.0/0.
>
> From what I have searched, other people with similar problems had a
> configuration problem, but I don't think it is the case here since my
> dns servers in on the same machine as other services and I can access
> the other services without problems.
>
> Any ideas on what the problem could be? I have checked the log on the
> android app but none of the messages in the log seems to indicate any
> problem, should I be looking for some warning/error messages in particula=
r?
>
> --
> Mauro Santos



--



Alexander
--
=3D>        Google+ =3D> http://plus.skwar.me         <=3D=3D
=3D> Chat (Jabber/Google Talk) =3D> a.skwar@gmail.com <=3D=3D
