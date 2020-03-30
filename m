Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30B8C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 13:17:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EE762073B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 13:17:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPq/7r7A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EE762073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d355427f;
	Mon, 30 Mar 2020 13:09:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8cad82e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 13:09:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EEFB2073B;
 Mon, 30 Mar 2020 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585574223;
 bh=vScNAhgPYLb0yVkd4AmkUJdGKahb9/GouFx0PXmjsiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fPq/7r7ALWNwxVNztLiOSYdFcSo5mbVDrL+XRMXpoNnxY59Pr/oXQfbFJafG4vVi/
 ojyjgN7i9X5WUaYtFilV4X9eREnr2O85czdNNSyansmx8MYJEUeaPauwP0w+u2YHNh
 m5HJKCP3M7dVRWpqV9VmoErEZpJ3Iy9gZ/DmR6tg=
Date: Mon, 30 Mar 2020 15:17:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard 1.0.0 for Linux 5.6 Released
Message-ID: <20200330131701.GA243095@kroah.com>
References: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
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

On Sun, Mar 29, 2020 at 08:16:43PM -0600, Jason A. Donenfeld wrote:
> Hi folks,
> 
> Earlier this evening, Linus released [1] Linus 5.6, which contains our
> first release of WireGuard. This is quite exciting. It means that
> kernels from here on out will have WireGuard built-in by default. And
> for those of you who were scared away prior by the "dOnT uSe tHiS
> k0de!!1!" warnings everywhere, you now have something more stable to
> work with.
> 
> The last several weeks of 5.6 development and stabilization have been
> exciting, with our codebase undergoing a quick security audit [3], and
> some real headway in terms of getting into distributions.

Congrats on all of this, and thanks for sticking with it.

greg k-h
