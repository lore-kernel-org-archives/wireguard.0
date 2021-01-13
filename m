Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50E2C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:35:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9199D235F8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9199D235F8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e248d9a;
	Wed, 13 Jan 2021 16:33:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e9c754a9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610555617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L4tFSDcwId7/hQJRaZFu7s0kfwGt2SygBkx57Bn7tss=;
 b=kNMDM6JCYo2AAY8PYbEw2nzpQFgYgK50paIgzbEcgsi8KZfyF8go1TK9pvQpraUrDZt8pV
 PCCXcW20BT/ut/0lP/I+9N6Vad+hP+VmgGY1R6IxOIgo3IKTufSVoWqhDGrK+7IID69W/9
 oZzyoSvKrv2Xg0/sNpSYYIaQWCvxWh0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f0c420e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:33:36 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id c7so2473345qke.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 08:33:36 -0800 (PST)
X-Gm-Message-State: AOAM531BjOT4/2gon9E3K1WnjUHZX3FNYBblm6VK3MBXkgoFDaORKJgc
 TIe/F7yxJD8OL+HT6Cv6+xr9gVoOAMGwrmBqRYg=
X-Google-Smtp-Source: ABdhPJxap8vQhk/BtXTiWiQZjX4DU9E1icf59Svp3iayG2TxEWNFx/fF60Pzrz1/fKEFmsNIhftNjaU/qKpbNk6HJLc=
X-Received: by 2002:a25:b813:: with SMTP id v19mr4597320ybj.178.1610555616345; 
 Wed, 13 Jan 2021 08:33:36 -0800 (PST)
MIME-Version: 1.0
References: <X/8aDfdkod+rCPqK@zx2c4.com>
 <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
In-Reply-To: <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jan 2021 17:33:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
Message-ID: <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
Subject: network namespace wireguard routing [Was: Re: Userspace Networking
 Stack + WireGuard + Go]
To: Julian Orth <ju.orth@gmail.com>
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

In order to prevent this Go thread from being hijacked with Linux
concerns, I've changed the Subject line of the email. Please keep
follow ups in this thread rather than the other.

Response is in line below:

On Wed, Jan 13, 2021 at 5:26 PM Julian Orth <ju.orth@gmail.com> wrote:
>
> On 13/01/2021 17.04, Jason A. Donenfeld wrote:
>
>  > Even if you're unprivileged and want a WireGuard interface for just a
>  > single application that's bound to the lifetime of that application,
>  > you can still use WireGuard's normal kernel interface inside of a user
>  > namespace + a network namespace, and get a private process-specific
>  > WireGuard interface.
>
> That's what my patches from back in 2018 were trying to accomplish.
> Unless I've missed something since, I do not see how what you're
> describing would work.  Unless you also
>
> - create a TUN device in the network namespace
> - add a default route through that TUN device
> - manually route all traffic between the init network namespace and your
>    network namespace.
>
> Is that what you meant or is there a simpler way?

What I meant was:

1. User opens his shell and runs ./blah. That executes in the init
namespace where all the physical interfaces are.
2. blah creates a wireguard interface.
3. blah creates a network namespace.
4. blah moves that wireguard interface into that network namespace.
5. blah calls `setns()` on one of its threads to use that network namespace.

Thinking about this in more detail, I'm guessing you take issue with
step #2? Since that actually might require privileges in the init
namespace?

Jason
