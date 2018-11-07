Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F0DC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Nov 2018 01:55:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E8E20827
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Nov 2018 01:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="me4jq249"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E8E20827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d1f3a85;
	Wed, 7 Nov 2018 01:51:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8be3d530
 for <wireguard@lists.zx2c4.com>; Wed, 7 Nov 2018 01:51:29 +0000 (UTC)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ddd30b2
 for <wireguard@lists.zx2c4.com>; Wed, 7 Nov 2018 01:51:29 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id s9so8559969vsk.7
 for <wireguard@lists.zx2c4.com>; Tue, 06 Nov 2018 17:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QD/onZ75rCaiSzePLzKZmhkWTaeEiJYPXc0ldvfFo7A=;
 b=me4jq249fjLfkwAWxHO4Z+v3zVVu7qCFlnCGA0ia7g6SQ3fi8EkznPABNlu7Qktv7l
 kmEIpFLMsLaPl4rv4SIwDZwryPesX9GIvT3xMkTdpCA17kjA+OZuH7ChmJvIiyH/ZHPK
 RMLjrBs71ukccLBhQl5b60V4an9jpzqhGlpS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QD/onZ75rCaiSzePLzKZmhkWTaeEiJYPXc0ldvfFo7A=;
 b=VWuGRjvFJSgUtLCUSDgD4mQGDD1/i3vfKL8rHMo2C2ZEAhNSdS0bCSvAZQwn8LEA53
 zWdlGW7Sj017lTrSJu1S/aW+tfFUD/IehktEsb61+xksiIzD85mk86C3W4YrfMdfhi3H
 Q3eimLsogIBh+Lp1tGchzHb2jPA9Z5MCiA9cHCOMQidEwp1JaboTK9HeTHCV/+CTdFIP
 ByvK1b7yXVuVQui1m8yCOc1y0Jo1n6+sbBVkmBRKa5bwFaUOnF/FpVJl/+k0JJpMcaqr
 h3M2w2EnIv/lfTuhXV1Hv0cLgHf1aUO7hKm1xddMaDmicKGSl3ITpXkHrh7tDr5k2mvX
 S3Rw==
X-Gm-Message-State: AGRZ1gKN/nE4TxXXwhBqvx/5Xj/GWIwEUCAz+URIjI8XwJMlZnib0xfK
 waz9fG7M5Jo1Vk3XZKJzAYvi+MacbORGMzzygI2+fA==
X-Google-Smtp-Source: AJdET5cqym/0LVMf2ULtJxlBsgHfbIwEzjf02PIGj4KHpCFQzean7/+ywEY07SVf9dpXUbx8X2X9z8m3k7kPZV6edY8=
X-Received: by 2002:a67:b245:: with SMTP id s5mr9517182vsh.200.1541555752741; 
 Tue, 06 Nov 2018 17:55:52 -0800 (PST)
MIME-Version: 1.0
References: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
In-Reply-To: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Wed, 7 Nov 2018 09:55:40 +0800
Message-ID: <CAKVinOVUNtoVOFiDYk5GmnTyoPUU2e0T_vJ_MzYyBtV5vKOKQA@mail.gmail.com>
Subject: Re: Question about AllowedIPs and proper "mesh" setup
To: lars.francke@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

You could seperate the 2 subnet into two wireguard interfaces, for
example  10.0.0.0/24  in wg0.conf, while 10.0.1.0/24 in wg1.conf
On Wed, Nov 7, 2018 at 3:47 AM Lars Francke <lars.francke@gmail.com> wrote:
>
> Hi,
>
> I've been playing around with WireGuard recently. Thank you for all your work on it.
>
> It all mostly works but I have one thing that I can't grasp properly:
>
> My setup are a bunch of servers that need to communicate securely over an unsecured network. Like a mesh. So I have three servers and each of them has a connection to the other two (i.e. two Peers). This all works beautifully.
>
> Now I want to add an outside client into the mix (e.g. my laptop). I want to be able to connect to just one of those hosts and have that host forward my packages to the others.
>
> I can get it to work if I pick _one_ specific jump host but I haven't managed to set it up in a way that I can connect to any of them.
>
> (I'm leaving out Private & Public Key, Ports and Endpoints to make the examples shorter.
>
> Client wg0.conf:
> [Interface]
> Address = 10.0.1.1
>
> # Server 1
> [Peer]
> AllowedIPs = 10.0.0.1/24
>
>
> Server 1 wg0.conf:
> [Interface]
> Address    = 10.0.0.1
>
> # Client
> [Peer]
> AllowedIPs = 10.0.1.1/32
>
> # Server 2
> [Peer]
> AllowedIPs = 10.0.0.2, __10.0.1.1/32__
>
> # Server 3
> [Peer]
> AllowedIPs = 10.0.0.3, __10.0.1.1/32__
>
>
> Server 2 wg0.conf:
> [Interface]
> Address    = 10.0.0.2
>
> # Client
> [Peer]
> AllowedIPs = 10.0.1.1/32
>
> # Server 1
> [Peer]
> AllowedIPs = 10.0.0.1, __10.0.1.1/32__
>
> # Server 3
> [Peer]
> AllowedIPs = 10.0.0.3, __10.0.1.1/32__
>
>
> Server 3 etc. are similar.
> This way I can connect with my client to any of the Servers and I can ping them (e.g. ping 10.0.0.1) but I can _not_ ping the others: So when I connect to server-1 I can not reach server-2 from my client (IP forwarding etc. is enabled).
>
> This only works when I remove the second IP from AllowedIPs (the one marked with underscores) from the server I connect to (e.g. server 1). The other servers (e.g. server 2 & 3) need it though because of course they'll see traffic from 10.0.1.1 being forwarded to them so it needs to be in their AllowedIPs.
>
> That means I can get everything to work if I pick one special host that Clients connect to.
>
> I might just fundamentally misunderstand how AllowedIPs works. Any help is greatly appreciated
>
>
> An unrelated question: Should wg-quick up be allowed to be called with just a file name?
> e.g. wg-quick up wg0.conf?
> I understand the man page that it should but I think the behavior is broken on MacOS/Darwin because it tries to cd into the file which fails.
>
>
> Cheers,
> Lars
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
