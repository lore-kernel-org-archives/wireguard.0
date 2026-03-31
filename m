Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E425C1061B28
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2026 01:12:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2b09b22e;
	Tue, 31 Mar 2026 01:12:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 76d63ee8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2026 01:12:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF10C40377;
 Tue, 31 Mar 2026 01:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165FC4CEF7;
 Tue, 31 Mar 2026 01:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774919563;
 bh=iCfC32gPCOq3jfIEnZRFSUBxARxVZ4ChIy/597rHi84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WaZ2UQdK/SNt4rlJZJ2QJQnScNiPJJZPTE6s4sEv2QaN+SXcJiHKlIDYpbrgpaMzM
 WB9Us2Ejcc4+WWb+NDeusT/wSYGNDZbyakla24p2ZADDJ5sB5kDUE50oxQYqX3K28F
 3vHcPNNFvoblgKyP4QKYYDW9BMUiRmvJ6ntWQytwShEWOA8zxJQ6ziF8HloS0igUsZ
 /v8VIww1IEHPKHj3nGfcRiL+xxkNWTz6y2XenMNkMbiVpW6bU9UN0BCzPGT9OVE5sx
 7pBxRvKg7zNZjHbSczCTKJ438sprrcCZvHkCyyjxN0/eXpEEQ536d5UmymmQjQvDFW
 ql+h1lqba+mag==
Date: Mon, 30 Mar 2026 18:11:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ryan Appel <ryan.appel.333@gmail.com>
Cc: linux-crypto@vger.kernel.org, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Kernel ML-KEM implementation plans
Message-ID: <20260331011133.GB5190@sol>
References: <20260331001358.GA5190@sol>
 <7507DE2E-1507-4D03-B6EF-9C139BBF34F8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7507DE2E-1507-4D03-B6EF-9C139BBF34F8@gmail.com>
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

On Mon, Mar 30, 2026 at 07:44:55PM -0500, Ryan Appel wrote:
> WireGuard was my big implementation user.

Any more details on this?  Googling for research papers shows that there
have indeed been several proposals for quantum-resistant WireGuard.  But
some use algorithms other than ML-KEM.  Others don't modify the kernel
code but rather do the key establishment in userspace.  I haven't looked
into the details, but it also sounds like it's not as simple as swapping
out the algorithm, either.

I think step 1 is work out some plan with the WireGuard folks.  Which
may or may not turn out to involve in-kernel ML-KEM.

> I also know that VMware uses the kernel crypto space for many of its
> crypto operations.  I do not know when they will want ML-KEM and if
> they will want it only within BoringCrypto or OpenSSL, but if there is
> need for it in the market before it can be developed then that makes
> sense.

That code isn't upstream though, right?  So even if hypothetically they
(will?) need ML-KEM in the kernel (for what?), that doesn't count for
upstream purposes.

- Eric
