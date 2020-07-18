Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8376DC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 12:41:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 263A3206E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 12:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YALepo3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 263A3206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caab46f0;
	Tue, 21 Jul 2020 12:18:41 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 36587ac6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Jul 2020 19:21:54 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id d27so10212122qtg.4
 for <wireguard@lists.zx2c4.com>; Sat, 18 Jul 2020 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=An7xGtaPhI8TnNDqvi4Af72eZW3FYswASeSa8CnQMGw=;
 b=YALepo3XZ2P/Lpl24HB0/CTEgg1YIJp9WNWvgFD04lf0mFtwcC3Uopq56+BpL7NuZZ
 z8ChYole9/H/li2y1wIVNqdqaxHDLtg/iRJtrWi3tAxGK8ryIKP+hY2jo7PtAY92SBms
 MtbYKYKhJ377g4Dtg3UiYLzBzMA2WtEu1Qc6OhIQ0RpxFOtXjyqrbnNOKBJ6ZWv3f6BB
 xuqNaMuCoTSOG9FalTxCkvsVxlWClliKfgoumoxrYB/IPo5OQeh9QpkoVPgVylYdS7Tg
 IphFPSViMT0Kc81CcLDAicFCFNKa7qIrbJl+rMZuugyLosdhaafFnvylRbq3PCyQTt2X
 r7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=An7xGtaPhI8TnNDqvi4Af72eZW3FYswASeSa8CnQMGw=;
 b=jaELECE2cln6nHN8Sy/kQOrYPW0xvTAKA/jE16EJcCK21RyTqqIrYEFBWNFf5vbbNR
 /XGNffkqZFz0SWi4kDlFGCryyS3YUSKpYEz8dEgsCYBYmYqlCZB3dOKJBSUmHhSt6QhE
 9/wxMd+ipqJP8kgu8ew4mBz49yIc3eP5SIvSYwB/TuXAQaezxNFnioiy1eq+NEm6Y/+6
 /rBdZPfMob+hX/5126oFw8b2XhK6/vpMSqd982o5uPdOnSC1xeE290ZLqFGxE7462bty
 qsFMKbUqsJWTXVaN/EKy2bMBvr5wcLpEVgHLSm4S4haHBTi0V02i2mbmDniIyURamBkv
 sk/w==
X-Gm-Message-State: AOAM531xdfi8+EjuWSLA9Vpdy3uWwIkqAnRr5rWKI89Y/rKLxVH21sLd
 sncZM3tIzNjt/Q9zbqEhO2M1pzX7ksU=
X-Google-Smtp-Source: ABdhPJyygcmoPyjq4ILqjraatxxUwLfOmp26BIAfTJ2Wqi9DuDbRaRgZdLzHJ9GaLpLeQOgGE6gf1g==
X-Received: by 2002:ac8:3fef:: with SMTP id v44mr10829770qtk.379.1595101444518; 
 Sat, 18 Jul 2020 12:44:04 -0700 (PDT)
Received: from richs-mbp-pro.lan ([64.223.239.17])
 by smtp.gmail.com with ESMTPSA id w8sm4335959qka.52.2020.07.18.12.44.03
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Jul 2020 12:44:03 -0700 (PDT)
From: Rich Brown <richb.hanover@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: macOS WireGuard GUI - password not accepted when editing a tunnel 
Message-Id: <30FD0B9B-3031-4585-AC88-AD52AEC2632B@gmail.com>
Date: Sat, 18 Jul 2020 15:44:02 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Tue, 21 Jul 2020 14:18:38 +0200
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

I'm using the macOS WireGuard App version: 0.0.20191105 (16); Go backend =
version: 0.0.20191013 on macOS 10.14.6

I can create an empty tunnel and fill it in. But I cannot edit it: =
clicking the edit button and typing the password causes the password =
window to shake. I can however, delete the tunnel, and create it anew.

You can see a video of the problem at: https://youtu.be/XlCS1Cb2ubk

I am certain that I am typing the proper password, using exactly the =
same keystrokes as I use to log in. (Password is mixed lowercase and =
digits - no odd characters.) I can successfully log in using the same =
Wireguard app version (with proper password) on my other laptop =
(Catalina, 10.15.4).

Any thoughts on why the password would be rejected? Thanks.=
