Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C8EC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDEC60F42
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 22:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECDEC60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=galois.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23d14862;
	Sun, 8 Aug 2021 22:58:06 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ca36a6dd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 16:57:41 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id s4so2165611qkm.13
 for <wireguard@lists.zx2c4.com>; Tue, 06 Jul 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=galois-com.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=4G7whdYfJfGLZjCYfzMMPEdf2hwNT9PuTtSu3tDFCkU=;
 b=Pb3vl3KdbcRvfWY2g1FwWWFT3Rejf6RT0g1wXofugdW6foBTxagYHoyjLmyXIS++LE
 oY6G1Vy3UYkda4VW9xP02h/jR/myyQxLuozEi2WvXEcxPkT4/NSoUN1illMEB78nznpg
 bYfshnZwHPfokh1h4LM67cNGdw6Kg+eMT6pSIf2WN7P3uDY/dEEiWSGvQ+059laC2tgY
 QpK3WRz32Nr6xlqvQsAbqpmgMuSPbSEs//0l1LGY3muHiqxJCBuexzbg2pm5PwQsr61s
 CzepfmOkxlXLfyYHshzG9PDgyZm44Hlumx8GUIqbilj/BDE1NIegpOmDR+NrXeen/pin
 /77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=4G7whdYfJfGLZjCYfzMMPEdf2hwNT9PuTtSu3tDFCkU=;
 b=bRgXPKKl36Qp+c1lJ5wwwLQoPaa8QwbiaUala8JWFc6Q9jL7WRyzqw76XVTK2OSOr3
 HJ/7x3j28WaoK1FsvTNghV+SjuXV/xtCV7UJs9tqT/AcsrqUnlD32vo5FFE+X+j6Yu56
 Rg6HpPetFqiEQPK5NND97OqVsl2Xnc9NtWfTMNdUTKUIFZyXrCNVU9xpyGg5tpKo/Utl
 kBvlpsrPgl83hugseGrh2lQKd9jev+RMCl9XG9bg3FcdfStgOrrgL61CxQel+O8JXE9d
 ajblnSkg7qDfxg2zmD8EV9Ax0cyUAHRBjSk59Cv09AcRkWUtkLzYVjiQ5D+bPFOqGQSY
 1H1w==
X-Gm-Message-State: AOAM531eDFBTJqv+SmtnL1BVpjWpTmwxja2smDgCEGPIvoo8ZHSrhvsn
 9i60/+R53muYwKkVxVPylz8n7gRetQhBZQ==
X-Google-Smtp-Source: ABdhPJwKsR18KqT65rXj1HdNC10HiIciV2Bw+LKdT911flU1oGKHv2vmdXqRQwQ+bi9Pu038FIu8gA==
X-Received: by 2002:a37:f50d:: with SMTP id l13mr20539510qkk.298.1625590659684; 
 Tue, 06 Jul 2021 09:57:39 -0700 (PDT)
Received: from smtpclient.apple ([2001:428:6002:405:41b4:f3c8:fcb8:f2eb])
 by smtp.gmail.com with ESMTPSA id m3sm2659537qke.37.2021.07.06.09.57.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Jul 2021 09:57:39 -0700 (PDT)
From: Dan West <dwest@galois.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: MacOS client v1.0.13 multiple tunnel issue
Message-Id: <86DB3970-3B57-4BC3-99FE-F18D17BB7058@galois.com>
Date: Tue, 6 Jul 2021 09:57:37 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Sun, 08 Aug 2021 22:58:05 +0000
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

I upgraded my wireguard client from v1.0.12 to v1.0.13 on my MacBook and =
when I connect using multiple tunnels to different sites, it no longer =
works correctly.  I am not entirely sure if this is a problem with =
routing on the client side or if there is a bug preventing additional =
tunnels from connecting to other sites.  It seems that the first tunnel =
I connect to will work, but any subsequent tunnels will not.  So for =
example, if I connect to SiteA and then SiteB, SiteA will work and SiteB =
will not.  If I connect to SiteB and then SiteA, SiteB will work but =
SiteA will not.  This is tested by pinging the VPN's gateway address =
after establishing each connection.  Here is a redacted copy of my =
tunnel configs:

### Site A Config ###

[Interface]
PrivateKey =3D xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=3D
Address =3D 10.1.1.100/24
DNS =3D 10.1.1.1, example.com

[Peer]
PublicKey =3D yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=3D
AllowedIPs =3D 10.1.1.0/16, aa.aaa.aaa.aa/25 #Public IP space for Site-A =
DMZ
Endpoint =3D site-a.example.com:32123

### Site B Config ###

[Interface]
PrivateKey =3D xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=3D
Address =3D 10.2.1.100/24
DNS =3D 10.2.1.1, example.com

[Peer]
PublicKey =3D yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=3D
AllowedIPs =3D 10.2.1.0/16, bb.bbb.bbb.bb/25 #Public IP space for Site-B =
DMZ
Endpoint =3D site-b.example.com:32123

It is worth noting that this has been tested using both the =
=E2=80=9COn-Demand=E2=80=9D function as well as the MacOS built-in =
Network management tool.  The version history says =E2=80=9CJun 17, 2021 =
- 1.0.13 - This version includes internal fixes and API changes for =
newer iOS versions=E2=80=9D, so the actual changes are a little opaque.=20=


I ran a TCPdump on Site-B (or the second site) to see if traffic is even =
getting to the VPN endpoint and it is not seeing anything.  I also ran a =
packet capture on the border firewalls and did not see any traffic =
attempting to hit that location.  The client does not show any handshake =
activity, so I believe the issue is specifically in the client or maybe =
how it is trying route the second connection?

A temporary fix is to downgrade back to v1.0.12, but due to limitations =
of the Apple Appstore, it is only feasible if you happen to have a =
backup copy of the client.  I just happened to have a backup copy, so I =
was able to test with both clients. =20

Has anyone else ran into this issue or has any suggestions?  I can =
provide more information on the topology if you think it would be =
helpful.

Thanks,

Dan

Dan West
Systems Administrator
Galois Inc.
http://corp.galois.com




