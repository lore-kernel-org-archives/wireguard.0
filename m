Return-Path: <SRS0=CAqW=O7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4593DC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Dec 2018 05:29:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B7A21939
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Dec 2018 05:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F385ScT+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1B7A21939
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1fc4f23;
	Sat, 22 Dec 2018 05:28:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eecf17e
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:28:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57bb5525
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:28:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53314a3d
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lZ/TJEFfOGn4bCtcqrKEphU83Gs=; b=F385Sc
 T+BFZmFdEjY6/NYAJ+UhhlqHYio76ostGrbUy7gR3kMxuhPIv9IN0w/OZuhyQeZK
 7L21hXT6pHpm2iSwcpkRpIyGMOvcSJLjMnYcxbtAAxRfYenhfNvpI/04mQbF2K/g
 /v9Yqazqtcd3HSdkKgzg21BGzxj9MUY/3fAhv1mOgOfGKu9auCC1u4sBvW0Grr0O
 IlQyDqGc0iJiSK/XBL4+6XzHycrSf2dpzdcuygGvrOXh/LwS071TXB4maHg0//dk
 2HbFpfmspvoLm/7rh9eriNRmQIPASSw59f1P/NpW0uDgrH6Mp9IYxwi8EOOz1Ox9
 uzf/XvqJMvP4Fvdg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a84a1f3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:19:28 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id v6so6525542oif.2
 for <wireguard@lists.zx2c4.com>; Fri, 21 Dec 2018 21:29:38 -0800 (PST)
X-Gm-Message-State: AA+aEWZLKCTj/pz0Stt/Ol8N8wzhHYgwq22uK9AvbPTikjSZ5cnOxJmS
 ofwIzDD3JQgPwrjTHdn+n3NzECTczJgwCAowgFI=
X-Google-Smtp-Source: AFSGD/WPhOEtFBrqCHc11fmgzmCSSbvegtb5ibYQEn92yl9q5XvezF5cqJFLEIOmN7YyBpcsMfZw3+/3YH8SRMewcYQ=
X-Received: by 2002:aca:2c05:: with SMTP id s5mr3334396ois.190.1545456577739; 
 Fri, 21 Dec 2018 21:29:37 -0800 (PST)
MIME-Version: 1.0
References: <CAH0N1aTX3SYqGLER1nkWaGmCUqjFSyHbx6jj_mpN2pEh+fcZww@mail.gmail.com>
In-Reply-To: <CAH0N1aTX3SYqGLER1nkWaGmCUqjFSyHbx6jj_mpN2pEh+fcZww@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Dec 2018 06:29:26 +0100
X-Gmail-Original-Message-ID: <CAHmME9rSaZOTgx+2yYKuvjt9Psda8-rXjLQOKe-ntB-Y=zndww@mail.gmail.com>
Message-ID: <CAHmME9rSaZOTgx+2yYKuvjt9Psda8-rXjLQOKe-ntB-Y=zndww@mail.gmail.com>
Subject: Re: Android 3.18 inline kernel build failure
To: Jason Edson <jaysonedson@gmail.com>
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

Are you using ccache? If so, clear your ccache and try again. The
exact path may change depending on your build but generally this
should cut it:

$ rm -rf "$HOME/.ccache"
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
