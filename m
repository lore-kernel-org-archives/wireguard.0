Return-Path: <SRS0=YfWT=OB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D65BC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Nov 2018 17:47:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558E220684
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Nov 2018 17:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="gg0cmhtp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558E220684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8b7521c;
	Thu, 22 Nov 2018 17:41:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83136d51
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Nov 2018 17:41:02 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ada05f11
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Nov 2018 17:41:01 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id 81so8697453otj.2
 for <wireguard@lists.zx2c4.com>; Thu, 22 Nov 2018 09:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=IYn2TH7B262Ueg+5kSbSz9C9TjPKI/0cBhI4bTXXLac=;
 b=gg0cmhtp00ubrTG0nbgQ3LZzZScRD5xlr/ubhOmGV07PyMMISOk+fwIo/TN7GRzEgO
 TudR1eeKGNvALRfN1piOwdkLCU7Itm69Kreuw1bPXcre7yV2DdVm/UYl6k1NMgue/PbN
 WRMnlvgj2fNyOevtKOeHtMhsQrKSGXp+3Nbj+rz3/9bmfbmEQdnM0jDtQh9XnMUmh7mL
 pY6W+FWQjFeuDyZ/pAsSoa7Has+WOQC1sPsWXoknAsyAtMatvwOs1L6dRnBES0avYuc/
 1nv5Q+bdLaL3Whgf751TfIjMdep7Ql/YIH+9C0AYApZz5Wtq4loumbD3AUBcr8dKTh0R
 i52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IYn2TH7B262Ueg+5kSbSz9C9TjPKI/0cBhI4bTXXLac=;
 b=WX+cL8rrWftp8229X2iPlCVexbJOEELbdhiTvJBv45yEpSDOskl+FfGzasQKvr94cb
 z0ehVoN4+0+ICuTd9kJr3/dqdUHHSTs2O7WYhcz5V6LW3dvb22kw4Ov2p7qgUzwmuP4N
 /LtBr+4rxIEO8M3zISvHtjRpgU/kDz0e42wQfEqY0kubITNo1ed46BtA8qv8OVez5rF+
 0dSTqeCk/RYl66eWyAFuhaakZoJd9NrOFIhZu+ogJsVpFcf5PinLIUD7D4WqWqH0UPBk
 bE3Z/78/AZWeeq1yKVs91zXc9yI+JjI5jFzliApVvix/9bp3C/iMVsqe/2G+6ozBjfu3
 HjRA==
X-Gm-Message-State: AA+aEWahtnWFiNITnhExSrguqQOcTwEiCHlVc/dxZORP5kMTxV3Jlyr5
 GJuDGq8SaQ3O45ieQiqhoT9+TIVIZvIvbK5lnmvkpv3iQks=
X-Google-Smtp-Source: AFSGD/XgtIKTvRiDiwoA7wTinL5b6aJ50uBNcg1/z/KyYtD+aoZ5IqSpSUv4GDSOFN1a+geUKFDOli95Csi5hekS4Wo=
X-Received: by 2002:a9d:5004:: with SMTP id a4mr7163863oth.66.1542908844344;
 Thu, 22 Nov 2018 09:47:24 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Thu, 22 Nov 2018 12:47:13 -0500
Message-ID: <CAO_nJAYGman8=av2iLjnxaEMVLaH=H+392iZ6YrcxLNxTK+hkg@mail.gmail.com>
Subject: [BUG] iOS client (0.0.20181104) sometimes kills WiFi
 connections/switches to LTE
To: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Summary: Running on an iPhone 7 (iPhone9,1) on iOS 12.1, I sometimes
experience a loss of WiFi connectivity when I connect to my WG
profile.  It is not happen 100% of the time.  When it does happen, a
reboot of the phone fixes it.  Is this a known bug/have others
experienced this?

iOS client version 0.0.20181104 (4)
Go Backend version 0.0.20181018

Server is running on Linux, kernel version 3.16.60 using the
0.0.20181119 snapshot.  Hardware is an ODROID-C2 if that matters.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
