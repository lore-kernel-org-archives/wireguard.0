Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774ECC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 21:18:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0721222BF3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 21:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0721222BF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1dc9097;
	Mon, 3 Aug 2020 20:54:26 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0e982c53
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 20:54:25 +0000 (UTC)
Received: from 1.general.apw.uk.vpn ([10.172.192.78] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apw@canonical.com>)
 id 1k2hqx-0005IZ-8h; Mon, 03 Aug 2020 21:18:39 +0000
Date: Mon, 3 Aug 2020 22:18:38 +0100
From: Andy Whitcroft <apw@canonical.com>
To: NoddingDog <lists@noddingdog.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 unit193@ubuntu.com
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
Message-ID: <20200803211838.GD6317@brain>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
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

On Mon, Aug 03, 2020 at 06:08:56PM +0200, NoddingDog wrote:
> Hello,
> 
> I'd like to report a serious problem.
> 
> I have a Dell XPS13 with Dell's OEM version of Ubuntu 18.04
> 
> I had previously added the wireguard PPA and removed it as mentioned
> below.
> 
> Now, when running sudo apt install wireguard, the system wants to
> install the following packages:
> 
> linux-image-5.3.0-1032-gke
> linux-image-gke-5.3
> wireguard-tools

Yes, this is primarily a bug in the Depends on the wireguard package:

    Depends: wireguard-modules (>= 0.0.20191219) | wireguard-dkms (>=
        0.0.20200121-2), wireguard-tools (>= 1.0.20200513-1)

The linux-oem kernel has (separatly) a bug in its Provides so it does
not think it contains wireguard.ko.  In that scenario we want the apt
resolver to pick wireguard-dkms as at least that way you have a
wireguard.ko.  But the way it is formed it will pick wireguard-modules
for installation if neither is installed already.  This can only be
solved by installing an unrelated kernel.

Am working on solving these problems variously.

-apw
