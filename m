Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582D5C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 18:28:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7890A60EBD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 18:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7890A60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 680556c6;
	Fri, 19 Nov 2021 18:26:25 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a14fba2a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 18:26:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id o14so8761197plg.5
 for <wireguard@lists.zx2c4.com>; Fri, 19 Nov 2021 10:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9DlGTN7Qf7Ih3sgz22eokhwuPXp2v1jWtJCK8cZnkjw=;
 b=a/NGcBNkciMHrO1NIuWo4GADEyiNdWAldzXFAihYFgTQrxCfIyMR1wLZDX+9jTIsEh
 J3p0Fzgr0kMN7+TNMAbZIyoKFNksnJs1M0LjMp/vB423igsRP3uDUi8MJG4n3cNDj+jL
 Hj8kwJHSLjjEGWB/uzGO/Nimqb6n7KOQ1lsO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9DlGTN7Qf7Ih3sgz22eokhwuPXp2v1jWtJCK8cZnkjw=;
 b=dwz/FBzRH6Ll8xbzchvYDR1okxaTE1BdyuIj+E1IROoU7pKj8rHwN6flti9E/uG3mg
 WZ8ssJWnORlPT2Qf2HEjO6+oHH9rgSIaApH3T3Mh1i+TR7HDXi5u4BLWL8i2qeXeh7s8
 3FhEfhcGJ+8eFtqfItwiDsYMza8I0H+B0dE2E8sKjV49lJsVik+gx3LK90854zjVVa0+
 S5tHn7MzL1ma9sWFQVuJ5kkBKpbPAOwtVyAZeyLq2GljmSj7SFvskoNhzfn5vipzPvqy
 bdeYwfDQCeVx7lTp1xhm2Erc3MbDjHUhCEjE96UMJ2at2Tu5o7NCuqspashtqpkUApC8
 1k1Q==
X-Gm-Message-State: AOAM530GlPzrx9BzLn2otkaKpVbZ2CMXQFQ3tjfuHrvFP670pMwa77Un
 Jw1Pd8Q55vZx4csgwkESmtnlAQ==
X-Google-Smtp-Source: ABdhPJyOqQz8idH7cSV5BVRoiuqwbUEIYSGwMWy267I6HNSSKZ43xmLMBY94sDQSjeEi7DfAgmWbiw==
X-Received: by 2002:a17:90a:ac0b:: with SMTP id
 o11mr2032931pjq.143.1637346381329; 
 Fri, 19 Nov 2021 10:26:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p19sm375250pfo.92.2021.11.19.10.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:26:21 -0800 (PST)
Date: Fri, 19 Nov 2021 10:26:19 -0800
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
Message-ID: <202111191015.509A0BD@keescook>
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

Hrm, I can't reproduce this, using several GCC versions and net-next. What
compiler version[1] and base commit[2] were used here?

-Kees

[1] https://github.com/kuba-moo/nipa/pull/10
[2] https://github.com/kuba-moo/nipa/pull/11

-- 
Kees Cook
