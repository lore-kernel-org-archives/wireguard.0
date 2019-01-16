Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F9BC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 17:36:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE49E20675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 17:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OmNMj6Jy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE49E20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca73f78d;
	Wed, 16 Jan 2019 17:31:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bd3d524
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 17:31:42 +0000 (UTC)
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1c509ab
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 17:31:42 +0000 (UTC)
Received: by mail-it1-x12e.google.com with SMTP id m8so1561124itk.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 09:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RTEXQZRGOtX0iLDVOoLcu1AHDx0en6N5jxihoY2YYIY=;
 b=OmNMj6JyQ9FYvM7CEEE/B/tXI0fqP47lVYzlzAs6JExtbfMugCyczuDQx21gFbm/F2
 5ovTeRQgAXvgb+lAhXxId4FDo9LovMiJCea3sSTu+u0enI08LesYq8M6QSJAue+F6cwB
 fNaDW6GIimUmXOuWjt1PHk7hQPLrDjrzRcpr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=RTEXQZRGOtX0iLDVOoLcu1AHDx0en6N5jxihoY2YYIY=;
 b=KHnuyqju5Vbk0zCjB1InINwPu5qiiSNsGKgGJjPC9VB0J30GpkQsMZUUXS/I9N1bp8
 n28jT6s6bJEkBNPeyXSStIYalZ7qBOjVtrRUSVoYRcQLTEeHVOjL+c98S//6JThGhjAJ
 MvoUCbruq5PSN9GKyUaTnKFkqV5f6KYkwZkJkZKFpwvdj7ZguLdzHjpSd+/7PW0kC5kk
 Cw0ivK1E6zOEW9jfcWuupZhetJIt0qo3boO0od31xisnMlvappTxcqW+qgpJEWKPFlQK
 wSrUGNounTAVzRbFiDqr76NlfDbHc+twgDfj8o0gRnkH3M7k3PJKCut1qPrQtqUhD0Yl
 zz+g==
X-Gm-Message-State: AJcUukfP8mAtwvtriPwu0+hl8X0bMJzelOLnsh/8ULpsGXs7bEsohNY+
 xZuYoP7t3C1WOBZ5BcCsXfBWIg==
X-Google-Smtp-Source: ALg8bN6cGoCxhqSdzFOxOdiMulj7KPrWW6LmzoKfJuQbSDjOOGK6khlA5fQd6O7DT9+DLKOZhTLh3Q==
X-Received: by 2002:a24:ed4f:: with SMTP id r76mr5824420ith.17.1547660153408; 
 Wed, 16 Jan 2019 09:35:53 -0800 (PST)
Received: from pure.paranoia.local ([198.144.156.49])
 by smtp.gmail.com with ESMTPSA id b188sm3550625itc.9.2019.01.16.09.35.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 09:35:49 -0800 (PST)
Date: Wed, 16 Jan 2019 12:35:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: John <graysky@archlinux.us>
Subject: Re: Logging remote connecting IP
Message-ID: <20190116173547.GD19179@pure.paranoia.local>
Mail-Followup-To: John <graysky@archlinux.us>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <20190116153913.GB19179@pure.paranoia.local>
 <CAO_nJAYgvq-+2mVdVu2qoo7yFEiX9LHnaaEk0CDGhngBZ+Kagg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_nJAYgvq-+2mVdVu2qoo7yFEiX9LHnaaEk0CDGhngBZ+Kagg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Jan 16, 2019 at 10:52:48AM -0500, John wrote:
> > For auditing purposes, I would like to be able to log the remote
> > endpoint IP for each wg connection on the server side. What's the best
> > way to do this, preferably using syslog?
> 
> Enable the debug option when building should print to dmesg.

That's good to know, but not very useful in our case, because we get the
module from Fedora COPR. Moreover, I'd consider ability to log incoming
connections info-level, not debug-level logging.

-K
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
