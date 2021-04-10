Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00B8C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 15:59:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3B561042
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 15:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF3B561042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 270b7bb2;
	Sat, 10 Apr 2021 15:59:54 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 47fe47d0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Apr 2021 15:59:52 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 9217B6FD;
 Sat, 10 Apr 2021 15:59:51 +0000 (UTC)
Date: Sat, 10 Apr 2021 20:59:51 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: T-Mobile 4G/5G CGNAT vs WireGuard tunnel jitter
Message-ID: <20210410205951.14f93435@natsu>
In-Reply-To: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
References: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
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

On Sat, 10 Apr 2021 10:27:23 -0500
Lonnie Abelbeck <lists@lonnie.abelbeck.com> wrote:

> I have been testing the T-Mobile Home Internet (4G/5G fixed wireless) service to a Linode VM via WireGuard.
> 
> The TMHI service uses CGNAT plus an additional NAT in their modem/gateway with a MTU of 1420, so WireGuard is configured with a 1340 MTU.

Do they provide IPv6? I see mentions that yes, but with incoming connections
blocked. Might still work for WG.

-- 
With respect,
Roman
