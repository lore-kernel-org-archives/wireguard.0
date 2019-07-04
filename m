Return-Path: <SRS0=di/l=VB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1922DC0651F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 15:38:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C99B218A0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Jul 2019 15:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wwWmOX11"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C99B218A0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83a7aa5e;
	Thu, 4 Jul 2019 15:38:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e14e5b4
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 15:38:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 066c0533
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 15:38:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71f287db
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=8KCTTh
 e2MKWPc3ahh4QGj3acn6k=; b=wwWmOX11T/JthCfkWsrprNEVf9LEzj8Lt/WCk6
 RjlNKNfCTaktOSOne+meQGduKpGZbiiXg6PlQ6PdVI/evs/bGhH/z6FiVms/rFuU
 f8K7/NHsyQOogOAeGuYv0Stqo5+1Hlak2++WJFHY29HJQ48i5IBbqBMFLI+kq9KT
 Hk5c3OhPJO+lYykUVrkt477r7NxI9PvSx+Vas9eCJpNTjrsnIrGxWcDXn7RNGlw5
 XsoD7fKFQEAbH9qfPky7/QXCmRru7+wFJvzzn0kIUUfAjA+WbOi3d+WXwUbiABfB
 TX5Dd5+nGc6oBXG0WJVaUEmtwV0EhH/1Tu+uHK8FsmmKe/aA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bdcf4818
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jul 2019 15:03:03 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id r21so1636447otq.6
 for <wireguard@lists.zx2c4.com>; Thu, 04 Jul 2019 08:38:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVB4zTxX30sb88I6KezL0NigNdXfll4mGs3ZEfFOH23ZvGMdgPg
 VX/tXmfkGJfIIeU73LFTTCrWXuGHXVxXXK9KeqE=
X-Google-Smtp-Source: APXvYqyzDqipgChKBlRhe9+pUNM/obKmWphtcJ+09tqHW+N50ly6O9c8ULVZ/EhGfZTx65rVgaPzHpNxmSvQnZ3Rhyg=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr1340548otk.369.1562254687703; 
 Thu, 04 Jul 2019 08:38:07 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Jul 2019 17:37:56 +0200
X-Gmail-Original-Message-ID: <CAHmME9qyLd3Tn6AF3OQ7HhZwBuBaSs3E8Jb0vgT2Za_K2gLRvw@mail.gmail.com>
Message-ID: <CAHmME9qyLd3Tn6AF3OQ7HhZwBuBaSs3E8Jb0vgT2Za_K2gLRvw@mail.gmail.com>
Subject: wireguard-go seeking love & maintainership
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 golang-nuts@googlegroups.com
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

Hi,

The WireGuard project is seeking a technically capable maintainer for
wireguard-go:

https://git.zx2c4.com/wireguard-go/

The project is currently maintained, and it will continue to be
maintained in the future. There's no shortage of man power, and we
aren't facing any imminent or foreseeable future crisis. The codebase
is alive and healthy, and there isn't any cause for concern.

However, it would be beneficial to the project to pass on
maintainership and general direction of the code to somebody with a
stake in both Golang and WireGuard.

Let me know if you're interested.

Thanks,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
