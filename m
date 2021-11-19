Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C58C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 16:27:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A8761B1E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 16:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4A8761B1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 01da686b;
	Fri, 19 Nov 2021 16:24:25 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 47f280c7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 16:24:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id p18so8467657plf.13
 for <wireguard@lists.zx2c4.com>; Fri, 19 Nov 2021 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qui87OY5Jed4+H9Eeo8B5vVSCb7VatAB11Im4YTYJRU=;
 b=llELplFVoWfVosynWC9z829rWucL2lgjibfYGe7Wjc/w2c39KJ8ALIgzVb0vwI6zZs
 klS0Tvi8i7jIVaOU/DYlIxm4ulh1KGfEbnWjdpRELoTVhMAe8ybvt8t8GoASncsmKlw0
 Z/HweGsovgW4dQ/GBFXje/nE/Uos0iqCW7s3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qui87OY5Jed4+H9Eeo8B5vVSCb7VatAB11Im4YTYJRU=;
 b=J9DPj8izhVoAh/GNb7OcBM3zdDHwi+J8gG6PTL9jgRZbluHr3EvLGcRjAnhBQmPdiQ
 8b67dwC+3aih91Cw6LqbftGI+S2Y7MVH5CBc/zyLiKAiv+K+01PkpVMRX2bHlbcjAKYf
 2ILiffL5He9cs0Qv2ao44keEkZkNocgi8FysvwmD4SMt2UWJBq8ZI2B13gQ8pqVS33Tk
 81YpPahy89lfqcNBTtHWCHRl8bf7u3T78YXWxvVHtgCrCYilvczd2WyW8KgXovHhGSuA
 sBTLh3XVbAV2b28BTRxDAuwujtoqkDAHfOCvuMkZQSsSHufFz/Vl2jfqZNlbirjZHXnt
 0TvA==
X-Gm-Message-State: AOAM532uSHe1PZ48S1h0vBK/l1bg3VNDXHY3LYHY455VZ2mEDuJ051JA
 RQdHQ43dptcDyOG5ASBg+OIMgg==
X-Google-Smtp-Source: ABdhPJzOSTnQ3rV6Qyg1u/LKfX0KBy8F72q5HyeDuG/FkYat7OxNw9TLTL+XNHEUVXP48WDRb6uSuQ==
X-Received: by 2002:a17:90b:1c02:: with SMTP id
 oc2mr990156pjb.65.1637339061491; 
 Fri, 19 Nov 2021 08:24:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u22sm144313pfi.187.2021.11.19.08.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:24:21 -0800 (PST)
Date: Fri, 19 Nov 2021 08:24:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexander Lobakin <alobakin@pm.me>, Jakub Sitnicki <jakub@cloudflare.com>,
 Marco Elver <elver@google.com>, Willem de Bruijn <willemb@google.com>,
 Eric Dumazet <edumazet@google.com>, Cong Wang <cong.wang@bytedance.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Talal Ahmad <talalahmad@google.com>, Kevin Hao <haokexin@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Vasily Averin <vvs@virtuozzo.com>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] skbuff: Switch structure bounds to struct_group()
Message-ID: <202111190821.8147EF796B@keescook>
References: <20211118183615.1281978-1-keescook@chromium.org>
 <20211118231355.7a39d22f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118231355.7a39d22f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Thu, Nov 18, 2021 at 11:13:55PM -0800, Jakub Kicinski wrote:
> On Thu, 18 Nov 2021 10:36:15 -0800 Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields.
> > 
> > Replace the existing empty member position markers "headers_start" and
> > "headers_end" with a struct_group(). This will allow memcpy() and sizeof()
> > to more easily reason about sizes, and improve readability.
> > 
> > "pahole" shows no size nor member offset changes to struct sk_buff.
> > "objdump -d" shows no object code changes (outside of WARNs affected by
> > source line number changes).
> 
> This adds ~27k of these warnings to W=1 gcc builds:
> 
> include/linux/skbuff.h:851:1: warning: directive in macro's argument list

Oh my, I see it[1]. I will get that fixed. This smells like a missing
header or something weird. I have a dim memory of fixing this warning
long ago when evolving this series.

Thanks!

-Kees

[1] https://patchwork.kernel.org/project/netdevbpf/patch/20211118183615.1281978-1-keescook@chromium.org/

-- 
Kees Cook
