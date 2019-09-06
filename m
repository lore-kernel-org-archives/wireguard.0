Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB56C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 22:08:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587152081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 22:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587152081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fd02de8;
	Fri, 6 Sep 2019 22:08:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a0082dd
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:05:44 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e01ebc9
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:05:44 +0000 (UTC)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <sultan.alsawaf@canonical.com>)
 id 1i6MMR-0006Nb-Qu
 for wireguard@lists.zx2c4.com; Fri, 06 Sep 2019 22:05:44 +0000
Received: by mail-pl1-f200.google.com with SMTP id v13so4330870plo.4
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 15:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XRr3LQARe+6Z6o1EUi+5HG5DK4uMIvziPrgci8nZGlM=;
 b=sen8PLvFxA7QRwHy2bSigSFhdVxjv7q9XWfS94xLq9ajnLTzFd7N1YRejcJdO0hTdH
 ybWMoDGZls7vOfgvdmuVw/da/z21ocsKq14BD6tjdFpm2VBEm6P1wONVNsOzGDFwXeLU
 2++3FLtXEIzVIPKY8c/RdYIgTMd55ODwYjE/Yw2VRCOPl36F36wHTHvTRKSN4SEQLRVE
 QhkpyP979DHDk/c2dkPvfzRDXZOJk6f9B/uLV3I49FWto1y6Olmn67oRQ0OH+H2hG+YM
 8o+7oYPz5osfHIOcapa1F1HrdMxes1T9VwqcGZ1VmtjBWGgqPFm6kP4dr95uAG4tZDzM
 eGjA==
X-Gm-Message-State: APjAAAX7qxbwys0jPYQg/q90/IBrj6ItcyIfeYC71gPPbuOmMQPuxysK
 9ge3u3kNPVGZpHe6nFFJuybuIruHILhZu1+kXo9YTKGlpXhWF1QxNs9OKgAADDJCzg0h1agAIW/
 5bsXFP7khdWViivtWIKtrUuelF0yLo5Gfmi9uPQ==
X-Received: by 2002:a62:e516:: with SMTP id n22mr13531774pff.105.1567807542190; 
 Fri, 06 Sep 2019 15:05:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6E9zqKA37nfX4y/PXyuYu/E6b1FXj2NNnI3sxlIbEHiAqWEcMrPFQf0v1mxony/L4JA8xnQ==
X-Received: by 2002:a62:e516:: with SMTP id n22mr13531760pff.105.1567807541965; 
 Fri, 06 Sep 2019 15:05:41 -0700 (PDT)
Received: from sultan-box ([104.200.129.62])
 by smtp.gmail.com with ESMTPSA id p14sm6062631pfn.138.2019.09.06.15.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 15:05:41 -0700 (PDT)
Date: Fri, 6 Sep 2019 15:05:37 -0700
From: Sultan Alsawaf <sultan.alsawaf@canonical.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Problems on linux-image-4.15.0-1047-aws
Message-ID: <20190906220537.GA7694@sultan-box>
References: <CAFdc9D9mbpJmu=3U3V5wCj-uOCsjMGa5KZS4Zk=aWQduwRjsgA@mail.gmail.com>
 <CAHmME9rqd8VqJiT3xJTba6N9ngaeM9MVqP98f54dU1CtGFfwHA@mail.gmail.com>
 <CAHmME9pRjRgoqoEre4MnK47pU210DQ0bQ3GM3FyJ-ciVFSuT0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9pRjRgoqoEre4MnK47pU210DQ0bQ3GM3FyJ-ciVFSuT0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 07 Sep 2019 00:08:44 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

> On Fri, Sep 6, 2019 at 3:18 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > available to the general population
> 
> https://wiki.ubuntu.com/Testing/EnableProposed
> 
> This might work.

Hi,

In the case of the 4.15 bug, there is a fixed kernel present in the Proposed
release channel which will be available in the normal Updates channel next week.

If needed, the fixed 4.15 kernel can be installed from Proposed now. To do so,
first enable access to Proposed updates by following the instructions in the
quoted link above, then install the desired kernel with the following command:

If you're using the generic kernel, replace FLAVOR with generic, i.e.,

$ sudo apt-get install linux-image-generic/bionic-proposed

Similarly, if you're using the AWS kernel, adjust the command as so:

$ sudo apt-get install linux-image-aws/bionic-proposed

Then disable access to the Proposed channel and reboot. Disabling access to
Proposed is important since it contains untested packages that are not
release-worthy.

Sultan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
