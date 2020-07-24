Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A638C433E8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:25:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0B72065D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1p/KICf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0B72065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79c66d60;
	Fri, 24 Jul 2020 09:02:50 +0000 (UTC)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7c0caf5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 09:02:48 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so6552797edy.1
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WCeXJftszyhILNMxpqIylRyqurpYVbWY8H3bOT1PtII=;
 b=W1p/KICfjqCP4ZfcjAZkdk4g/znBCmg1sikEW6Xu9zwhWWM7Jl7YmLC/+z/xH7k6vm
 nWvMqdpbExkucDfkHW+UtCW2X6Bz/1zSTL4gvBUsi/rIIbJ55RmqxQ1Z71XLxXNWafDW
 IsbSTo+uCjyvJkLymQqi0aYuXxcT6hcBRd/hYFF5/c+Uw/qQfxkGfZpLgPFvRvJF1i6n
 XzQZZGHXCyWGWX/35jIA/M818PY53WAmg03lS7hWtpCm5vByQ9bjBfZwc+iq0fV+LCNE
 KjzTM4wL3z9Dr9BY0k++1kw92IaWfV0F9J0ZU3H15ynjvtPYsOcmWR/Xchy3Yi2uj6hY
 Rktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WCeXJftszyhILNMxpqIylRyqurpYVbWY8H3bOT1PtII=;
 b=HdWXl3xFLBuVProDuaQUPK11TowyogKI5GJCspYHyLvEJt0ztQ7kMmvtc52uSh6C2B
 sg8/7k6K+MWML/T0+XGASRZdbPd/TCaWcfw4JaOeHPNjQsZcb4mqT8Cc4NEs98APbCIj
 FODSJjWHa+qIHDHuMsa586dlRMDF5mbHNrb1rIDvLl3JHfoanuALiQSudpfjEy9yAIxD
 vjxJ6Mfh9jro+/qezAcmzDkbd8IHJkAGB8MNCtyb9MClUSUadbJXWkY2Y2uh58U6tIX/
 AgKcuBM3LweBBGPwFM4n0oSGM2C6SC+GYg3B9ic0F9+AKe3GsqAFrntvELmNcedyqyVX
 iSjw==
X-Gm-Message-State: AOAM530mET3iUAJjjjYc5cfo+lkTB/pFXIDz+eE9vIZmABZgJ5TLOQR8
 kJuZSVE2U07ZmGY3qnl6nup4aAXs8YR6Ag==
X-Google-Smtp-Source: ABdhPJzi+vbL4vyhyWPqkzDehayvOgsAAryM+h3L4gA9CpGeNeHGQXuO3TZKyWfcRjOJRzt8XpjvPw==
X-Received: by 2002:a50:f9c9:: with SMTP id a9mr8273267edq.89.1595582741233;
 Fri, 24 Jul 2020 02:25:41 -0700 (PDT)
Received: from CKC-BS-N0240 ([94.31.102.44])
 by smtp.gmail.com with ESMTPSA id sa10sm307993ejb.79.2020.07.24.02.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 02:25:40 -0700 (PDT)
Date: Fri, 24 Jul 2020 11:25:36 +0200
From: Garrit Franke <garritfranke@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
Message-ID: <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
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

On Fri, Jul 24, 2020 at 11:14:52AM +0200, Jason A. Donenfeld wrote:
> On Fri, Jul 24, 2020 at 10:30 AM Tomcsanyi, Domonkos <domi@tomcsanyi.net> wrote:
> >
> > Signed-off-by: Domonkos P. Tomcsanyi <domi@tomcsanyi.net>
> > ---
> > src/systemd/wg-quick@.service | 1 +
> > 1 file changed, 1 insertion(+)
> >
> > diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
> > index a9cbb58..8eb040b 100644
> > --- a/src/systemd/wg-quick@.service
> > +++ b/src/systemd/wg-quick@.service
> > @@ -15,6 +15,7 @@ Type=oneshot
> > RemainAfterExit=yes
> > ExecStart=/usr/bin/wg-quick up %i
> > ExecStop=/usr/bin/wg-quick down %i
> > +ExecReload=/bin/bash -c '/usr/bin/wg syncconf %i <(/usr/bin/wg-quick strip
> > %i)'
> > Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
> >
> > [Install]
> > --
> > 2.17.1
> >
> > Not the cleanest solution, but I think it might help a lot of people, so I'm
> > submitting it.
> 
> This actually doesn't seem too bad to me. Are there cleaner solutions
> that I'm not thinking of that I should consider before applying this
> patch?

I think it doesn't get cleaner than this one-liner. 
Some time back I submitted a patch that added a restart command to wg-tools. 
We settled on the conclusion that a systemd approach would be much cleaner.

