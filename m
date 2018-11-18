Return-Path: <SRS0=U3rm=N5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E7BC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Nov 2018 23:15:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9A020815
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Nov 2018 23:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="cVT/UgLg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D9A020815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38df16b7;
	Sun, 18 Nov 2018 23:09:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c63a38d
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 18:50:12 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e88743a
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 18:50:11 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id t204so767179oie.7
 for <wireguard@lists.zx2c4.com>; Sun, 18 Nov 2018 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=tBBOHXwfmjZkmQLTLiR08oM1Igq14gPyHi2S6RmFGTI=;
 b=cVT/UgLgUsl2OQuatfUhaFw3hwT9Sw44JZUyYnGV2juxLpiViMHPNE3CUT3HlnACoD
 T/VqsSLPyp85mJZKSpQqYo/fsP60Zk2i8fsGnueOiybK2elFx8fPqhjG+uOVdRykl9SU
 v0Sj9MpBxt+nHvIzWzXwQjflGtR6VYJ1WaxM2hGIFAD0lUenfcSvDA9IaBAZkyAknuvx
 Dd1LMzuvfQWeNd+0QZzd/PpLoZZU5Qj5WZ0nUiblRZy8W4ylItkY4mV2cL3f2GKcbJWJ
 4yWEWm7u3fxfNP4ZNvusmY3ij7qE8mbhWQyo6cD2IHiqa5r2zFKQb/C0V4sPY5jdlUXG
 ha3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tBBOHXwfmjZkmQLTLiR08oM1Igq14gPyHi2S6RmFGTI=;
 b=I1VEP+7lCSV/Z+Loin6n9I1jT2yb0jL/q4q73y8+/zbLFbN+ZOlAq0fvGRr2bsn3ZG
 03oNUGA+WIt7GatwDcNYAwE60Tv/16NmNAPOBxAH/XWI3A8xcl0c3oZXd58/6FMoyflJ
 cQ1jBeDyWvsxE4ZK37DPO6eWWxbp+d2DAgnqYUw+fzpQVYIx45sq8g07zFWErwFuiu7q
 lAFpsbJGAzerByQ+r7BxINVhDLrOHUmFflT7rAKw8eUHdUz9nG73/IK8hRFjEaBHjfAV
 He6oO0uEejOk82y3sarofp48Hv1JKEUS3te7+UISZ4JNZhkKrd9pDMzEOXk3o5I8iK5b
 9p3w==
X-Gm-Message-State: AGRZ1gKSi3To7mr+orgxQuxeS7l7h7ANxqAkVFopBOy86PMCu0b5UdUK
 TR36Gnuz+u7zvr57g/ZXdQd9PE8TyXfmK77CneeiiC/JYEU=
X-Google-Smtp-Source: AJdET5fIXWXJvUpe9+SgMjp9uQxQDgGGX7yrlH/2Z7vW7ZUoPJeSidEZAVrgL1rOV5D5AFPv+jtA9C4DXckDxy5UWVk=
X-Received: by 2002:aca:ec55:: with SMTP id k82mr4814292oih.55.1542567364404; 
 Sun, 18 Nov 2018 10:56:04 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Sun, 18 Nov 2018 13:55:53 -0500
Message-ID: <CAO_nJAZRTXB424FKTew726LUieeAtpj1crXucf2deoQXVyw__w@mail.gmail.com>
Subject: Traffic on port 53 fails on LTE but works on WiFi
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 19 Nov 2018 00:09:49 +0100
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

I have a simple WireGuard VPN setup I use running WG on a home Linux
box and connecting to it with several iOS clients.  The server peer is
setup on port 53 since a the networkadmins of some remote WiFi
networks my mobile devices seems to block udp traffic on higher ports.
Encrypted connections work fine on WiFi as I have setup, but do _not_
work when I connect via LTE (Verizon supplying the data).  On LTE, I
am no longer able to transfer data to/from the server peer but I can
handshake with it.

If I inspect the output of `sudo wg` on the server peer, I see the
endpoint IP address changes to reflect my Verizon LTE IP and the time
since the last handshake reset to a few seconds which is consistent
with my ability to connect to the WireGuard peer server.

I am unable to transfer data (pull up a web site or check email etc).
It's as/if Verizon is blocking my data flow on port 53.  If I change
the port from 53 to 123, it seems to work fine although I do not have
universal connectivity on the various WiFi networks I visit on port
123.  The optimal port would be 53 for my use case.

So the questions:
1) What can I try on the server peer side to diagnose?
2) Do people feel that Verizon is actively blocking the connection on port 53?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
