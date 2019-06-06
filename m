Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23683C28D1E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 11:27:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9AB20868
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 11:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="PBeTegBz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="poBwYqtK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9AB20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4d1f2e0;
	Thu, 6 Jun 2019 11:27:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 721cfc60
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 11:27:26 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75a207af
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 11:27:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 19A4D22033;
 Thu,  6 Jun 2019 07:27:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 06 Jun 2019 07:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=DF9gkey2Y7I20PO1m4lKHE8Cu3B
 mIf89BpbNzU1RURU=; b=PBeTegBz13R78TJbpsZRDHVZw8xZPzgMxxyY/KsjERA
 /OTPF2voxLI2JbWHHd+JZmYtp7AxmPOBILX5tthwZ3lZjjFMaR4nYvRwmLZjZZKX
 3wsqMJSIoZoCNMSZJn2pWb/fl8rYItKcAO7Jr/rSx1p4XDx7nUKjw2b04YaqDsrR
 5MfiGquNIGSjkJGn62xu98vbgwOiO1XVCnshgCM3FjZQQszBNfedN94DzKqPTiX4
 9wN/9B+Bo5zroax0nwZmkfNJjBQd5BWVEO9Aakwd1wxlViilCmHb0+uZmspr1sNW
 E4LWTv8o7duPuFIHO3uk7ux9bJDbxPQ1eY07b3bWNZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DF9gke
 y2Y7I20PO1m4lKHE8Cu3BmIf89BpbNzU1RURU=; b=poBwYqtKM4G8sPKBm7kamf
 Y1TyZmN/ALASni4g8xxpdNweJTf8uRVFKp2bQFeXjLZLy6NgZp8WKR7PogDsy0mS
 Rl38RWFhvf4eNLtBFBOoqG20uHt+BhS4DyZALOaR0V/YV/lfdsm87qFumOfl5O3O
 th1BjuKmWhi+7/hc4kuvgn6StxG3/gZvtu7DCv8fgTeqCBAim+kGGkMWse5dpPvq
 qj14GdbpUplgrJ+tMxrokxCSz3weoolKdPr6Hh6Lkvn602w3jc1nJiRSIiG2dh/g
 m4sIWeG2v0rtoiHzt7yc7FPDYv2vci57y13zclbOVegnOdkXrHK81YtvHJFrLlFA
 ==
X-ME-Sender: <xms:nfj4XDOxNfxNceVs8rxEd_kExHeMV4dD5FAVtnXsWgQBzaPNm24PHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
 dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:nfj4XMcx_nTfJjGAcr7sWgln-iqr6c6227cXpQXZNdyIgVcOfS9CuQ>
 <xmx:nfj4XKrxXQ_t9yXg62924zjQiItLq-oyuysLsEYY4aq99rBpwItTyA>
 <xmx:nfj4XJi1GYZJAKpSwXyviwxKg_xS1NZlxlgNvQs1M-9U0CzmK4U6Lw>
 <xmx:nvj4XMFfsHdjsVXEPzqqxbJDFtzuRCmc07KBHPX_ccovEA0YT-DEFg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59B018005A;
 Thu,  6 Jun 2019 07:27:25 -0400 (EDT)
Date: Thu, 6 Jun 2019 13:27:23 +0200
From: Greg KH <greg@kroah.com>
To: bhashkar prakash Singh <singh.bhashkar@gmail.com>
Subject: Re: Wiregaurd integration to private project
Message-ID: <20190606112723.GA4825@kroah.com>
References: <CACX7Ny6=bmREXiq6x25s-MA=eAiV4P554=7gNn6CTPR76OAirg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACX7Ny6=bmREXiq6x25s-MA=eAiV4P554=7gNn6CTPR76OAirg@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Apr 17, 2019 at 01:02:36PM +0530, bhashkar prakash Singh wrote:
> Hi,
> 
> I want to integrate Wireguard to my confidential project. I see Wireguard
> source code is under GPLv2, if I add any patch to Wiregaurd source code to
> work with my confidentail project, do I need to publish complete source
> code along with my project source code ?

Please consult with your lawyers, they will know the answer to this
question.  If you do not have a lawyer, then just release the code to
all of your project to be safe, as obviously there is no assets involved
:)

Good luck!

greg k-h
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
