Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB8FC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 19:53:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1946105A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A1946105A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01cc2960;
	Thu, 14 Oct 2021 19:53:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 05836249
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 19:53:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58C6661037
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 19:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="dUrSMTTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634241182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EF18GGnNX76hplr6DVU2IVG/FMknoohUpyUadTpxyt8=;
 b=dUrSMTTv2H9LY/xjwx+y4usFnu8jxM1GhYyEZ+c1xWCNU+mWVT976NQC/YAmPfeXyG51i+
 02+oTTf5sLsllAr1X4CK+h3KQWfhHuUeDC/GgFBi1VdvNcX4pJxOHqoOTmU5a9Oypv77dB
 Je/vvBhe7rwPOm/26bXt7/XUVAwT2PU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8cc4ff9a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 19:53:02 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id d131so17388989ybd.5
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 12:53:02 -0700 (PDT)
X-Gm-Message-State: AOAM531yF9FIMLo1Iyrb11eA3jJ4ZSlhnml3Dd6b1azZhO0XdNB44nbT
 V7meeG0PKvLDrWPWTErQgCzJBbOl59rX1J7xTOM=
X-Google-Smtp-Source: ABdhPJzvn+noWmvC/yMrobma9wupg39vwWSoBSb/pwhbrQpB25CQHgef77deHpYMbjco235939t7ytIFa2XKZkcCiro=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr7929511ybk.412.1634241181876; 
 Thu, 14 Oct 2021 12:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
 <b1b2fc28-fee0-4801-ac42-fcd8d985e837@www.fastmail.com>
In-Reply-To: <b1b2fc28-fee0-4801-ac42-fcd8d985e837@www.fastmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Oct 2021 13:52:50 -0600
X-Gmail-Original-Message-ID: <CAHmME9qjs=38jss-DEwtOJ0tm3m9mn+4tsC8jdRk7AsUyTUPaQ@mail.gmail.com>
Message-ID: <CAHmME9qjs=38jss-DEwtOJ0tm3m9mn+4tsC8jdRk7AsUyTUPaQ@mail.gmail.com>
Subject: Re: Windows Log Output to Event Viewer or Text File
To: StarBrilliant <coder@poorlab.com>
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

On Thu, Oct 14, 2021 at 12:43 PM StarBrilliant <coder@poorlab.com> wrote:
> In fact, Windows Event Logging has two APIs: ETW and WPP.
> The ETW API is, indeed, slow and clunky.
> However, the WPP API is very high-performance. The trace function in Windows native TCP stack is implemented with WPP.

Yes. I have no interest in using binary WPP traces. The kernel driver
now mimics linux's, having the exact same messaged logs in a simple
printk-like buffer.

> If someone like Frank has the time and ability, they could check this MSDN documentation and try to implement it:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/wpp-software-tracing

Not interested. I won't take patches for that.

> I am not sure if I get Jason's idea: Is current Wireguard driver using a ring buffer of 2,048 messages for logging?

No. Frank is conflating the kernel driver and a simple userspace
service. The userspace service uses a very simple ringlogger format,
with multiple implementations, used for years on different platforms.
The kernel driver doesn't have an on-disk format; it uses a ring
buffer of sorts, but so far that remains irrelevant to this
discussion.

Jason
