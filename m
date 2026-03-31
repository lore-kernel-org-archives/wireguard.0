Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C71061B28
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2026 00:15:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c1e28472;
	Tue, 31 Mar 2026 00:15:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 774f4662
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2026 00:15:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 03D526013A;
 Tue, 31 Mar 2026 00:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9FAC4CEF7;
 Tue, 31 Mar 2026 00:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774916108;
 bh=4XJyboVsJ0yxu/uemond9OcSUwty3Aslvd4eyEfsYYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KbBr2qa+9arONncmAT3Z/UmnTPAAtoutZuZnz+oKNBaNyiO/fB6iCief90yoyGyWh
 8EPbOxsRu75NFxSrnBXZStxNZDGxeFmZwqeemW2bo+OlOTgmXXnmSrd0G0RHyyiPNv
 +/b+5tpQtA2di0wYkobF1w9HONy9V/H79WpNzUK0KDSUp+IlblUhfFEqnd02PNHSls
 L4XMFUSiMosMaS1SPNOT87j/uxLNJ/fhF7R4XSyUk9vGR1Q0E+0dLrVFBpUNmT1ytd
 yuTDXqdkcO6rUHnomYuAicWrGULoJ6ti81XDJImo9eYPVhOMNyTJdBAko3ph58xLj2
 mkYHOGTd1407w==
Date: Mon, 30 Mar 2026 17:13:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ryan Appel <ryan.appel.333@gmail.com>
Cc: linux-crypto@vger.kernel.org, wireguard@lists.zx2c4.com,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Kernel ML-KEM implementation plans
Message-ID: <20260331001358.GA5190@sol>
References: <5F9ACD7A-F3B8-463A-A00E-28F68819A66C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5F9ACD7A-F3B8-463A-A00E-28F68819A66C@gmail.com>
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

On Mon, Mar 30, 2026 at 06:41:46PM -0500, Ryan Appel wrote:
> Hello all, 
> 
> Looking through the mail archives I see no information on an
> implementation of ML-KEM that has been planned, except for leancrypto
> attempting to make a Key-Agreement Scheme a Key-Encapsulation
> Mechanism.
> 
> Is there a plan to implement a KEM interface at this point? Is this
> something that needs support?  How could someone contribute to this?

We don't add new algorithms preemptively, but rather only when an
in-kernel user comes along.  Otherwise there's a risk that the code will
never be used.

Do you have a specific in-kernel user in mind?  I haven't actually heard
anyone specifically say they need ML-KEM in the kernel yet.

I guess the obvious use case would be WireGuard.  But that would require
a new WireGuard protocol version that replaces X25519 with something
like X25519MLKEM768.  It's going to be up to the WireGuard author
(Jason) to decide whether that's in the roadmap for WireGuard.

Also maybe Bluetooth, though it seems the spec for that is yet to be
defined?

Anyway, point is, before it makes sense to consider possible
implementation strategies, there needs to be a plan to actually use it.

- Eric
