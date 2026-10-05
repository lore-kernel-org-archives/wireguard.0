Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EC1CA6002
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 12:51:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8662249a;
	Mon, 5 Oct 2026 12:19:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 003f362f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Oct 2026 12:19:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6B95643449
 for <wireguard@lists.zx2c4.com>; Mon,  5 Oct 2026 12:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065671F000FF
 for <wireguard@lists.zx2c4.com>; Mon,  5 Oct 2026 12:19:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dkim=pass (1024-bit key,
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256
 header.s=20210105 header.b=KLWm9IWU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1791202761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WvcZhpPyG5vqH/W9xhM3lhuLOlqBjjaQC5+yGLvVUKc=;
 b=KLWm9IWUv16V8IWzOIgVLZegF9dOnmy+A608l7vYCAslSyZ/b44GOCApwMfFEsP54Qr4HZ
 TyLdfuhAkGwLWvAkPvlOZmYgaQSfqwUhfPQiZNrCq2GwxWNlgJbKfZAJPiBh59/JkfYwbG
 MEvrVBd6r3OTg5LHrmBwrfRbjYDlhNg=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 2dc6b808
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Oct 2026 12:19:20 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c3156e7705cso71347766b.1
 for <wireguard@lists.zx2c4.com>; Mon, 05 Oct 2026 05:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxaocBwgjRnmzfMgafyahTDfboi+413M/6Ye7zD4hTnv31YBMdFfK22ha/RvdInlpbhqxhwCzCZCb8=@lists.zx2c4.com
X-Gm-Message-State: AFuF++n1Zz8S5Kpef2Ulk9a1q2mKc6VLhlENCn8BxEnTNABY5A70Rhr/
 nw/OZ4ErUZ3clhDXfIU2qWp6mL5BegsBDCL0e23tovDzCEVtVv1wmoxH4pRZPYYU9rNvK/mPt3R
 j1GtGW+ZvaHsMlROxoIIaP3R9gDOLxQ0=
X-Received: by 2002:a17:907:72d5:b0:c2e:4a61:d436 with SMTP id
 a640c23a62f3a-c2e6edde748mr623236866b.36.1791202758948; Mon, 05 Oct 2026
 05:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <TaZxFNfdnpo-3szeC-LoWZBxj-6XGhXkdEqnQi6yyaOHXp8cw4Xtksw07sYrIpludwvJQrukFoCGw3r9rXDcInkdB5QD2EswKPNsXMU3qMQ=@proton.me>
 <179117435281.434549.17747961185403870914@kernel.org>
 <9NzB3VmT-7cBBfdx9sREmRkFb_gOAmI78VheKlX2Mdiqjl3B3N0OCZ5DT8C1SpEJuM5O3TzLltSpGh9ptxni28Lnq4ATz8u86R-f-jdcKPE=@proton.me>
In-Reply-To: <9NzB3VmT-7cBBfdx9sREmRkFb_gOAmI78VheKlX2Mdiqjl3B3N0OCZ5DT8C1SpEJuM5O3TzLltSpGh9ptxni28Lnq4ATz8u86R-f-jdcKPE=@proton.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Oct 2026 14:19:07 +0200
X-Gmail-Original-Message-ID: <CAHmME9qod-kW93qUPE14ABA3sKnoGjtxwpa2m-fXh1PwKXSOJg@mail.gmail.com>
X-Gm-Features: AclHuK_FiYZ2cjeW---uF0rLHUyrzdPaSzCXM36vgNi177Ug3AGAr-kDQIcccLA
Message-ID: <CAHmME9qod-kW93qUPE14ABA3sKnoGjtxwpa2m-fXh1PwKXSOJg@mail.gmail.com>
Subject: Re: [PATCH] wireguard: allowedips: prevent stack overflow without
 DEBUG
To: quantumvoid0 <quantumvoid0@proton.me>
Cc: netdev-bot+sashiko@kernel.org, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

This is not reachable. The DEBUG is there because the point of the
selftests is to reach it, but not for this to run in production. I
coded it this way intentionally. I don't want to remove the DEBUG
test.

Jason
