Return-Path: <SRS0=q2lx=MG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D32C12002
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jul 2021 22:10:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F03360FF1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jul 2021 22:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F03360FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54079379;
	Wed, 14 Jul 2021 22:10:02 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d1cd1056
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jul 2021 22:10:00 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E0DE35C0121
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jul 2021 18:09:58 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute2.internal (MEProxy); Wed, 14 Jul 2021 18:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=CFh05AcV905r4AwCqy0CPYzMV6xpg1q
 VpUeTHwLjjOw=; b=o8paAxev17J+xY67gSmQw//IKGV0CnzAjySvC5MK0DTfdpx
 KHKgtjow4FW/qz0co1XZyQBUTIyrCxCzwv+mjv4ths+h3ZNuyJ3ca0eltbJL3yG7
 QqG7EImWIf7TLEx4Vj860fOK3IA4WGPPT1AjEv8KC2xU47+39+kdPa0Q6prpb+3M
 5p3Gf8ELqKSvBuJZkt7NtfkLFtLV0jT4aBc6TEQz++idCgJNx3TOd+XI/GnElhiL
 F+XwPafuRNLWFuraFFSaHTNWjmyToKDTp5onjXi7ct5KXaVkvwX1k7YZ1iZW7R4+
 6hp+czD8Ulr9nQRLMLsrI5S1D5a3t6RS49rU2hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CFh05A
 cV905r4AwCqy0CPYzMV6xpg1qVpUeTHwLjjOw=; b=jRD9cDGQHE8hDsHDHhKNLf
 r7eTQm2w/T9qTnbjOOSS5lfRx+0ib98TuD5OFlUPQcCst4iP9iKgQUFhzDQXBecU
 6ngMybnInS1acAxqd8cFJAauYQ/QFROkLCpsLEJwSAHP37mFXK5+fQjjDRgj5Hz4
 3SVtzjOx5q+9E6vdNQIYglRAtoO7er2UkGzf5sexbt8T7fdoSWrmDBfRf6Diz+hT
 MEgnQkj/iCkBCPdwUSjfcMrWjdYNGL/QATed613gvgINF4LQwBNvX8O0knb31jqX
 e72FJspIpItSjc/AWG41d6FFileFWVUC5keJmAd9r6A4OahAbeLFmoQKDBDhxw8g
 ==
X-ME-Sender: <xms:tmDvYFxMhawrMU-_YtEsv-oxNWgwaC5J3j4b-Y4YAP-gsOghnupvJQ>
 <xme:tmDvYFRHIqwx8pSpuvOYP9b_eesxhEKbm6iBt5YLaeP-kWZGlyIZxYzU-3B5TIeZx
 sY8f_MQ5AXVGrcocw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdfgrhhitgcunfhighhhthdfuceovghrihgtsegvrhhitghl
 ihhghhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeevudeutdevleeiveehheejleelud
 egffdvkeeghfehkeehfeevhfdthfduleehueenucffohhmrghinhepshgvnhhtvghntgdr
 vghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvg
 hrihgtsegvrhhitghlihhghhhtrdgtohhm
X-ME-Proxy: <xmx:tmDvYPUufqezzGiYDRU6mRzfTYrZlyV8XjwrxbcopelCD5FdUkBBiQ>
 <xmx:tmDvYHiIqbP1fQ6t9EOmonbmDEfMt6nOFkFHOCJm2_b2hsNNBHnGsg>
 <xmx:tmDvYHCvruoMQlTJv6oVxWQhkuh_O5gDjqzndtdY7Na4ZimYz-DvGA>
 <xmx:tmDvYKM6dmcPPw_S5EBBg6SvhG1ceQ_R7Wrin-qOUk3qjkxcEU6aag>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 424573607C4; Wed, 14 Jul 2021 18:09:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-533-gf73e617b8a-fm-20210712.002-gf73e617b
Mime-Version: 1.0
Message-Id: <d994accd-d1a9-4f9a-bbf9-d6b99036b177@www.fastmail.com>
In-Reply-To: <e8e94195-b1f0-df62-4393-929f20f762a3@spam-free.eu>
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
 <e8e94195-b1f0-df62-4393-929f20f762a3@spam-free.eu>
Date: Thu, 15 Jul 2021 10:09:36 +1200
From: "Eric Light" <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Android: more than one tunnel
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

Hi Chris!

I don't have any experience with the Android implementation specifically... but most likely, your two tunnels have overlapping AllowedIPs ranges.  When this happens, bringing up the second interface will override the routing created by the first interface.

Most commonly, this happens when someone configures both interfaces with AllowedIPs = 0.0.0.0/0.  To fix this problem, make sure there's no overlap of AllowedIPs in your tunnel definitions.

I hope this helps  :)

(my apologies if the problem is something Android-specific that I don't know about)

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Wed, 14 Jul 2021, at 17:49, Chris wrote:
> I have two distinct tunnels defined on Android.
> However, I can only toggle between the two. I cannot have both activated at the 
> same time.
> I need both connections.
> Am I missing anything?
> Why not several tunnels with several wg servers???
> Why is this being prevented?
> 
> BR
> Chris
> 
> 
