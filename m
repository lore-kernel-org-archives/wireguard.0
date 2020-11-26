Return-Path: <SRS0=hzHk=FA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F0DC56202
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 07:10:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3AA520578
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Nov 2020 07:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ceegeebee-com.20150623.gappssmtp.com header.i=@ceegeebee-com.20150623.gappssmtp.com header.b="mtfGXwpz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3AA520578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ceegeebee.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3922d08c;
	Thu, 26 Nov 2020 07:04:15 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7d467d37
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Nov 2020 07:04:14 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id x24so819408pfn.6
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 23:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ceegeebee-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s156jvn/0hGq3BbPnSklgPufZ7Wf8ibDWedCpazn3kk=;
 b=mtfGXwpzx/+keJ1hWoQCGiqydCzvo7BzJdjVq42aMz+8QMEnmHDRimspsS2dZDktFZ
 xLSTObIymPnqplBWyCb7MSwhVfSJ2GfRAqNoCLf5e7NEh2pibYUUHCx4Q1mSr0l4jVBH
 vk38usegcrssKoC+veVxxRxWaOXtLcKstUrXKaMdunQMyWOLc4St8IisEokUQiwbQPZI
 pW6oEYvZDHfoiaGIPi+55SpB+RuezVG6b3PDSLTES4m2I+vP4WTTtD1rJFV6uFTCd+uz
 bBohMv9Yvwpcl+aUYyZqeoKUQGU5YQdLn+lF9vM03VZhekLax/dsZfr800F4XdwUZwWC
 bObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s156jvn/0hGq3BbPnSklgPufZ7Wf8ibDWedCpazn3kk=;
 b=R1T2MGdS4EB37MbkBOrSaEaT7FdnvhOadFFWUaNs7IAn4rrAhyeI6Q5L/W1CSZ3sxX
 /LLcxLsFFJJXhBoz9jS4qE31D08xerCJnjfJT+ksgAzBRv1M5MzEESaweP1gaNXbvjVX
 efxNyQJhCvGpDjSNgnoCSZeE+PwQ/zGO7WCTX5X5WltjIG1kVCij/ymwqC8KQzaRaLSN
 zUrwa0ThN9pQ8ZMK+6VHskPhcHAyr8t9banTUCmeKvbhQX2XBkP1Vt455jeWhBfrvOW3
 33hL0H624qrM5HEEm20Vs+WE57c8h5U/qeClxRnLJ3Wm3dIILsoqjsH2I9fd6rrpr9rJ
 hq0w==
X-Gm-Message-State: AOAM533mcXhjtyx59FwVn3N0gvyRESRGUmCDtNY3CgGOGEwJnDn4f9RQ
 OgtB//CxLuJ9j8I8Q4l189nXiMi0xyFq3cD9
X-Google-Smtp-Source: ABdhPJz/uWrn3ysz0UTxyEGtnoiI3y6cjAgctAFNjbIi2ALvYxYma0Hmsm7JXt1ZGYOHrziFL4KGoA==
X-Received: by 2002:a17:90a:318b:: with SMTP id
 j11mr2063437pjb.16.1606374597563; 
 Wed, 25 Nov 2020 23:09:57 -0800 (PST)
Received: from cgb-linux.rcmb.lan ([202.0.74.254])
 by smtp.gmail.com with ESMTPSA id x30sm3731962pgc.86.2020.11.25.23.09.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 23:09:56 -0800 (PST)
Received: by cgb-linux.rcmb.lan (sSMTP sendmail emulation);
 Thu, 26 Nov 2020 17:39:51 +1030
Date: Thu, 26 Nov 2020 17:39:51 +1030
From: Chris Bennett <chris@ceegeebee.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
Message-ID: <20201126070951.GA2879854@cgb-linux.rcmb.lan>
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
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

Hi Jason,

Thanks for addressing this :)

I started the conversation a year ago [1] and was frustrated with the
response, but cobbled together scheduled task workaround and moved on.

But I'm very happy that the project's position on this has changed and
there is now a workable solution for non-admins.

Wireguard for Windows has been working perfectly for many of my users
during COVID lockdown, thanks again for all the great work.

Regards,

Chris

[1] https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg04265.html
