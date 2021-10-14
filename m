Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3968C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 05:58:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A1B611C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 05:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25A1B611C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c8e4ac5;
	Thu, 14 Oct 2021 05:57:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 404a8b8a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 05:57:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F30DC60FF2
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 05:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pSmkaok4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634191028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LCBzisuNjdAMWWuBxMfCmRp6BVrFGY0LqLU86pDSHQA=;
 b=pSmkaok4lfszU4itcozic3LZjcykjCy5uNUyUlWJuxfEEaiOwTCyitl1yNlcQde0PfaDfl
 RrWdtLKHL5CTeHeEz55MeCdO4VSmYpwlyzKidvJXXxbotmtv6X5O3dLWDjpAM3nKvkVV9w
 CJmtYZXqUwNTN7BPqtSAPm6p9B2Pz8M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb46f990
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 05:57:07 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id z5so12065041ybj.2
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 22:57:07 -0700 (PDT)
X-Gm-Message-State: AOAM53228AARbLLql+mDZIVwFsym9B+DP2yNOiDh0ZeaSpKyquJLjUXD
 76fFbTRa402z1Cv/9qEq57eHfjE9ja8sWQqhNx0=
X-Google-Smtp-Source: ABdhPJzOaY2F4qfMyWBc2rIfc+CBXVGygkSMGAQ1d7JA/nvLgYWskhZ+UgfCuUbHKsnfbkVQx/PuchjUeXBq20vJk9Q=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr3866275ybk.412.1634191026806; 
 Wed, 13 Oct 2021 22:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
 <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
In-Reply-To: <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Oct 2021 23:56:56 -0600
X-Gmail-Original-Message-ID: <CAHmME9qSUqo4Wj8U4G3oznxnGB5_7oJkMULwSg4oVVgoRgQ05w@mail.gmail.com>
Message-ID: <CAHmME9qSUqo4Wj8U4G3oznxnGB5_7oJkMULwSg4oVVgoRgQ05w@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>, 
 Joshua Sjoding <joshua.sjoding@scjalliance.com>,
 Arlo Clauser <Arlo@starcubedesign.com>, 
 John-Paul Andreini <jandreini@geonerco.com>
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

Hi folks,

I assume that after >3 weeks of silence, the problem is fixed. That's good.

The root cause was that wgnt's initialization waited for winsock to
become available, but winsock was waiting for network interfaces like
wgnt to become available first, so they deadlocked for a half hour.
The solution, deployed over three weeks ago, was to defer wgnt's usage
of winsock until userspace requested it, which is necessarily after
everything else. This apparently works and is the correct fix.

But for whatever reason, the impact of this bug has really haunted me,
and so I didn't stop working on it or thinking about it even after it
was fixed correctly. The larger question is: why is a wgnt adapter
coming up at boot time at all? It's clearly not needed, as it is
something that anyway is controlled by a service. And indeed wgnt
adapters are supposed to be cleaned up when the service exits, but
this cleanup might not be committed if it happens during shutdown.
This is why sometimes the bug happened and sometimes it didn't.

So how can we solve the larger issue of never having wgnt adapters
exist at boot time, and always have them tied to the service lifetime?
It turns out Win8+ has an API for this called SwDevice, which
"unplugs" adapters when their owning process exits (or corresponding
handles close). This is used by various internal Windows components
like rasmans.dll and seems quite robust. It's also very different and
comes with its own gotchas, compared to what we were doing before, and
using it is no small undertaking. So over the last 3 weeks or so, I've
rewritten the entire userspace API portion of wgnt (and wintun) in
order to use this API where available (with ugly fallbacks for Win7).
The result is that the entire class of bugs, of which this bug here
was one, should be eliminated all together. And in the process, I've
made a lot of other things about adapter installation more reliable
and quicker too.

This work shipped with wgnt 0.10 and wintun 0.14, and is part of
wireguard for windows 0.4.11.

Regards,
Jason
