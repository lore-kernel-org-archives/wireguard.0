Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66319C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8659A2087D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ln4opzdf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8659A2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 663d61f7;
	Fri, 16 Oct 2020 13:16:58 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31eda08c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Oct 2020 18:55:21 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id h10so4225477oie.5
 for <wireguard@lists.zx2c4.com>; Thu, 15 Oct 2020 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3acQp3UkGIVuOrzhM4I6Ai0U08iGsd60R5icQiOhCvg=;
 b=Ln4opzdf3jgiCuU/GM+mjWj6s3N3wT7gTikqPr44jzL0RVOqICwv0RxUaQ7v/vr1a+
 7odfCQKhY9IEf2sA48wpcEn5RoeuRefK+beYNPMC3xjhmHvqZ5OWukiJBaJw90jMGaAe
 U61IXMkC3pKPiQoiQJQb9jUlQ2rQ2vUyQQCJPcb3NQr59KGTSq+ZZCwudr5B0A2BcMv8
 Jwj4oNMtMkcgymp2rtdWUVagiq3TwcsSbRDHkqlQyRy09PYj8seZBXvWRpTCpi+ju+YE
 vqHGSL/XqwCE6AgjfSYZ9MSqYrfEp5VVYpT46sndb14YOehAqghHZiLSbnmXiWjguNdZ
 UK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3acQp3UkGIVuOrzhM4I6Ai0U08iGsd60R5icQiOhCvg=;
 b=QSl2LSSxnGTorEsCQ3uV5fVi/OpxwIsg3UiL7jtqyPONeHD6DfVRzQFUZ8gtjBw3YU
 nbwwCc/sbeo4qGdFPzKpLDD/TWRROe6CaLIJ7FZIW5YJu/F199QCqKCzieDW1cH0CH9q
 nv9GkrhhKCFkMMAwH9nr2wEST5zFgtTc5EwVCGjNBEU33CGFnEmpc8VVM+ggJzn0NW97
 GnKV6KXI7IyktFBVpFGVBxeVNTrGUcz7JCVfaODd7rLcYHB3RrSp/ts6McCZOpq1cJYv
 1MTqTHEK9D32vw/hi2zEGGSl39OzvpdGZHW+bs0oWoTCu/Xtr2RcZAzdYQBzNARgKZcg
 zfXQ==
X-Gm-Message-State: AOAM531s8Nr/CP0OTp/g8OmH7nq2OtF+y3B4ixPe7Q+x3Q8DDyGkjlXS
 AlY7amZ4M4earCjpeHYwIFX7CoIby/RrCDQKpPNCe6lMc98=
X-Google-Smtp-Source: ABdhPJy/3tpJ47iPpKEHk67sVvLVly9PVROny/W4LY/e53qWPtGXXXHjPkRcKFHVzOB6L7fZZkls57tF5upnIu53Qto=
X-Received: by 2002:aca:3fc4:: with SMTP id m187mr151097oia.59.1602788142520; 
 Thu, 15 Oct 2020 11:55:42 -0700 (PDT)
MIME-Version: 1.0
From: Boilerplate4U <Boilerplate4U@gmail.com>
Date: Thu, 15 Oct 2020 20:55:30 +0200
Message-ID: <CAA6eTQFuf1n3HLtkg0xLp-+kGF5Xf_v5zEYYP7U0ae3Mvn810Q@mail.gmail.com>
Subject: [wg-apple] Prevent changes to the resolver?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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

Does anyone know how to prevent wg on macos (gui) from making changes
to the resolver (i.e. /etc/resolv.conf) ? Every time when I activate a
tunnel, wg resets the dns settings and sets the tunnel ip as the
resolver address.

macos catalina 10.15.7, app version: 0.0.20191105, backend 0.0.20191013
--

Thanks in advance!
