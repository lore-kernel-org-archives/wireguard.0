Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39EEC63697
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 13:29:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80FC6241A6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 13:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Zn/94kFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80FC6241A6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2193c93d;
	Wed, 18 Nov 2020 13:24:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a635b58
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 13:24:25 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 797ad215
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=p8eGBW4OIlwQCVLwgvRRsmXSHno=; b=Zn/94k
 FOgtcc94NIPXDrzmFNVcsW/4znR62lvjNVW3l3NlVnQE2C6hQ64hAewfU/44S+1h
 HWCEuDUlCQnrdoxCuU5o9nZNmT+6QNTzdCf/Ax37Jt0Dpc9sYLJtrRCHFgKRlQLA
 u4dG66CQCRNGROIdKDOdCs+8cNT3q1ZdlbzMjaJBZ1sP7Qm4bBqQgbnioflV79hM
 d5KgE0T03hDk5YWVlnnbrX50Q8LGX3uZQOOnNWEIHWgIuUnMuj9w6uYiKw3uSr5y
 alMBai7rQD+MoCXPiFLTqjbTVA4fQJ90aDDmOfEwxvenpIN0GmNY5Ww/nJtxlFX/
 uENBPac7Gu5yYt9g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5660e3df
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 13:25:11 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id d1so1650714ybr.10
 for <wireguard@lists.zx2c4.com>; Wed, 18 Nov 2020 05:29:09 -0800 (PST)
X-Gm-Message-State: AOAM531WKtcSVBJxWDk4TaPVjfJPncgvUcXsFMoDtg1+7KHryKiKsRNd
 yWzRkbovnJfAH5FVcCj2tv82ao3VZbPIGLh2+zI=
X-Google-Smtp-Source: ABdhPJw3JvsJO8rRBTan9cVHX2nRuq+XIok+4pQhTlo2rjXvGobcQSvhUqdNtpHcYkSY82xpNem0yA9/OpeszrjeMFs=
X-Received: by 2002:a25:5084:: with SMTP id e126mr8561393ybb.239.1605706148773; 
 Wed, 18 Nov 2020 05:29:08 -0800 (PST)
MIME-Version: 1.0
References: <28bb854e-da5f-34dd-5c20-37b7517b7861@gmail.com>
 <CAHmME9q3PPtjFwX5tJ_PwvekajC++Kn_ejdkxCBc=iaOHTgBpg@mail.gmail.com>
In-Reply-To: <CAHmME9q3PPtjFwX5tJ_PwvekajC++Kn_ejdkxCBc=iaOHTgBpg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Nov 2020 14:28:57 +0100
X-Gmail-Original-Message-ID: <CAHmME9qHFdMO9qmnDKOTWohvySHP9vkAA84xvXLYVy+GXbb3DA@mail.gmail.com>
Message-ID: <CAHmME9qHFdMO9qmnDKOTWohvySHP9vkAA84xvXLYVy+GXbb3DA@mail.gmail.com>
Subject: Re: Wireguard client 0.2.1 on Windows 7.
To: bdgregory@gmail.com
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

With no further info from you, it's hard to know how to proceed. I'll
be releasing this fix in the next version hoping it's sufficient for
you:

https://git.zx2c4.com/wireguard-windows/commit/?id=4a45e2fcc0cf0884bc82268c1c15af2fe477d5be
