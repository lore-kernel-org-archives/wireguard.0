Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D57C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 10:36:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA8320738
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 10:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=knockaert.nl header.i=@knockaert.nl header.b="CByi1o0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA8320738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=knockaert.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ace36bdf;
	Mon, 3 Aug 2020 10:12:35 +0000 (UTC)
Received: from mail.knockaert.nl (mail.knockaert.nl [83.160.83.228])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24406842
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 10:12:33 +0000 (UTC)
Received: from [169.254.181.188] (unknown
 [IPv6:2001:980:6492:1:c94:9006:a531:4db7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: jknockaert@knockaert.nl)
 by mail.knockaert.nl (Postfix) with ESMTPSA id 58A055A0D79;
 Mon,  3 Aug 2020 12:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knockaert.nl;
 s=mail; t=1596451005;
 bh=0bW7Y2m3IO8wa8BrWsqQwICFsWPA2OF2VojmLk94WpY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CByi1o0j/iXCvWUzPJaHTYUA4sp1kbKoHJ7tZkgXaPCGUCVkZR2IZmxs+3ihzf2pt
 wTDAd9FMsSSx4rTddQgtj2QbgLg11yC6eExwohKUZTkT7R3y8+/ejzqBId+mPLd+42
 CLumPTkBkKm6YQKgm1tAaBwDvesER+n03IVtfUK8=
From: "Jasper Knockaert" <jasper@knockaert.nl>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, unit193@ubuntu.com, apw@canonical.com
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
Date: Mon, 03 Aug 2020 12:36:44 +0200
X-Mailer: MailMate (1.13.1r5671)
Message-ID: <4FD17BFB-009E-4367-A208-5614EC3FAC02@knockaert.nl>
In-Reply-To: <20200803102808.GA1402387@zx2c4.com>
References: <20200803102808.GA1402387@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-Virus-Scanned: clamav-milter 0.102.4 at green
X-Virus-Status: Clean
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

Hi

On 3 Aug 2020, at 12:28, Jason A. Donenfeld wrote:

> Users should never need to manually install wireguard-tools or
> wireguard-dkms. Rather, *only* install the "wireguard" package, and 
> this
> will automatically choose the correct additional packages to pull in.

Well, I think there is a case to manually install wireguard-tools where 
you want to run wireguard in a container. In that case you may want to 
install wireguard-dkms on the host (in case its kernel doesn't yet 
support wireguard), and wireguard-tools in the container.

Best regards


Jasper
