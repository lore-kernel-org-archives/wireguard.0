Return-Path: <SRS0=QM1B=NM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B0DC4320A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:29:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119DE61222
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 119DE61222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e81a4bfa;
	Sat, 21 Aug 2021 20:23:29 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad4b3b62
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Aug 2021 20:05:29 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bt14so27534358ejb.3
 for <wireguard@lists.zx2c4.com>; Sat, 21 Aug 2021 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3GyDNk+22yGYABWYBxOJ7BkypUK5vEjQva/pskh3+oU=;
 b=XLz1x9JRbS2WJYvHAxEJNwogptGosfgtswp85I0Wa2G4gfeKqqJNENP7KmSBy6FUgU
 385g9J8mpalF8j9zh4zMSwIE77nEr5PA+r115RszT02/p5liQ4UZA2xynQItd3GWDBVd
 TtDIPuIr1AY0LicD6oU/FJ/CBtUUchsNv38RAZ3bOErA9lYUPoMTcP4EovhSw4gkemM0
 CuvvK/3nvzJ9A6LDN8maGe5N3lBlqoTpDaoTqC0bdyypDVxTvDmqWpE9UXTu//5imax/
 jiGhRS5tn2CMEAclH/y+5IOJ6RFolCTHBcU8QDsPMuaazq70ha1AR4kHYiniFN7pVR1B
 7bLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3GyDNk+22yGYABWYBxOJ7BkypUK5vEjQva/pskh3+oU=;
 b=t7HjoNnXvf56srNjCwphN0dkYHijtxSdSTv+VhnU7/c3Q92jEH264neTPVbxdDHyHZ
 q9D3AEiRkkltESS0ioa8q+r6A0aDXM4ldaP06SQDXmewZATDf6wmg5GsCKFa9x+vEEHY
 7rvK6zzmwmgmecaNTge8TIdu78RbQT9kWEQMCf5MJ5wdh6sBK6hNW4S7J/ks1oGmCnsT
 N9dbQYNzxV83MJ+Mrj/1mP5+HaA+RNTi2Sl5Y3GduhBbobhQIW+x73SYZxUhM1QZfrEt
 /oj9Il/WO1CfIcgErDXQyb4NODjncy3l+4rKas5ReyMGkkCgtj7Y/RhdD24s74KGhqQJ
 lzMQ==
X-Gm-Message-State: AOAM531TPPNI2zz8QQZah0LDmvv247xlq5kRpvVXlNeBhSohoet366tB
 hLgNOjFc5+3vCTNzUdqAf8qzn+JLkrdHLXXricI7Fw==
X-Google-Smtp-Source: ABdhPJziBAI0I5bKPBs4Q07s7wFxMksDigs8fmLe29p9RhtlLzP4NHSy/shcn5f7y1FaaZCYuZcMDTGkbA6eSRqfV6U=
X-Received: by 2002:a17:906:89a3:: with SMTP id
 gg35mr28334623ejc.476.1629576329268; 
 Sat, 21 Aug 2021 13:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
In-Reply-To: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
From: Marios Makassikis <mmakassikis@freebox.fr>
Date: Sat, 21 Aug 2021 22:05:19 +0200
Message-ID: <CAF6XXKUjvO2XfehGHjY2qZ_ukHuAQv4+B+1pH-WJ_tqK0n0zzQ@mail.gmail.com>
Subject: Re: Domain as endpoint when using wireguard with network namespaces
To: Waishon <waishon009@gmail.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 21 Aug 2021 20:23:26 +0000
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

On Tue, Aug 17, 2021 at 11:11 PM Waishon <waishon009@gmail.com> wrote:
>
> Hey there,
>
> I'm currently trying to setup a wireguard-tunnel inside a
> network-namespace as descriped in the documentation, which fails when
> using a domain as endpoint:
> https://www.wireguard.com/netns/
>
> First I've created the wireguard interface inside the birth-namespace
> of the host using "ip link add wg0 type wireguard". Then I moved the
> wg0 interface to the newly created network namespace, which doesn't
> have any network interfaces and network connections beside the
> loopback interface.
>
> Then I configured the wg0 interface inside the network namespace using
>     wg set "INTERFACE_NAME" \
>         private-key <SECRET \
>         peer "PEER" \
>         endpoint vpn.example.com:51820 \
>         persistent-keepalive 25 \
>         allowed-ips ::/0
>
> This however results in a "Temporary failure in name resolution:
> `vpn.example.com:51820'. Trying again in 1.00 seconds..." error
> message, which makes sense, because the wireguard-tool tries to call
> getaddrinfo inside the network namespace. The namespace doesn't have
> an internet connection and the lookup fails.
> https://github.com/WireGuard/wireguard-tools/blob/96e42feb3f41e2161141d4958e2637d9dee6f90a/src/config.c#L242
>
> As a user I would expect that the wg-tool does the lookup in the
> birth-namespace of the interface and not inside the newly created
> network namespace.
>
> What is the recommended solution to resolve an domain endpoint when
> using network namespaces and wireguard? Just manually lookup the
> domain in the birth-namespace and use the ip as endpoint? The
> implementation however would be quiete hacky to make it properly work
> with IPv4 and IPv6.

Have you configured a nameserver for your network namespace ?

Normally, that would be /etc/netns/<namespace_name>/resolv.conf (you may
need to create the subdirectory first).
