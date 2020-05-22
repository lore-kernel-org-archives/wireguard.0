Return-Path: <SRS0=143r=7E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C978C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 May 2020 12:43:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4ECD206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 May 2020 12:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="B1qbM3BR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4ECD206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a525f007;
	Fri, 22 May 2020 12:29:07 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f623102
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 May 2020 12:29:04 +0000 (UTC)
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 49T5l75P0czFdfR
 for <wireguard@lists.zx2c4.com>; Fri, 22 May 2020 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1590151427; bh=sZrm8ZjI6HM6DHQof0HlVg8pXl12U9liFWfH7W5o+/0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=B1qbM3BR0uqCPt5wM7CTS+vjfWQifSa7C2hAraofygs5r69l8GdsZPKPEAvP/YK/W
 RKgY9unnFeZ9UwEqJf1avowtR/JrO51fNUsbNuA5WfvDlBqrCgBcH/fg9bwsxrU2BP
 QK9BCrgqxfUkLopSQRvpi9j34SfipXxZSx6lVXT4=
X-Riseup-User-ID: 89E491747721CC576C4CC1E448E0B38FF30ED25AE83FB1C23023807ACE247760
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id 49T5l731LlzJqxd
 for <wireguard@lists.zx2c4.com>; Fri, 22 May 2020 05:43:47 -0700 (PDT)
Date: Fri, 22 May 2020 12:43:44 +0000
From: Georg Faerber <georg@riseup.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
Message-ID: <20200522124344.GH32260@debian>
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
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

Regarding the Debian-side of things:

On 20-05-22 02:04:58, Jason A. Donenfeld wrote:
> I'd like to put these on build.wireguard.com to mitigate breakage. In
> order to make this happen, I'll need two things:
> - A URL I can scape that will give me the latest kernel versions for
> relevant distros.

Versions are available via [1], the 'f' param returns json output.
API docs are available via [2].

> - A URL I can construct using a selected version to download a boring
> kernel source tarball.
> I would prefer to not involve git, if possible, and for these URLs to
> point to the sources for actual kernels that are shipping as the
> standard latest-kernel for each of the above releases.

One way to get the source tarball, without relying on git, is using
[3], specifically [4]. To construct the URL to fetch the source tarball
from, one would need to concatenate:

https://snapshot.debian.org/archive/debian/ + $first_seen + $path + $name

An example URL would look like [5].

I'm not sure if there are API docs available.

Hope this helps,
cheers,
Georg


[1] https://api.ftp-master.debian.org/madison?package=linux&f
[2] https://ftp-team.pages.debian.net/dak/epydoc/dakweb.queries.madison-module.html
[3] https://snapshot.debian.org/
[4] https://snapshot.debian.org/mr/package/linux/5.6.7-1/srcfiles?fileinfo=1
[5] https://snapshot.debian.org/archive/debian/20200429T204608Z/pool/main/l/linux/linux_5.6.7.orig.tar.xz
