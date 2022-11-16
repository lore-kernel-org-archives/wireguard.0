Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C36CC47089
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 13:11:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94433703;
	Thu, 1 Dec 2022 13:09:20 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a32afa5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2022 16:52:44 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id p18so12036598qkg.2
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2022 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=WcQ4+CIVOFv5Ma/Uu0Wk4p1TFWGDGVH2nQgFbeJ/VA8=;
 b=Ni3hxEA0AD8d9HqpxbHMZRBxDQs8tzN30M1Htfba2ZDgrW9s9BP0ACst2rm/Fj2lRX
 NfiNT8/SZVtC7a0zYYH3yW5VXe4e4WEF6pNbfI3WI37bDLGe1/IuJ2PUoCCjbReM9zfj
 cMX5bo7sQaVFg82BliSVjntCnH5NGQiGb7np5P2QqUJ5DRXIqKSM7GSdT6Goi+HFLmAy
 mMNC7CT/2IWhlVVathHL1msVKsvVlWcb5y136w+zWbdmnQi3A1Y+dah0Ssp+LhetJmWQ
 nEHpnkOjGD0HRDpJNG/voJTErLqmaVWDNllSBxfrwTSW5V7x/878amK8OEUTRoMb/kyM
 /ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WcQ4+CIVOFv5Ma/Uu0Wk4p1TFWGDGVH2nQgFbeJ/VA8=;
 b=fgEVeDvWCKAvIelTd8P0ysMPPcH3DfTLxSFj7K9umtvjOYTwMchuUWM5o6cuopWChX
 FJWwCBkupwDE8QueS54MEcmti6aELMd7e92rrj8kKcL0ddbR+gwPUMBPIIMtSXBsKfa0
 e+5UwHhy9r4yLagGckuT6PeQKSHCxaB5q9FHag+VmLrql80kB9mUZR/SMWmPUt3oqxeG
 nySNKIhahWHpTC9XZZvelbF8Q9+BXl4+ilUISXNmVReWqa9XNpnkyhKxbfhEVwCwG+4H
 q+HocImvTYzxFIEeZUeCr44ZWUOxJyaediQPZshPPEiKP3uLgMOfZonBB3eTKC7IaONI
 6eCg==
X-Gm-Message-State: ANoB5pkcxPsr7lgHmQQpxh4iPTcS9srphjWfZGesiNQlS/ADwYO5fh6r
 p8Dh4gQ/O6XYJf11VBbwQKNGyW+znpI=
X-Google-Smtp-Source: AA0mqf6qAkzrs18iv85JlH6iXrvYTUggnbolnnv4dMj2d8H42u3cHYpQQ3ObvvB2fj5WZ1Unoa4QWA==
X-Received: by 2002:a37:86c4:0:b0:6f6:7af1:50a5 with SMTP id
 i187-20020a3786c4000000b006f67af150a5mr19991634qkd.729.1668617562672; 
 Wed, 16 Nov 2022 08:52:42 -0800 (PST)
Received: from smtpclient.apple (c-76-119-84-128.hsd1.nh.comcast.net.
 [76.119.84.128]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05620a298100b006ecf030ef15sm10324916qkp.65.2022.11.16.08.52.41
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Nov 2022 08:52:42 -0800 (PST)
From: Steven Schveighoffer <schveiguy@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: M1 Mac with OSX 12.6 wifi dropouts
Message-Id: <500E3D1A-A1C7-4084-90D4-CE5AD467A7A2@gmail.com>
Date: Wed, 16 Nov 2022 11:52:41 -0500
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Mailman-Approved-At: Thu, 01 Dec 2022 13:09:15 +0000
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

Not sure if this is the right place to ask about it. But I have been =
using wireguard recently, and I have noticed that when I enable the VPN, =
my wifi signal immediately goes down 1 bar. Also, after some time of =
using it, the wifi will experience periodic dropouts (on the order of =
every 10 minutes to 2 hours)

I=E2=80=99m clueless as to how wireguard can be causing this, but I =
found this situation by rebooting into safe mode, noting that the wifi =
did not have any problems, and then starting up wireguard to see the =
drop occur.

I=E2=80=99m noticing that WG for mac hasn=E2=80=99t been updated for 1 =
year.

Does anyone else experience this issue, or know of its cause?

Will also agree that it=E2=80=99s possible WG isn=E2=80=99t the culprit, =
but I=E2=80=99m having a hard time narrowing it down. If anyone has =
experience in how to find what causes this, please let me know.

-Steve=
