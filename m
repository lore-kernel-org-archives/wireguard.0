Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E684EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 19:05:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E81261AA7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 19:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E81261AA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 24407fcf;
	Fri, 19 Nov 2021 19:04:59 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5ddc8ddc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 19:04:57 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id np3so8597984pjb.4
 for <wireguard@lists.zx2c4.com>; Fri, 19 Nov 2021 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7gKCFl0vWdtOCb/3aV8pldCMA2ZxKL7ucYb4JkITvAM=;
 b=e3GDIUh8jfYIpwnABL6s1/QtgS6Jm3imtY2w3vJ7zy3S2h6jeVjvTAxpTw5boylJNl
 TR1NSPBTGbkz3mOOFWNDbfQsOe5Wx4U6kFi5XRuf6NPVuDeolZ158Q8+ThGe1aSXO2oj
 /r+qfiG4u1Of4FrnjhZTMx9jW2l0CVunMYz2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7gKCFl0vWdtOCb/3aV8pldCMA2ZxKL7ucYb4JkITvAM=;
 b=dHfNOJDC5rYbhbM/gsLsYgGYMV+baKOBHKtr5yZ6uS5c0jgRX6deg1NdzJIzpofrlm
 bY9LGzbi84D15Phvo3zjxNS0YqBMEpTNJxELr2iGsOChtxaw16CB4kU0br4x4wn03N2T
 e/tj3HeBrrtbyVw5bAKGdKN0lnZgIqBSgNyYilpEdWcwsgMNIxOmeVukh/H8ipJv1OYS
 UMv19b3wBD42H0ocnPyXb/kztan6Jfzjk2GyEGaAMPpXQsF2MQwve7NpEqgn3xTHiweV
 bN8tkZHWhAiihhruOkbSmsOJX1vWqhb29MSPGKEPGAJIXKwZyyO2Sn2z7GOhF1B7G/Qw
 bYpg==
X-Gm-Message-State: AOAM531vfsdvy7TgrzyPW4XFFUqZw9uY8PB8grmJI6o7XgbPIGTLrvUy
 aWHtJFswx4sPUE0xvywGJ/SA6w==
X-Google-Smtp-Source: ABdhPJwDCxXYbbuuUuh3O/yYZjAZzQVmT1fRScATPyisj+4WtYIlCTcjvf6vxYHMu5Uorx79MCqaOw==
X-Received: by 2002:a17:90b:1e06:: with SMTP id
 pg6mr2468744pjb.137.1637348695802; 
 Fri, 19 Nov 2021 11:04:55 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c16sm323497pgl.82.2021.11.19.11.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 11:04:55 -0800 (PST)
Date: Fri, 19 Nov 2021 11:04:54 -0800
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
Message-ID: <202111191103.074D77AF2@keescook>
References: <20211118183615.1281978-1-keescook@chromium.org>
 <20211118231355.7a39d22f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202111191015.509A0BD@keescook>
 <20211119104144.7cb1eac6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20211119105253.1db523b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119105253.1db523b5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On Fri, Nov 19, 2021 at 10:53:05AM -0800, Jakub Kicinski wrote:
> On Fri, 19 Nov 2021 10:41:44 -0800 Jakub Kicinski wrote:
> > On Fri, 19 Nov 2021 10:26:19 -0800 Kees Cook wrote:
> > > On Thu, Nov 18, 2021 at 11:13:55PM -0800, Jakub Kicinski wrote:  
> > > > This adds ~27k of these warnings to W=1 gcc builds:
> > > > 
> > > > include/linux/skbuff.h:851:1: warning: directive in macro's argument list    
> > > 
> > > Hrm, I can't reproduce this, using several GCC versions and net-next. What
> > > compiler version[1] and base commit[2] were used here?  
> > 
> > gcc version 11.2.1 20210728 (Red Hat 11.2.1-1) (GCC) 
> > 
> > HEAD was at: 3b1abcf12894 Merge tag 'regmap-no-bus-update-bits' of git://...
> 
> Ah, damn, I just realized, it's probably sparse! The build sets C=1.

*head desk* I looked right at the "C=1" (noting it was missing for the
clang build) and didn't put it together. Let me see what I need to do to
make sparse happy...

-- 
Kees Cook
