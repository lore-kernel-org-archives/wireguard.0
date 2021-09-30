Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27EBC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 10:53:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEACB613CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Sep 2021 10:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEACB613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lochnair.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa1a6ca3;
	Thu, 30 Sep 2021 10:53:54 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c6d37399
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Sep 2021 10:53:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2A99932007CF;
 Thu, 30 Sep 2021 06:53:50 -0400 (EDT)
Received: from imap3 ([10.202.2.53])
 by compute1.internal (MEProxy); Thu, 30 Sep 2021 06:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lochnair.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=N+QVyuzic7Nx8S2XgpFMOc8RqpTZgLc
 NZf2EgylvROs=; b=JL7TpLxNqE5byYz3PPWXzXiJvp4dtYP5xGxCUAs2cxJ9Aqk
 JxLGKPri9bOYBC45CY7Pngq2DItM90M8TzInjzNEyBuPZLNNiHSLfcwRe2kIi7kF
 8gnq3DyHecQwIR6TkW+n+4Ujj7ohjuDuw4C1zpqchuFDIKN436EfTo1f6uYkAQPJ
 YisuciBk4ohfI5nW/kEVcAUm45RH2zOE46LT+mow84WlyN8JaVzRdUoUyvQ4UfPZ
 MVcpzTWOvNtCuapWcfNsAz0G+LOObIL6L+vpmPafllJ3fZBdc7+hl1HtEV21ah6+
 9NPGKLknWQy2IvEnSgNbxMAjyqqb9ptZr9Ta6XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N+QVyu
 zic7Nx8S2XgpFMOc8RqpTZgLcNZf2EgylvROs=; b=LZz3jBIh9OjJJj7GoDDsS8
 0a8mj4ipIIAqhKZkZxkN/sr6s+IiWCRfk5jzMCjIFaGnZPcIQ3gUuTuEwFGjJPLC
 EIvGYnBQcPfSWrNFjkkjhlduvdjwYAELgdgkTBhkYimFuWFvYALkC1ipx7btI/WS
 WVXAwte7ZZ3Wj5jUs3CPVqgUTxK2wpE8b/H+cyPxwmzNT9TvXFBOhYmFMfTNV6VL
 AM+nackestkIvGaD6crWmIV/H4iGgJ4hOkZNYPAQDnz1nFoLMscymLEHbhrRHjHo
 Yw0PrSaFfJHyUFfiUxZ7oaItl0oSeq4S9mLZ7SNLxTJvbd3BeqwC8zJRHMLKdkyw
 ==
X-ME-Sender: <xms:PZdVYTtvT7S3dQo-BrGDADUI3pFzK7cDABt8hDcMbIZGHf2dEZxUQA>
 <xme:PZdVYUd6GyCf4EeQdyZmcUyhxaRv25a3wS2b7BmtHA_hgJ96XjSQk6RN731yfVOUw
 lxnHnljMLU_i9-yMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekgedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfpihhl
 shcutehnughrvggrshcuufhvvggvfdcuoehmvgeslhhotghhnhgrihhrrdhnvghtqeenuc
 ggtffrrghtthgvrhhnpeffkeeutedvudeggfduheeuvefftdfhgeevvefgfefhgfduheev
 hfetkefhfedvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehmvgeslhhotghhnhgrihhrrdhnvght
X-ME-Proxy: <xmx:PZdVYWwyY57Pdpx5lZmDdcLrt2EmFCVwOsCiaYypLFyzJW6RQ8iT6g>
 <xmx:PZdVYSPs_Pdx3B4cwfenN8wPCJ0lqrV-uJ8Zna_TVJnOlOqcN7F4EA>
 <xmx:PZdVYT_BXxlhvUItMoIEo76YUDpAxcfplbW4CPqt50qgrMY7XmiOjQ>
 <xmx:PZdVYQIPhGmUd24CzcVJv5u_8BS-oaOzn1vVN1AF3fct-WOrlM2KiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 82B12420089; Thu, 30 Sep 2021 06:53:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1322-g921842b88a-fm-20210929.001-g921842b8
Mime-Version: 1.0
Message-Id: <ac93f873-83fd-43b1-a247-f7df94cf0c36@www.fastmail.com>
In-Reply-To: <0fd0ed22-732c-0ea5-5067-538dc0842869@coppint.com>
References: <0fd0ed22-732c-0ea5-5067-538dc0842869@coppint.com>
Date: Thu, 30 Sep 2021 12:53:29 +0200
From: "Nils Andreas Svee" <me@lochnair.net>
To: "Florent B." <florent@coppint.com>,
 "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: Enable Wireguard only for specific user
Content-Type: text/plain
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

Hi,

What I've had success with is using policy-based routing, selecting the routing table to use based on UID's.
You create a new routing table for the WireGuard VPN and add a rule directing that users traffic to that table.

Using commands you can do this to route traffic from the user with UID 1000 to table 500.
> ip rule add pref 20 uidrange 1000-1000 lookup 500

You can also do this in systemd-networkd if you're using that. Not sure about other network managers.

Best Regards
Nils

On Thu, Sep 30, 2021, at 12:40, Florent B. wrote:
> Hi list,
>
> On a Linux system (Ubuntu), I would like to enable Wireguard VPN only 
> for a single user on my system.
>
> Currently by default, every packet of every user is getting though 
> Wireguard.
>
> How can I do to route packets only for 1 user ?
>
> I think I have to play with packets marking (wg show wg0 fwmark / 
> iptables owner/mark module), I tried some commands but was unable to 
> success.
>
> Can someone help please ?
>
> Thank you.
>
> Florent
