Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8756BC3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B8E2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YxonYKIM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B8E2080C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92623ca6;
	Sun, 25 Aug 2019 15:39:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef34a8c4
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:39:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92ede9d1
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:39:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66fdfb2e
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=gmIAXB2StLnGal31Le/ptGzhTks=; b=YxonYK
 IMv3I6XP1Rm9BHvV1w2LhJbUfwRJuR0iiZq+uc6SF1JBoHI+6maGOd0gP6ch/4E5
 ms1ZlqyL81OSVUXX2GYZ0UJ0DWxy7sOQMtMmAWVHiCrifc23GFUgyEAnBLjG+FsF
 8tNOSI6gmWk82QpuTgq5XmmcK8OFF1vsX6//YUMMZ7i1FHWQrNLzXOZb7Cum5jNz
 N4xpmUrB6nUE+L3e58Rds54ru51WIF+n3xqAVFUFu9JZ82yiLT7ZEmXKRj1C20sm
 5cwE+jMFzpcRplVZPkIqa/nHh8Dm+So6PftJ9vr98gF4ZSBKIFp5200WUJ+HbIwv
 K4KorPmzW7btP9ag==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b5fde180
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 14:57:16 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id o101so12971581ota.8
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:39:03 -0700 (PDT)
X-Gm-Message-State: APjAAAX+GzxfPScseJbrc65OtwIWVGDiP01ajaxqENFpCLeq4Sekp4//
 +f2eI0tzubLkcIWnZ1bD3n1cxjZyCy+EU4TdxcY=
X-Google-Smtp-Source: APXvYqwdgW4smL8YjJFN2PXDMbVp38eEWBe/pMiAZ5091n5GgVCHYgUHJsbR4ngnyRoaLSaf9EtcLVIq7kKhVVxnAkI=
X-Received: by 2002:a9d:6854:: with SMTP id c20mr12217248oto.120.1566747543486; 
 Sun, 25 Aug 2019 08:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ4Stih2kODmeh9zqRD_EBb-ZAyvKdj3TyKcgMktO+t+Qix60w@mail.gmail.com>
In-Reply-To: <CAJ4Stih2kODmeh9zqRD_EBb-ZAyvKdj3TyKcgMktO+t+Qix60w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:38:52 -0600
X-Gmail-Original-Message-ID: <CAHmME9omeS_rYriW+ArJYB384Ey2hxMVDrKpvwvdCs=Mts3xsQ@mail.gmail.com>
Message-ID: <CAHmME9omeS_rYriW+ArJYB384Ey2hxMVDrKpvwvdCs=Mts3xsQ@mail.gmail.com>
Subject: Re: How to use or run wireguard-go program on Windows7?
To: zhengfish <zhengfish@gmail.com>
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

You want this repo:

https://git.zx2c4.com/wireguard-windows/about/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
