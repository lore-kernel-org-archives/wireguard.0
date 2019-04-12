Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF41C04AAB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1AFE206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lincolnloop-com.20150623.gappssmtp.com header.i=@lincolnloop-com.20150623.gappssmtp.com header.b="Z8XOLzCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1AFE206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lincolnloop.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f4aff02;
	Mon, 6 May 2019 20:39:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b57c4412
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 18:07:42 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08c1b478
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 18:07:42 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k8so9674184lja.8
 for <wireguard@lists.zx2c4.com>; Fri, 12 Apr 2019 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lincolnloop-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=BU7N/jlU9Dgm1AxR44LVIaT5eFS0sAMR2KwuxXqYMU8=;
 b=Z8XOLzCaPj5X+4cBJ9GOKe91WD7H5QHhS5OYDVpTRlqf3P/wdoIEgDQocWwlxOVQqk
 RgQXJt5a+zgdLA9bjcWMEOiKGgeIl9wfSnIjWGcFGrckuYfJVpPg9HAG+Jsv6MrBRHRw
 gAJO4/gj2IgCfgfPtZEUvidwUZXi3f/0bMi+gF1w9wqpG+9+GiiDR8fG0Y4LKdQG6n+W
 pZQQvdyM8qr+pYVrwpXfYo5316NkVNB5mQ0pSC/ydIudFwb2x+fSR5C7xj6o9KQBDuAE
 votarGOP0BaQy493BiglJHSmqVm7uCCBNquDelYu1B3dop4ywYqjottz0HFur/pzSvAI
 eN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BU7N/jlU9Dgm1AxR44LVIaT5eFS0sAMR2KwuxXqYMU8=;
 b=m+jYoWoJd9csrUafwNNPj5DN5mmSzabAmpDMrFh34WWLk1YCuXrhJMIundcm10QuxH
 RXTCWGU16mlgViclv3B0koo19/R/4M2ayfYM4htj0AyhzsxsZoBZKjuzrI1cKraxaUMT
 9CO99WFmAFXk/UYdRZWpL2BHKKtfQW2hjPkQ7hdGkbmJK4j8wItgbK6CI05GDTfMKBz4
 aXloLj2eQ3ObHjkpXeHDJCIIkY/4x82mhET+97Tbjm+MvtICvbG5aFZPXTLJk087x2U7
 4oHfvwiJVs+2c2UIC0JPtnvez9Uj33fUCWWXQXJRYO5qwpWZuBjXHx/v6tjClxnoKYEl
 5C8g==
X-Gm-Message-State: APjAAAWqpEuU2I7ZYEDm34YPlGVSBovOaUwu4lX6spT/TPZf2WtHV4lo
 xt9R0i3uzEBoXM6ygIPkuIcuesE5J7EUBz1QuUUM0OQBw5AUrQ==
X-Google-Smtp-Source: APXvYqx54vO0D8nHw3kcjP8DlPNeGBiYWw0v4AQuMID7QnA2z381yxAlk1XG5R+pDGY9pRpuZh51+U66qLzLRt6scS8=
X-Received: by 2002:a2e:8719:: with SMTP id m25mr2519448lji.50.1555092460815; 
 Fri, 12 Apr 2019 11:07:40 -0700 (PDT)
MIME-Version: 1.0
From: Peter Baumgartner <pete@lincolnloop.com>
Date: Fri, 12 Apr 2019 12:07:28 -0600
Message-ID: <CAC6K9z=3D=xMwTBRf3sA_5=OKR2R8o6aRa3JedGxzxVEzn-+Bw@mail.gmail.com>
Subject: MacOS client with local DNS resolver
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:39:06 +0200
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

I'm using the official Mac GUI client (version 0.0.20190409) and am
having troubles with DNS after connection. I use a local DNS resolver,
so I have my DNS manually set to 127.0.0.1 on the network interface:

    $ scutil --dns | grep scoped -A50
    DNS configuration (for scoped queries)

    resolver #1
      nameserver[0] : 127.0.0.1
      if_index : 8 (en0)
      flags    : Scoped, Request A records, Request AAAA records
      reach    : 0x00030002 (Reachable,Local Address,Directly Reachable Address)

Once I activate a Wireguard tunnel, the resolvers are updated to the
IP of my Wireguard server:

    $ scutil --dns | grep scoped -A50
    DNS configuration (for scoped queries)

    resolver #1
      nameserver[0] : 10.0.77.1
      if_index : 8 (en0)
      flags    : Scoped, Request A records
      reach    : 0x00000002 (Reachable)

    resolver #2
      nameserver[0] : 10.0.77.1
      if_index : 19 (utun2)
      flags    : Scoped, Request A records
      reach    : 0x00000003 (Reachable,Transient Connection)

Setting `DNS = 127.0.0.1` on the [Interface] section for my client has
no effect.

How can I activate the tunnel, but keep my DNS resolver as 127.0.0.1?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
