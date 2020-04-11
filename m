Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1DEC2BB85
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:27:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3689F20578
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pmfarmwald-com.20150623.gappssmtp.com header.i=@pmfarmwald-com.20150623.gappssmtp.com header.b="GEH9B7d8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3689F20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pmfarmwald.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c273b383;
	Tue, 14 Apr 2020 08:08:59 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6a5a0c48
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Apr 2020 19:04:10 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id ay6so1025610pjb.0
 for <wireguard@lists.zx2c4.com>; Sat, 11 Apr 2020 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pmfarmwald-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=/DZEecSLmGmErHbMx5Hri2NbTMDdxw/Pbw8apj1GxaU=;
 b=GEH9B7d8rSg6mYiCPdbKJQ5E2wZqQdvpy/xBQEkPJl9b++g6G8UYcwD2btcpr/YPUD
 ULZ1uLRpN1RNNWigVhXSOsIaSvZ9VnME7XpMmTSUzD+PCL3qgXPJIlT/H7pLhcyeRemT
 3P1qQYJAnmk/g/RzHHWJrICJTN4PxP3S8kKo90kDncD/zaNI+LdbMxl6e2CeHH79OUvM
 oABRT+ky1ZADbnAgzp16Hx8l9S6+6hZlZuYDTfl378TvTpW0xlhclrE8yLcoYcC/ReiX
 4MW9OeuEodyKR8e+8i6edEhZHPEe0KHptjyxkP9R2XBFEQxneXzy4lt3AjoYCZ5CBoQ9
 bdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding:content-language:thread-index;
 bh=/DZEecSLmGmErHbMx5Hri2NbTMDdxw/Pbw8apj1GxaU=;
 b=L4YREVoIiA9L1YO7OAaRmEnfPkg5EFvC9Cr1Ofm5JA0ExbwF6ZKzqemG2ygXcyTUqk
 cMTDcjzo+Rx4YfrSs/6Iwnb2W6EE/fdv0DdqNLv5RKwtiuwGFWW/0ddUggqo+ANk+vWY
 ph2vfwJksqQ2igFRYQ8rrff9C5smpX7ktYPMh2biVF3nAv9pN6DLo1vFN3w0HNWEqNQj
 B77RPAkoSwbMHiqIsV65bj43RbUxyRJoSz0a2ojwzglPjpI43Rvu2AKw+YFC6TbkilDG
 qyg7RtYgPjEzqro1ZWQzUoaeLZYJwr4bi10bNe4kR0vtfSAvBkxTyTER2nplo6/rwl5x
 E5Lw==
X-Gm-Message-State: AGi0PuZkfcPrcWg6vhpvaaNnLzwxeNJz8a/s7PL6bayEJfLVnVoF2O9p
 FbdS51/avh1QudNA4Je9vztyP/ZVLMPF7w==
X-Google-Smtp-Source: APiQypJTESkySZCPxug3ht0UX6CyRIoGVzuQubdni2w4ivxbykS7KCT8Kfkx55dXpNZSUorim0n3jQ==
X-Received: by 2002:a17:90a:8c10:: with SMTP id
 a16mr2988746pjo.78.1586632417253; 
 Sat, 11 Apr 2020 12:13:37 -0700 (PDT)
Received: from OakOfficeN ([148.64.120.90])
 by smtp.gmail.com with ESMTPSA id p68sm1906031pfb.89.2020.04.11.12.13.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 12:13:36 -0700 (PDT)
From: <mike@pmfarmwald.com>
To: <wireguard@lists.zx2c4.com>
Subject: Is there a way to use wireguard as a non-encrypted VPN?
Date: Sat, 11 Apr 2020 12:13:36 -0700
Message-ID: <9a3401d61035$4d6b5840$e84208c0$@pmfarmwald.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdYQNUAyA+Y/CbbRSl2RlhDEOihBFQ==
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:08:57 +0200
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

I have some older routers that run OpenWRT just fine, but are a bit slow =
at
Wireguard (3-5 MBytes/s for SMB transfers) and which are too slow for
playing HD movies.
For these routers/uses I don't care about security, I just want a VPN to
tunnel (thru Comcast, and other ISPs that block lots of ports.)
If there was a way to use Wiireguard=A0with encryption disabled, I'm =
pretty
sure my performance would be closer to 20-50 MB/s which would be more =
than
adequate.
Thanks.
Mike Farmwald



