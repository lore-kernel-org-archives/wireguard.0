Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6BBC25B74
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2024 14:41:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2658b8b9;
	Tue, 21 May 2024 14:36:34 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch [185.203.114.86])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e890c509
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2024 14:36:32 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 9772220CF7;
 Tue, 21 May 2024 16:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1716302191;
 bh=dDAHvImfKI6uudPmQbsvo2gZt8d+srHEXDjlTESBjCI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GRxWPCeCRMLMDnPwOuRCiJ3d2dyb2PM4i29DdDmG5G0Pf5uGIA8U6JI4IQwvvniqj
 QjV8hwOwbSyeEW4H/iBRll5c4JYZnVsoGMWXu+gE9oXvFkLAEzL/58m2LaSIivR3X6
 Z6OZKa0dwdkdlW0lsrtnM6UdJMuJwElCU4YJ0/qdzKvzfyDHKAKtQtxsjL4JdTa3n3
 QDsx9t4zAfRdiTgHnRNeAXmRo6hX1MttwKvsC0TkiJArROPXuNIXq8740FfGmAKmao
 JS7AZ17mfye0dV8HtgHmAD+Amd7XN4L7L9V9JcF0t6Dl2dyzx4j/hZm0IeSlT1gAsr
 wno8KmoyKGw1w==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id C18951A6597C; Tue, 21 May 2024 16:34:04 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Sebastian Hyrvall <sh@keff.org>
Cc: Janne Johansson <icepic.dz@gmail.com>,  Daniel =?utf-8?Q?Gr=C3=B6ber?=
 <dxld@darkboxed.org>,  WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard address binding - how to fix?
In-Reply-To: <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org> (Sebastian
 Hyrvall's message of "Tue, 21 May 2024 21:11:31 +0700")
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
 <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
 <87a5kjgw3j.fsf@ungleich.ch>
 <f292656a-52c8-4258-8b6a-45064a702a8a@keff.org>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 21 May 2024 16:34:04 +0200
Message-ID: <874jarfd43.fsf@ungleich.ch>
MIME-Version: 1.0
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


Hey Sebastian,


Sebastian Hyrvall <sh@keff.org> writes:
> [...]
> Anyway. I've waited for this binding option for years. It's insane to
> me it gets ignored.

I have to second this very strongly.

> One product is for example Mikrotik hardware. They don't want to
> implement third party patches so they are waiting for this bind-patch
> to be included in the kernel. Until then we're forced to use OpenVPN
> in our setups.

As well as this one. As written in the previous mail, virtually every
established networking software out there supports IP address binding,
with the exception of wireguard.

Dear wireguard authors, can be go into the direction of accepting an
already written patch (thanks again Daniel) or if that patch is not
suitable for some reason at least discuss what needs to be changed so
that IP address binding can make its way into wireguard?

BR,

Nico


-- 
Sustainable and modern Infrastructures by ungleich.ch
