Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C2CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 05:50:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FD520720
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 05:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gcK9h21/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FD520720
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ee54274;
	Wed, 17 Jun 2020 05:31:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7183d263
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 05:31:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffebdc4c
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 05:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ocKDhjeRHIxR4x0n31uvj7fKrYE=; b=gcK9h2
 1/efHfak4DZezBgiFXtewZI6PkhVqaePPlC/KuTO1Yd/FzP4jnBBV/xVOB9Ed9+d
 zK/ul+9pnVMlB7UuVM9NTuaFhcC88/cPH7Cx4S/sV3tZAEOrnxe9rGKUsJpWCaw5
 +U2UHLh9ktWATYknw30T48IrfUYE5poCj3XNWDSW9kVYUqZlbssBg1jOsq3O6Y8G
 y/ZZeHg80zfMCJ/38z4YtjyTuTgtkJRJb0mmEjdaS3dLu6vSikc18qquIs1WGyDT
 qwJqvRFcl7uHdUu5NHtxux2ZUT38Oz7OLwysGdbcePpGDU3qXyLWftWrb44w7ype
 aAx4MzPNwiaowM1Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f01f9caf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 05:31:42 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id m81so1428754ioa.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jun 2020 22:49:45 -0700 (PDT)
X-Gm-Message-State: AOAM530S/RwlBEDB/6NmsVrTOtK2thvYGgueC/aAk7qSQf3/Ap6d7ytd
 6lQHMYgh79p6J/k8aqPw5cM787W2Ryd1riiSSNo=
X-Google-Smtp-Source: ABdhPJwFz2msQ2TXRkn0JitE4I9O/objw0B7IsPXq8cfsjXixNPgMOy/x944glEsgFcO5pMRIDGERaoVN/G0tTTJbCc=
X-Received: by 2002:a05:6638:216f:: with SMTP id
 p15mr29892898jak.86.1592372985304; 
 Tue, 16 Jun 2020 22:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <CABtXGiBwT8xqHUP-L818UeNEG+2RcR165Kkxc9f6sMSZKJRd2g@mail.gmail.com>
 <CABtXGiB17ofxts38zaWOzyWEwsgYyT5MDkuaZ6XEFN+PPWZb2g@mail.gmail.com>
In-Reply-To: <CABtXGiB17ofxts38zaWOzyWEwsgYyT5MDkuaZ6XEFN+PPWZb2g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Jun 2020 23:49:34 -0600
X-Gmail-Original-Message-ID: <CAHmME9qAP8PjyenubAS51cnvGmfXiWo_Gg7NQNecjMd2AJ==jQ@mail.gmail.com>
Message-ID: <CAHmME9qAP8PjyenubAS51cnvGmfXiWo_Gg7NQNecjMd2AJ==jQ@mail.gmail.com>
Subject: Re: Windows Client - UI improvement
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I agree that having everything in the context menu can be a bit
unwieldy. I'm not sure I can imagine what you proposed with regard to
a "pinning" mechanism. Maybe you can draw something in MS paint
describing what you have in mind?
