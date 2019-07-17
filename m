Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6F2C76195
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 21:01:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB9F21743
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 21:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Y9ile5qX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB9F21743
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c81abf2a;
	Wed, 17 Jul 2019 21:00:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9b64d92
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 21:00:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b93816e1
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 21:00:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfb4c394
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=50oGHcdkt8URnZriNEgPw7Z811w=; b=Y9ile5
 qXDk5M9QhAAzKD812CbQ7XHQ1+11PMx+WJHnS7czhor6m4AUp0JCkYOB1BjBi3R3
 eJWWdJuZz8pimctdPqHx+CP4oEZNUB0GWd/HIrSwLQDmElkW0+QB8N5EuoTVQeR2
 eh5i2TM9bC14jRd3eCvaLbyK9h/5vL5kocuChyrcC/gZM1xkn3IaE6F4AJd0fWN1
 yItjFWFULYIWdqj2y6+dIco43LETEG1uFflkFhGTzK9PJ8AsLocc2SGSr92EvEkL
 RxdirC1O21fycXmNsjQiygXvoEgfvHfZ5mVrHbNDL/PNYO0cry5j01gJYMNxnoLK
 oKgalmj2+yE4+JBg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b6229219
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 20:23:54 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id l12so19705612oil.1
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jul 2019 14:00:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWIoffPPu19rm9aTYYFMQ6w23YlY5gqgbVkOcBVEz/2NuOqLuru
 BH1cqxiiy4wmC9Os2KTbtZwLz9XfauTlNU4355w=
X-Google-Smtp-Source: APXvYqwUb0I8jG7GDfvfPP/kz11aSMa6+WoDeTW7ib8JUlcwq4dAS56UbRFNF0OCQt/+PAS4J3KW0Hd2U1nnrUDXgN4=
X-Received: by 2002:aca:4711:: with SMTP id u17mr21975088oia.115.1563397241145; 
 Wed, 17 Jul 2019 14:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <e332179c-68e7-46f4-1f4c-7c6b899b0864@syseleven.de>
 <CAHmME9pYWcA_AJ6-UFqq-hUVdXfSadkBWQpg68ee=_R-ttgthA@mail.gmail.com>
In-Reply-To: <CAHmME9pYWcA_AJ6-UFqq-hUVdXfSadkBWQpg68ee=_R-ttgthA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jul 2019 23:00:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9qATuY5us=Tb9rDXpDqM2yC-14os1=_26q3zfXv0RvJ2g@mail.gmail.com>
Message-ID: <CAHmME9qATuY5us=Tb9rDXpDqM2yC-14os1=_26q3zfXv0RvJ2g@mail.gmail.com>
Subject: Re: Wireguard in OpenVZ with NETIF_F_VIRTUAL feature
To: Benedikt Braunger <b.braunger@syseleven.de>
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

Can you let me know if a patch like this does the trick?

diff --git a/src/compat/compat.h b/src/compat/compat.h
index 62885500..d28657cb 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -844,6 +844,10 @@ static inline void skb_mark_not_on_list(struct
sk_buff *skb)
 #define cpu_have_named_feature(name) (elf_hwcap & (HWCAP_ ## name))
 #endif

+#ifdef CONFIG_VE
+#define NETIF_F_LLTX (NETIF_F_LLTX | NETIF_F_VIRTUAL)
+#endif
+
 /* https://github.com/ClangBuiltLinux/linux/issues/7 */
 #if defined( __clang__) && (!defined(CONFIG_CLANG_VERSION) ||
CONFIG_CLANG_VERSION < 80000)
 #include <linux/bug.h>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
