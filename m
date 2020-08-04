Return-Path: <SRS0=m2o5=BO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E19C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 12:50:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6CE2075A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B6CE2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e748f42;
	Tue, 4 Aug 2020 12:25:24 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86a8fdf4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 12:25:23 +0000 (UTC)
Received: from 1.general.apw.uk.vpn ([10.172.192.78] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apw@canonical.com>)
 id 1k2wNy-0006pG-W8; Tue, 04 Aug 2020 12:49:43 +0000
Date: Tue, 4 Aug 2020 13:49:42 +0100
From: Andy Whitcroft <apw@canonical.com>
To: NoddingDog <lists@noddingdog.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 unit193@ubuntu.com
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
Message-ID: <20200804124942.GF6317@brain>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
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

On Mon, Aug 03, 2020 at 06:25:51PM +0200, NoddingDog wrote:
> I'm sure I did apt update after removing the PPA, but just checked
> again:
>  
> apt update
> apt install wireguard
> 
> Same result - those gke kernels are included as dependencies and "will
> be installed".
> 
> Maybe Dell need to fix their bionic-oem repositories?

The breakage here came from bad dependancies on the Debian wireguard
packages which we backported to these series.  They incorrectly (for
Ubuntu) depend primarily on wireguard-modules which triggers an actual
dependancy on a kernel package; a severe no-no for exactly the issue
hit here.  It should likely have been caught in review but was not.

New packages are in the review queue and expected in -proposed today
across the board.  They will be released as soon as is practicle.

-apw
