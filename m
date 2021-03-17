Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CCDC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 16:29:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D85E64F10
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 16:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D85E64F10
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6802bb7;
	Wed, 17 Mar 2021 16:29:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7a5f55df
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615998548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=qwo/YZAYXjgiwvrnrThLzgkwO9AEirWbm8oDSwrOW6E=;
 b=e7UfNZ+IQmtexseahYMSWIb+p4lQY6xPWzW1Dr30Dl6MtNn7Woocp2Z2z6N9fc1zVPDv6j
 oTh5fKGbnuc3MdtXI7HTCNi6FanMjmgwx1SqLMTcWlwFXKHf0GJbMWGMNQzmjBXAMRtWMe
 GKY6vXwT0IPg9PaTw0IFIuzwctzgJYw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ee3203ee
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 16:29:08 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:29:06 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] WireGuard for FreeBSD snapshot 0.0.20210317 is available
Message-ID: <YFIuUos7XojJP/7L@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi,

An experimental snapshot, v0.0.20210317, of WireGuard for the FreeBSD
kernel has been tagged in the git repository:

    https://git.zx2c4.com/wireguard-freebsd/

This is the most recent module as it existed before we thankfully pulled
it from the 13.0 release in order to work on it more slowly here.  At
some point, we'll provide a package in ports for this, but not quite
yet. For now, you can build tags or build master, via:

    # git clone https://git.zx2c4.com/wireguard-freebsd
    # cd wireguard-freebsd/src
    # make load
    # make install

After that, it should be possible to use wg(8) and wg-quick(8) like
usual, but with the faster kernel implementation.

At this time this code is new, unvetted, possibly buggy, and should be
considered "experimental". It might contain security issues. We gladly
welcome your testing and bug reports, but do keep in mind that this code
is new, so some caution should be exercised at the moment for using it
in mission critical environments. In my small testing so far, however,
it seems to "basically work". And at the very least, those relying on
the code that was prior in the FreeBSD tree now have some immediate
continuity.

Over the next days and weeks, it can be expected that this repository
will improve and grow.

Enjoy!
Jason
