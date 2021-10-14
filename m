Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E534C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 05:47:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD10610E8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 05:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CD10610E8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7eb61ac;
	Thu, 14 Oct 2021 05:46:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a66e62aa
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 05:46:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ACA2610E8
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 05:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WwLBLNrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634190411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=HmDv6NS1HnB0bMmdwdio8h3QyBBN2yD7tfGoSLG494o=;
 b=WwLBLNrPMagSoZ2PXceLL7/PPtyRdSX7znBeipiwvbTEylJTBUSF6mzQxQUTw1EKo6esRf
 MeygRnn1UAKH4IFGyWPhRfXcYNxzbSgKGgHNOK0O9hmyfNvboSMIAEQkXgUCVBzLYSo/pg
 cq2L8e7Kp+xdYqrBwDH670SbbsAHugQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 71bb520e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 05:46:51 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id q189so12023088ybq.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 22:46:51 -0700 (PDT)
X-Gm-Message-State: AOAM531axD5nrXCpIwMvomXULr3CHJU4T0pcEOD+rPVl64UZ8kcSai7y
 fCnbuA8gbA6Zm7csrktpKLKpy3ypQ3Tt7PDHq0U=
X-Google-Smtp-Source: ABdhPJxjjAZXlYImUjyPb8HrPSeZZmX0u7N2lVTFGfyYPVp76ZE990p6TW9b4Xn93+nxs0kM5FfpyhsSEy2MsD72N9w=
X-Received: by 2002:a05:6902:120f:: with SMTP id
 s15mr4160029ybu.449.1634190411150; 
 Wed, 13 Oct 2021 22:46:51 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Oct 2021 23:46:40 -0600
X-Gmail-Original-Message-ID: <CAHmME9oOuJn+Q9GsQEH=mBJXza4VdQ31FUYi-ZbPJT6sceKwkA@mail.gmail.com>
Message-ID: <CAHmME9oOuJn+Q9GsQEH=mBJXza4VdQ31FUYi-ZbPJT6sceKwkA@mail.gmail.com>
Subject: Note: wireguard-nt 0.10 and wintun 0.14 have slightly different API
 from prior versions
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi,

Version 0.10 of wireguard-nt and version 0.14 of wintun are using a
slightly different API and ABI than previous versions. As such, make
sure you're using the wireguard.h/wintun.h header file that comes with
the DLL that you download. And if you're using the Go packages, make
sure you've paired the latest commit with the latest DLL.

Thanks,
Jason
