Return-Path: <SRS0=NPIR=XJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C17EC4CEC7
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Sep 2019 17:11:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECFB2067B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Sep 2019 17:11:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fmj8pQTk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECFB2067B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e04e4803;
	Sat, 14 Sep 2019 17:11:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84ca73fd
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 17:11:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9c27ff4
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 17:11:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87f43fbb
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FI+TybkKqcTKReQ7ISopuMfzYOE=; b=fmj8pQ
 Tk2ii5admZBZFcqDJV59EMyNKWeAFKKOI4f86ZdnUdRXMugViMuilvRWx3vGBnz6
 5ua8qfju6QZdXv6VsSAYFf8j2GGGGztZ6lNxCXk08SsCnjijhkB3oQ30UHMZHyGx
 A40kZwKsCiHDALnWNtC37mkIGlhFR3toqp3iRtSyyD25CFlzvQcOUbhYxu8k6U+s
 0feSlZI8zkGsmnlDtyJFRlaElxbkmn2Hstrx67t2IDH6mFzPl3IIoOeOeaXAHBED
 XIo7XwVBziks7uuUCyi6WTXz1mKABlaOMrhSyjaIuJiU10CAj30xYLsCyX1Sp21H
 dzEKsKgzRV6asNiw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 359b01f2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 16:26:50 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 67so32172938oto.3
 for <wireguard@lists.zx2c4.com>; Sat, 14 Sep 2019 10:11:12 -0700 (PDT)
X-Gm-Message-State: APjAAAUL65GwWSKuR0kdiSWlOgXTDBoVO0FrcMFSLKupEIOlqBeQUPnY
 z/z/jRVHcoCOwCkK0dRu8A8zSGkhFOOzFRfJAEc=
X-Google-Smtp-Source: APXvYqwkLqlZ0ErqTCLUtWZ2fAxda0PQ0eW86NqdBCt9LdaWrZeevc2IgPw5ATQ/RY9ffQ2tW/Mdsd6RRY2H07xEKTA=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr38242484otk.369.1568481071780; 
 Sat, 14 Sep 2019 10:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHo=znZWFs427fDRYPUx3jxjXR01McUFwsOQR9rQy4ocWwyRNA@mail.gmail.com>
 <CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com>
In-Reply-To: <CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Sep 2019 11:11:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9p0ue59kxwD3BWGLmU3U-SmO2fxxhP7ubCsGts2GU-aZg@mail.gmail.com>
Message-ID: <CAHmME9p0ue59kxwD3BWGLmU3U-SmO2fxxhP7ubCsGts2GU-aZg@mail.gmail.com>
Subject: Re: On Windows: Wrong source IP address
To: Sebastiano Barrera <sebastiano.barrera@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

To give more detail, a more ideal solution would be to specify the
source address / source if index using WSASendMsg, and retrieve the
incoming destination address / destination if index using WSARecvMsg,
and implement sticky socket semantics. A linux implementation in C is
here: https://git.zx2c4.com/WireGuard/tree/contrib/examples/sticky-sockets/sticky-sockets.c
and in go is here:
https://git.zx2c4.com/wireguard-go/tree/device/conn_linux.go . If you
want to provide conn_windows.go that implements sticky sockets, that
would probably solve 80% of the problem. The remaining part would be
policy routing for the case when we don't have a sender if or when
it's gone stale.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
