Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AA7C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:25:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f2dffca;
	Wed, 20 Dec 2023 04:58:57 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d205a1b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Aug 2023 13:36:30 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9db1de50cso51788131fa.3
 for <wireguard@lists.zx2c4.com>; Sun, 13 Aug 2023 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691933790; x=1692538590;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=e0Watq003ZAUpSjGoyMhVN5xyMBX7jwndthGeVSFbSw=;
 b=pCt2qhHUZvZ9FDmi0hdc6/urX5oV0rkWDbRSbm2UTNSl7dBSN5fSLN1LpYDjRReB74
 X+Q27IVH4/4I/nMROLDYz3tMOdz1L6gZvnv4ho/JaRxza+PaOMOFbIH149aBXq+NhJ0x
 swWUtzR/eqvmWg9CPeNN+EfR6e6U1Hyo5+Xi60QKENP4TI7rGr3cXyJzAlyakdKHCPsk
 CXD91WcHL9v0gqPYdu1qr3PMV1oPoZsG6L1CgSQ6KqP6mFSyKSIDQYskXCv6FAzjWHrJ
 MlBN5ai4n2lpy3ZaDcX3sUH3w6ETlmCsOPiixtQZxE8iT7o0pv0nt7nAIbcl2lp6WzxN
 IVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691933790; x=1692538590;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e0Watq003ZAUpSjGoyMhVN5xyMBX7jwndthGeVSFbSw=;
 b=l6gcOEO+8Yeg9Wmc5LHVJUNh5+2QA2fWgfmfuf4R47uZWmhFlJcmsgKw7zmoJwT1sv
 9K+Xz3yY1OyXwbZWvJIUE8hxxNnlzANJU7vKeFscbSwxDIsw6bK2pZVFAwdjU8di0wn9
 nfFXbF9cMyM2o49euy/dwiGxk+sR2PlaVCPCbMIRen0JTliXw2X5gE4JdbxY0eCBfEAg
 fo9Wq0fZgasXyHpho2FsSJ+FA5agcqm8MdlMMxzM8CdGGHnSNOwIyGcfwNCJwuuRooYP
 UatPrNTBEX1Slvjsil+EtGKPzHuez5yRChwqx0AybwN7iaZ2ipN5vkkrGcBpHBKEUnn5
 2vDA==
X-Gm-Message-State: AOJu0YyHUsI+xTx4VCx+Epj9NozZR6utNkyZ0WK9iLs48TCmOPOu3w2H
 y1VZ+/2l62mWeQ1VFjmtPPDG+Z8IJ9B/14zTxQo2gcKS5yrDBw==
X-Google-Smtp-Source: AGHT+IHMTyqctiOqXjpnyxQ8ldduzuHNAFqL78/wH93M9BW8WRTD7W+CxXrY/1uYTvWDu9fVTXq0JRXvLVgaOj/XfP4=
X-Received: by 2002:a2e:9f14:0:b0:2ba:38c4:1621 with SMTP id
 u20-20020a2e9f14000000b002ba38c41621mr5215225ljk.9.1691933789644; Sun, 13 Aug
 2023 06:36:29 -0700 (PDT)
MIME-Version: 1.0
From: Chengbo Zhao <cbzhao.cn@gmail.com>
Date: Sun, 13 Aug 2023 21:36:18 +0800
Message-ID: <CAMFsdgwjDzvLtJS5R_t1CMeP2zQkmMMRUCHtXro-vwJxDF_O_Q@mail.gmail.com>
Subject: Upload speed slow in Windows through ipv6
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Hello:

I just changed my way back home from OpenVPN to WireGuard. Nice work,
faster and easier to configure!

But when I tried to connect through ipv6, I had some troubles: the
download speed seems normal, but upload speed (Both to LAN and WAN)
was limited to ~10Mbps (about 10~20% of full speed).

I thought it was a network issue at first, so I used a process of
elimination to find out what went wrong. On the mobile phone, using
the same configuration, both upload and download can reach the upload
rate of my broadband ~60Mbps. This indicates that the computer may not
be working properly. So, I went on to test on my laptop and found that
when using ipv4 for connection, the upload and download can also run
at full speed. I guess that there may be a performance problem with
the forwarding of ipv6 packets in WireGuard NT. By the way, I just
configure ipv4 for all clients in WireGuard's internal network.

  Test Device     ipv4-download   ipv4-upload   ipv6-download   ipv6-upload
 --------------- --------------- ------------- --------------- -------------
  PC-Win11        ~60Mbps         ~60Mbps       ~60Mbps         ~10Mbps
  Phone-Android   ~60Mbps         ~60Mbps       ~60Mbps         ~60Mbps

Can you guys do further tests to resolve this issue?

---
Thanks,
Chengbo Zhao
