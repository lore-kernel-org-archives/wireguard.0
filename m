Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DDFC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 07:32:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8E32462E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 07:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8E32462E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 573bc649;
	Wed, 18 Nov 2020 07:27:36 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 02833df2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 07:27:33 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 0D967596;
 Wed, 18 Nov 2020 07:32:13 +0000 (UTC)
Date: Wed, 18 Nov 2020 12:32:13 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Marco Davids (SIDN)" <marco.davids@sidn.nl>
Cc: wireguard@lists.zx2c4.com
Subject: Re: OSX and Happy Eyeballs
Message-ID: <20201118123213.227694ac@natsu>
In-Reply-To: <92cb652f-b818-7224-f004-c324af5e7956@sidn.nl>
References: <92cb652f-b818-7224-f004-c324af5e7956@sidn.nl>
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

On Tue, 17 Nov 2020 13:00:01 +0100
"Marco Davids (SIDN)" <marco.davids@sidn.nl> wrote:

> Hello,
> 
> We have a Wireguard VPN and everything is working fine.
> 
> There is just one little thing: IPv6 Happy Eyeballs.
> 
> Without the VPN enabled, happy eyeballs works fine. The AAAA (IPv6) is 
> preferred over A (IPv4). But as soon as we enable the tunnel, it's the 
> other way around.
> 
> IPv6-only sites are perfectly reachable, but dual-stack sites are always 
> reached over IPv4.
> 
> It is not a showstopper, but I am just trying to understand why this is.
> 
> Anyone with the same experience and more knowledge about the inner 
> workings of Wireguard and Apple's happy eyeballs implementation that 
> would care to comment?

Do you use ULA IPs (fc00::/7) for the tunnel endpoints? Those are always
depreferred compared to IPv4. See RFC 6724:

https://tools.ietf.org/html/rfc6724#section-2.1

-- 
With respect,
Roman
