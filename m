Return-Path: <SRS0=WErI=2X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5C0C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 20:12:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62AAF21655
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 20:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aa6s1KG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62AAF21655
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5480c128;
	Thu, 2 Jan 2020 20:11:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12c77c46
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 20:11:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5679ffe9
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 20:11:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed4fbeb5;
 Thu, 2 Jan 2020 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=QHJyZct/r3+R
 Oy8GAJCS0eVzRc4=; b=aa6s1KG2dCo8Fu5w/fzwjq2nLqNNUQ90356IkzNC3yHg
 5+wHhTxPC2kmzxjSt7DTwKEP7jlUFnyQuHjexsySiEgRN4nl0SS0Au2s02coZgze
 u3WjP3RMF2rm1410/HlIAa393969XIpqTss7VPTYVFEt9E/+zOgTlNs8RgXueHgT
 Lw9aKgA3IYJ6wuLReHXs8eVMnEAO5M5rxgXmgqKLHHaP/rJBSdT80au/Ssgng+NL
 rBheBtAMJJJvJIclN5lBONDSnCPWTfkFsLuV8FMMYg2dFzDvSqP2QkQTeUkStUoX
 nK8GlHmtJvfsurzBgr+UK6uKknzppwNz6Os3zYUB1w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dcb806c5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 2 Jan 2020 19:13:01 +0000 (UTC)
Subject: Re: wireguard broke with recent update on fedora 31
To: Barry Scott <barry@barrys-emacs.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <F9761E5F-F69B-458F-A534-3249FCFBF5FD@barrys-emacs.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <6c155e17-eb7a-c267-ee10-6cbb8a56857f@zx2c4.com>
Date: Thu, 2 Jan 2020 21:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <F9761E5F-F69B-458F-A534-3249FCFBF5FD@barrys-emacs.org>
Content-Language: en-US
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

On 12/31/19 1:03 PM, Barry Scott wrote:
> I had wireguard working but the recent update of somethng has broken it.

Does downgrading fix it? If not, something else is broken. Can you test 
that first?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
