Return-Path: <SRS0=PHiA=TI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B845C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 May 2019 12:19:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520E221019
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 May 2019 12:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SImUhosK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520E221019
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 154a89b8;
	Wed, 8 May 2019 12:19:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e60c4d4
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 12:19:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ffc5c34
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 12:19:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9717edf
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:mime-version:content-type; s=mail; bh=3sUv78
 n+bNgkpMpmmHaQxXl9elE=; b=SImUhosKLeA10hJPSeL1TOQsMT3ECBO5+bZgU+
 NqswOe2BaF6oAyPMQBecewvLypi9zphlCHq0brqizvdRjyd0uRuyxn/tmoaiG9f9
 jQI2b2wQkIyiA89QoIHEtlT8214uHch/LiunTOwwQSi3LLwT5oTIHz4JXjVlnmf+
 z7vlvGPHiHfdoy1aFbEwc/bcuO5Nbzk365mn37XZdidAH5V25gk8r0cuIUj08hK3
 2ijN2KGP2zFZ2iBOwch6JmmItdqbJCSbO2hze9OK0wY9bxOpAm0FNKvCS9zOheKG
 U5hkAoI9WRMWUTQsgj98KLGXGsIWnCq94ION+Nuh/zLvk63Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55e4c94a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 11:52:03 +0000 (UTC)
Date: Wed, 8 May 2019 14:19:47 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] download Windows pre-alpha for testing
Message-ID: <20190508121946.GA15707@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
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

Hey everyone,

I've been mostly absent these last weeks, due to being completely absorbed in
Windows programming. I think we're finally getting to the state where we might
really benefit from testing of the "pre-alpha". I write "pre-alpha", because
the software isn't finished yet, and there are a lot of goals, many of which 
security-related, that we haven't yet accomplished. We also have not even
begun to optimize its performance. But it's fairly functional, and therefore
I'd appreciate feedback on the new bugs you find.

We have, so far, accomplished some nice things, including:

  - The same basic UI design that users know and expect from macOS, including
    a syntax-highlighting configuration editor.
  - DPAPI-encrypted configuration files.
  - Multiprocess service architecture and process isolation.
  - Automatic "kill-switch" to block untunneled traffic.
  - Signed drivers for Windows Server 2016 and 2019.
  - Update mechanism.
  - MSI installer and uninstaller that does the right thing with regards to
    services and cleanup.
  - Oh, also, it actually does WireGuard tunneling.

We're still working on lots of things, and you can follow along with our
updated-every-minute TODO list at [1]. As you can see, there are quite a few
known-bugs, with the Wintun TODOs being especially critical. Did I mention
this was a pre-alpha? The security of the architecture is also evolving, and
you can read our evolving attack surface document at [2]. And of course, if
you'd like to help develop this, build instructions are available at [3]
and [4].

As you find bugs, please report them to us in #wireguard on Freenode, or by
emailing us at team@wireguard.com, and please check [1] before doing so.

You can download the pre-alpha of WireGuard for Windows here:
    https://www.wireguard.com/install/?downloadwindowsprealpha=1
Do note that at the time of writing (check the timestamp of this email), we
don't consider the build there satisfactory from a security perspective.

Regards,
Jason

[1] https://docs.google.com/document/d/1-jlULsy1uDun-b4ow3RvnNQJU5K_pAv87sqDAfK66Kk
[2] https://git.zx2c4.com/wireguard-windows/about/attacksurface.md
[3] https://git.zx2c4.com/wireguard-windows/about/
[4] https://git.zx2c4.com/wintun/about/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
