Return-Path: <SRS0=U3rm=N5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A559C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Nov 2018 21:59:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCCC20817
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 18 Nov 2018 21:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gk41/7eY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCCC20817
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b66face7;
	Sun, 18 Nov 2018 21:53:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dc7e99c
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 21:53:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ef5952b
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 21:53:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 300559c4
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+c7rWnkuPXMGukNuC6eVvQx55Pc=; b=gk41/7
 eYO0/UvWBxZVO+YQtCd2QzqTwJtlKZftGV8UkZOT6aODKX6OZLUkc2iwREPjLYl1
 Om+KC+pa3ZgWX5IeuD2SLD5gHRy59PmgYTsbiUiIbDZn7PdyefzwU4ls/KgcKnh5
 2NY7dj1RDgQVqiYvCKBtkXRMJYobBouL0U2EQuA3buujQ/Pzll4BkJTIwvVEXw+O
 dO8FLMflSMgml9Fd1EbelwOrI1nqerfuLfobfoJtbsCGu0zsAHJUF1VeSIq3Upa3
 X2MsQ7Smd2a4KvQkKBAKiD4Ma7awtUI+eO8uGj/SIrNBJVSBJGDOPTlC3EwlsDqG
 SG1O4qhWn91jSP2A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51e87fb3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 21:53:51 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id w25so25246268otm.13
 for <wireguard@lists.zx2c4.com>; Sun, 18 Nov 2018 13:59:46 -0800 (PST)
X-Gm-Message-State: AGRZ1gIR4oIlXvAwK4Bd0Slyvr+gI6U1yBPAPmDKH/DFuD+4vRkERo5J
 SmQrF+6hR0DLOKFchcC9mbhypMCmpwqPmrBMV6o=
X-Google-Smtp-Source: AJdET5f32fTnAJmoPbFgbZE1yy8S1J3sJz8+ZpzgU+OuU2eJyuUU5v/O4kB+EDrgYrE4Vtg3p3kc8/k1bmNTdnEgPJg=
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr7597548otg.223.1542578385681; 
 Sun, 18 Nov 2018 13:59:45 -0800 (PST)
MIME-Version: 1.0
References: <f56048e6ddabf5625e2f04f762e6ea22da6e7a7d.camel@eggiecode.org>
In-Reply-To: <f56048e6ddabf5625e2f04f762e6ea22da6e7a7d.camel@eggiecode.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 18 Nov 2018 22:59:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9ru_UdcC=thfza2B6kLXGT_BusxQVKQVvT6_bCYJxNYXA@mail.gmail.com>
Message-ID: <CAHmME9ru_UdcC=thfza2B6kLXGT_BusxQVKQVvT6_bCYJxNYXA@mail.gmail.com>
Subject: Re: Problems with kernel 4.15 on Ubuntu Bionic & Xenial
To: Egbert Verhage <egbert@eggiecode.org>
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

Hey Eggie,

Do you have any instructions how to reproduce the situation? I wonder
if [1] fixed it.

Jason

[1] https://git.zx2c4.com/WireGuard/commit/?id=e2b2f345d8342cb7d2674e621a5fb0baf0bf08d9
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
