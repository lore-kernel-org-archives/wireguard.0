Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA9DC28CF5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Jan 2022 18:28:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cc1891a8;
	Wed, 26 Jan 2022 18:26:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4de9deb4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jan 2022 18:26:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 983EE61160
 for <wireguard@lists.zx2c4.com>; Wed, 26 Jan 2022 18:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71FFC340E9
 for <wireguard@lists.zx2c4.com>; Wed, 26 Jan 2022 18:25:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="guwHM09U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1643221556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WDMVnxNS21cGVD8nGRsutmIDXekx0ccsYpa+g97zd4=;
 b=guwHM09UGxkbtIjKxJuTxbz5WRegcFmdXkthx3Kquu3AutQOUfKoosZlxsg0aUz6+QHkiQ
 d5guRsaXwTIJe7dEw/L0+KvEdwY+eQyEHiOMoDwbA8ZFeOHiMYFLbdgBYhM7aZzdk9hv7z
 P5GE7tvqxC2dAYMYSsPdpExRfcIlHTU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 641c4e10
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Jan 2022 18:25:56 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id g14so1330228ybs.8
 for <wireguard@lists.zx2c4.com>; Wed, 26 Jan 2022 10:25:56 -0800 (PST)
X-Gm-Message-State: AOAM531HZdEc38PS2f9oKy5iLv9tnLyHRJXvw2fAbTD0bhk/zw9Rl9Nr
 LWMEDNxO9ga+UdhpVsthattFkzyehJfyb2/EmW0=
X-Google-Smtp-Source: ABdhPJznJle+/aHB3bAIPcGEfCgZBRsL4kWAYAQEdSSWWiEQMqut0MwDffIpWxfnjd8pl3DppxysHP7G5uVVjsYs1BA=
X-Received: by 2002:a05:6902:1501:: with SMTP id
 q1mr299542ybu.638.1643221555486; 
 Wed, 26 Jan 2022 10:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20220119082857.64215-1-michal.murin@jamf.com>
In-Reply-To: <20220119082857.64215-1-michal.murin@jamf.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 Jan 2022 19:25:44 +0100
X-Gmail-Original-Message-ID: <CAHmME9oQ_SiXW-DG4HAm0k0GH17m0210U1Rb6Syuief98+w4kQ@mail.gmail.com>
Message-ID: <CAHmME9oQ_SiXW-DG4HAm0k0GH17m0210U1Rb6Syuief98+w4kQ@mail.gmail.com>
Subject: Re: [PATCH] Fixed the failing BadConfigExceptionTest unit test
To: Michal Murin <michal.murin@jamf.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jan 25, 2022 at 5:12 PM Michal Murin <michal.murin@jamf.com> wrote:
> Also removed the `getParsingClass()` condition from the `parseDnsServers()` method as the condition can be never met - the `InetAddresses.parse(dnsServer)` method always throws the `ParseException` with the `parsingClass` set to `InetAddress.class`.

Until one day it doesn't, and then we have to remember this subtle
behavior. On the contrary, what's there now means that the code is
correct regardless of changes.

> -                        if (e.getParsingClass() != InetAddress.class || !InetAddresses.isHostname(dnsServer))
> +                        if (!InetAddresses.isHostname(dnsServer))

Please drop this snippet from v2.

As Harsh said, we need your sign off line. It would also be
appreciated if you'd wrap your commit message and adjust your commit
subject to match what the project uses conventionally.

Thanks,
Jason
