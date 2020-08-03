Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DB8C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:42:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4E122B4E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="wCGKlwSZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4E122B4E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c360b751;
	Mon, 3 Aug 2020 16:18:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 645a51bd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:18:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 277e1e0d;
 Mon, 3 Aug 2020 16:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=Rcorc/J3gltVPtilHZYZ4eppDMo=; b=wCGKlwS
 ZaN3OKehjTcSbHXC+DfjzLCpRyUk5JAgWMG0tfJSkUrjOBS2Ndhr1YgmG7fjXXxE
 X6yZim2nFFoi3QvNyaLYRxrq74UzgWyYxOfWNghSSjlI6K+FaQ0rrcu7oN9XVpPm
 C7XJ0VIG6Pr65Tf61YZ2bZRzittZeFbYl/mzchg2ehBGVQi+cxnzijGRj4JnJ73J
 fhU1TK261gDQOQwN+fdfUr4Q10NxgI0E4K9upP0/QsQIqBSyWEnF7IQ1in5v33eP
 lrhmOMASVIc8PZkNW+BklmTeAvpoAq6/lk3Io2JoU1YA1MUOecgM3T4iv1+qOPWZ
 1ZITVzrJbrS+xFg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d26842db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 3 Aug 2020 16:18:39 +0000 (UTC)
Date: Mon, 3 Aug 2020 18:42:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: NoddingDog <lists@noddingdog.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com,
 Andy Whitcroft <apw@canonical.com>, W.Jackson@dell.com
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
Message-ID: <20200803164249.GA781003@zx2c4.com>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
 <532c74129f32cffd53c71b87858929f800c2f87b.camel@noddingdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <532c74129f32cffd53c71b87858929f800c2f87b.camel@noddingdog.org>
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

Looks like we're all set for these kernels:

zx2c4@bionicman:~$ apt-cache show linux-image-* | grep -C5 "^Source: linux-meta" | grep -B10 "^Provides: .*wireguard-modules" | grep ^Package:
Package: linux-image-generic
Package: linux-image-aws
Package: linux-image-azure
Package: linux-image-azure-edge
Package: linux-image-gcp
Package: linux-image-kvm
Package: linux-image-lowlatency
Package: linux-image-virtual
Package: linux-image-aws-edge
Package: linux-image-aws-lts-18.04
Package: linux-image-gcp-edge
Package: linux-image-generic-hwe-18.04
Package: linux-image-generic-hwe-18.04-edge
Package: linux-image-gke-5.4
Package: linux-image-lowlatency-hwe-18.04
Package: linux-image-lowlatency-hwe-18.04-edge
Package: linux-image-oracle
Package: linux-image-oracle-edge
Package: linux-image-virtual-hwe-18.04
Package: linux-image-virtual-hwe-18.04-edge
Package: linux-image-gke-5.3

But we are not all set for these kernels:

zx2c4@bionicman:~$ comm -23 <(apt-cache show linux-image-* | grep -C5 "^Source: linux-meta" | grep ^Package: | sort | uniq) <(apt-cache show linux-image-* | grep -C5 "^Source: linux-meta" | grep -B10 "^Provides: .*wireguard-modules" | grep ^Package: | sort | uniq)
Package: linux-image-azure-lts-18.04
Package: linux-image-extra-virtual
Package: linux-image-extra-virtual-hwe-16.04
Package: linux-image-extra-virtual-hwe-16.04-edge
Package: linux-image-extra-virtual-hwe-18.04
Package: linux-image-extra-virtual-hwe-18.04-edge
Package: linux-image-gcp-lts-18.04
Package: linux-image-generic-hwe-16.04
Package: linux-image-generic-hwe-16.04-edge
Package: linux-image-gke
Package: linux-image-gke-4.15
Package: linux-image-gke-5.0
Package: linux-image-gkeop-5.3
Package: linux-image-gkeop-5.4
Package: linux-image-lowlatency-hwe-16.04
Package: linux-image-lowlatency-hwe-16.04-edge
Package: linux-image-oem
Package: linux-image-oem-osp1
Package: linux-image-oracle-lts-18.04
Package: linux-image-virtual-gkeop-5.0
Package: linux-image-virtual-hwe-16.04
Package: linux-image-virtual-hwe-16.04-edge

Appears that the "oem" kernel is part of the bad list.

I'll note that this is at least the third time Canonical has forgotten
the "Provides:" line for kernel packages. I'd highly recommend they
put some time into double checking their procedures.
