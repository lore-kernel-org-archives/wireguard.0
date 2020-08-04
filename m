Return-Path: <SRS0=m2o5=BO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051D3C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 12:37:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 758062086A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 12:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 758062086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70b92212;
	Tue, 4 Aug 2020 12:12:42 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1d2489d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 12:12:39 +0000 (UTC)
Received: from 1.general.apw.uk.vpn ([10.172.192.78] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apw@canonical.com>)
 id 1k2wBe-0005tj-O7; Tue, 04 Aug 2020 12:36:58 +0000
Date: Tue, 4 Aug 2020 13:36:58 +0100
From: Andy Whitcroft <apw@canonical.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: NoddingDog <lists@noddingdog.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 unit193@ubuntu.com, W.Jackson@dell.com
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
Message-ID: <20200804123658.GE6317@brain>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
 <532c74129f32cffd53c71b87858929f800c2f87b.camel@noddingdog.org>
 <20200803164249.GA781003@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803164249.GA781003@zx2c4.com>
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

On Mon, Aug 03, 2020 at 06:42:49PM +0200, Jason A. Donenfeld wrote:
> Looks like we're all set for these kernels:
> 
> zx2c4@bionicman:~$ apt-cache show linux-image-* | grep -C5 "^Source: linux-meta" | grep -B10 "^Provides: .*wireguard-modules" | grep ^Package:
> Package: linux-image-generic
> Package: linux-image-aws
> Package: linux-image-azure
> Package: linux-image-azure-edge
> Package: linux-image-gcp
> Package: linux-image-kvm
> Package: linux-image-lowlatency
> Package: linux-image-virtual
> Package: linux-image-aws-edge
> Package: linux-image-aws-lts-18.04
> Package: linux-image-gcp-edge
> Package: linux-image-generic-hwe-18.04
> Package: linux-image-generic-hwe-18.04-edge
> Package: linux-image-gke-5.4
> Package: linux-image-lowlatency-hwe-18.04
> Package: linux-image-lowlatency-hwe-18.04-edge
> Package: linux-image-oracle
> Package: linux-image-oracle-edge
> Package: linux-image-virtual-hwe-18.04
> Package: linux-image-virtual-hwe-18.04-edge
> Package: linux-image-gke-5.3
> 
> But we are not all set for these kernels:
> 
> zx2c4@bionicman:~$ comm -23 <(apt-cache show linux-image-* | grep -C5 "^Source: linux-meta" | grep ^Package: | sort | uniq) <(apt-cache show linux-image-* | grep -C5 "^Source: linux-meta" | grep -B10 "^Provides: .*wireguard-modules" | grep ^Package: | sort | uniq)
> Package: linux-image-azure-lts-18.04
> Package: linux-image-extra-virtual
> Package: linux-image-extra-virtual-hwe-16.04
> Package: linux-image-extra-virtual-hwe-16.04-edge
> Package: linux-image-extra-virtual-hwe-18.04
> Package: linux-image-extra-virtual-hwe-18.04-edge
> Package: linux-image-gcp-lts-18.04
> Package: linux-image-generic-hwe-16.04
> Package: linux-image-generic-hwe-16.04-edge
> Package: linux-image-gke
> Package: linux-image-gke-4.15
> Package: linux-image-gke-5.0
> Package: linux-image-gkeop-5.3
> Package: linux-image-gkeop-5.4
> Package: linux-image-lowlatency-hwe-16.04
> Package: linux-image-lowlatency-hwe-16.04-edge
> Package: linux-image-oem
> Package: linux-image-oem-osp1
> Package: linux-image-oracle-lts-18.04
> Package: linux-image-virtual-gkeop-5.0
> Package: linux-image-virtual-hwe-16.04
> Package: linux-image-virtual-hwe-16.04-edge
> 
> Appears that the "oem" kernel is part of the bad list.

This list is somewhat inaccurate as about half of those are transitional
packages an not expected to actually have provides.  linux-oem is
unfortuantly converted but misses its linux-meta-oem changes.  This is
being sorted out.  The remaining are being reviewed.

-apw
