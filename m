Return-Path: <SRS0=tD3D=XI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923DFC49ED7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 12:07:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFB02084F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 12:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marples.name header.i=@marples.name header.b="lQ05eQTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBFB02084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=marples.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ab7f7fe;
	Fri, 13 Sep 2019 12:07:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fd0a179
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 18:40:52 +0000 (UTC)
Received: from relay2.marples.name (relay2.marples.name
 [IPv6:2a00:da00:1800:80d6::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 702fbedc
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Sep 2019 18:40:52 +0000 (UTC)
Received: from mail.marples.name
 (cpc115040-bour7-2-0-cust370.15-1.cable.virginm.net [81.108.15.115])
 by relay2.marples.name (Postfix) with ESMTPS id 0113F884
 for <wireguard@lists.zx2c4.com>; Wed, 11 Sep 2019 18:40:50 +0000 (UTC)
Received: from [10.73.2.30] (uberpc.marples.name [10.73.2.30])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.marples.name (Postfix) with ESMTPSA id EFE7C1CC1A1
 for <wireguard@lists.zx2c4.com>; Wed, 11 Sep 2019 19:40:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marples.name;
 s=mail; t=1568227210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8q6vtzg5s2ZTdcWPOg0VPtdUKmYqNBh4gHxOwBlfXQQ=;
 b=lQ05eQTB6/yaBo46AqIHpEgDfcLAN/YmLPaAHUP8lfnsmjTZVswijIIGxhPh0j4Qm70zRF
 ltdPqK2QX/cnlIQUGMpfslxB4e1N6QmgSBbhmM90iW72UcsNlPrirvw8DbBmVJk6G+0qu8
 RG/weL3Ga3wMnPCVK1TnY86A/203xWE=
To: wireguard@lists.zx2c4.com
References: <fca41efd-5478-7845-bc40-75598d9add90@debian.org>
Subject: Re: wg-quick invoking resolvectl instead of resolvconf on systems
 where that is appropriate?
From: Roy Marples <roy@marples.name>
Message-ID: <d556f1ab-15ec-caa3-2fc3-75b84bdffbe2@marples.name>
Date: Wed, 11 Sep 2019 19:40:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fca41efd-5478-7845-bc40-75598d9add90@debian.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 13 Sep 2019 14:07:11 +0200
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I'm not subbed to this list, so please include me directly in any 
replies. Disclaimer - I'm upstream for openresolv.

Michael Biebl wrote this here:
https://lists.zx2c4.com/pipermail/wireguard/2019-September/004524.html

You absolutely correct in that resolvconf is not a standard Linux 
interface - it works just fine on the BSD family as well. Infact it 
works on every POSIX environment as it just requires a Bourne Shell.
It ships by default since NetBSD-6, FreeBSD-9, DragonFlyBSD, etc - it's 
not optional on these BSD's.

Let us also not forget that resolvectl is either just as optional as 
resolvconf on Linux or just not available due to a lack of systemd. 
Examples would include Gentoo, Alpine, OpenWRT, Void Linux, Slackware, 
Devuan ... I could go on, but you get the idea.

However, I will argue that resolvconf is *the standard* modifying DNS 
interface - Debian itself shipped the default DHCP client (dhclient) 
with scripts to interface with resolvconf and the VPN and PPP clients as 
well. Gentoo does as well, because I added support for it many years 
ago. This work all predates systemd, network manager, etc.

So while it might not be installed by default, it is certainly very well 
supported and recommended.

I'll also note that just by looking at the man page, resolvctl seems to 
be lacking important privacy options in it's resolvconf (or rather) 
emulation mode so if you want to push this, better support those options!

Anyway, all this being said I would agree that supporting both systems 
*at runtime* is the better approach. openresolv does this with init 
systems, including systemd.

Roy
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
