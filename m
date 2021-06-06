Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41CAC47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 15:09:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34F661408
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 15:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34F661408
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf9c95a3;
	Sun, 6 Jun 2021 15:09:18 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 251dfcce
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622992152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dn2xsiAMafYVM3eKCoNacpC9RiU/AvKXCjccIgKUEl4=;
 b=X2i1Gnp4rj97J++45rhgGW/HPkxCpYT8Gporf1zoaxELtkhUFmuZ2Mv+A3gfq20dNpDFIq
 /vOxbcPK/C+POCwSY4pi+4Nu9bdOq8g297y5NPvb0eN5qyF6aertWSuubzj8gLwQ+DX+f1
 3RQjw9vX45ShQcgSG19ddCR+YifILGA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dcf2f251
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 15:09:12 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id i6so6467896ybm.1
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jun 2021 08:09:12 -0700 (PDT)
X-Gm-Message-State: AOAM530vuarqk+/5dc5wxoaSQjBAJ/0P0VD2k7ZAVmwdmMEoXGVi18Gs
 ecFZHva7Jcd/S0Ui9C5zW6B+/WVMmP+42BfppsQ=
X-Google-Smtp-Source: ABdhPJyr9mE2rdjEa44vJtKvsXRBwF3vvINpxCx5vsLd2TrdviqTDuhtP1e3c33b9ZDJ/b2ETybJNiBIDu6vbp9oOwA=
X-Received: by 2002:a25:389:: with SMTP id 131mr18302214ybd.306.1622992151745; 
 Sun, 06 Jun 2021 08:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
In-Reply-To: <CADTMz0+OmW5n1JSD6pLA-_2=aRHeuhYLdQ6BCwjHg07vrPc+vA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Jun 2021 17:09:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
Message-ID: <CAHmME9poc+xPG_WfX1vYTSc9JPrSkMpWGR=rTGspOVsKyYfCpA@mail.gmail.com>
Subject: Re: Certain private keys being mangled by wg on FreeBSD
To: Christian McDonald <rcmcdonald91@gmail.com>
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

It looks like whatever is generating those private keys is not
clamping them. Specifically, all private keys should undergo this
transformation:

        key[0] &= 248;
        key[31] = (key[31] & 127) | 64;

In your case, your `Lm` prefix (first byte: 0x2c) is being anded with
248, and thus turns into KG (first byte: 0x28).

The kernel properly clamps the keys on input, though, in case
generators forget to clamp them. So what you're seeing is correct
behavior.
