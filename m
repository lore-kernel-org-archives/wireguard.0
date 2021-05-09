Return-Path: <SRS0=U1SX=KE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624DFC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 May 2021 07:52:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0924610A0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 May 2021 07:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0924610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec07a563;
	Sun, 9 May 2021 07:52:39 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4ac6a139
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 May 2021 07:52:37 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id CFF749F;
 Sun,  9 May 2021 07:52:36 +0000 (UTC)
Date: Sun, 9 May 2021 12:52:36 +0500
From: Roman Mamedov <rm@romanrm.net>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: secondary IP on wg0 fails
Message-ID: <20210509125236.17dd99aa@natsu>
In-Reply-To: <eb229853-cc10-88bd-06bb-82bbab73cfe1@yahoo.co.uk>
References: <204f6e7b-d594-c2c0-5242-1643055065c3.ref@yahoo.co.uk>
 <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
 <20210508215039.31f32aae@natsu>
 <eb229853-cc10-88bd-06bb-82bbab73cfe1@yahoo.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 8 May 2021 19:49:06 +0100
lejeczek <peljasz@yahoo.co.uk> wrote:

> > Also remember that sets of AllowedIPs should be unique within the network,
> > i.e. can't have the same AllowedIPs or ranges listed for multiple nodes at the
> > same time. Setting it to the same /24 on all nodes will not work.
> >
> > If still not clear, better post your complete config (without keys).
> >
> It's the same single subnet 10.0.0.0/24 and to reiterate - 
> wg0's "primary" IPs can all ping each other.
> All nodes have, respectively:
> eg. node-B
> [peer]
> ...
> AllowedIPs = 10.0.0.1/32, 10.0.0.226/32
> Endpoint = 10.1.1.223:51851
> 
> [peer]
> ...
> AllowedIPs = 10.0.0.3/32, 10.0.0.226/32
> Endpoint = 10.1.1.225:51853

See above for "Also remember...", you cannot have 10.0.0.226/32 added to
multiple peers as AllowedIPs at the same time.

-- 
With respect,
Roman
