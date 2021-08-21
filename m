Return-Path: <SRS0=QM1B=NM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E189C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:16:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D54461051
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D54461051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cde4bc2a;
	Sat, 21 Aug 2021 20:15:04 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc4851ef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Aug 2021 20:14:59 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 7so11744387pfl.10
 for <wireguard@lists.zx2c4.com>; Sat, 21 Aug 2021 13:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FOMC0U1kUaMGtMP3GNxKYvzqKaAwCPHrh1HnTUZd9FM=;
 b=R3V0HXmRO5tYebn2Nq+TCg/niXbh1k1m9E4CIhtvVfAhDXV3SiwAdJCn0YKf8N0gs6
 tfRH3Wur7G29NzDNvc1dDAVT2GkuH0gwsDFZl6cmrwjGBbkoDktvRM6dM/0F1+xBDt3F
 gFuEkLzDSzBT8XF4xTlhZkPOK2ZT+4ru9APZvbPS40vBTlqEtVnxICzsj5FEh3hvP4T8
 En86YtaQ4YMFxKYwi6gybdqt9Ack/1PbMlYPLI8F8BRBSzALNg20p9IWnd6BsKDvcKH0
 gYdEl456S5DnMVqo1Cfc6dFAWJAj2fx4jLBagt+iAlfk+72anhAIQuB6Jm/cq0LtRjq1
 9bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FOMC0U1kUaMGtMP3GNxKYvzqKaAwCPHrh1HnTUZd9FM=;
 b=dTH3KdBS2LMbf6qGflPuVrnVXvQ1liUGoyIIVBgM8aUOMc6UPakHvGbhzJ3rDdbtrc
 8OWDHMVlUAl8MXXHOnPT3Axzg7IgfDd573FFCywxRO2GvJF515GbgciW3UTsUXO8KoyC
 mWrrN/I4lGvOINNbcddUADcMzAtt1MzAztZLrF0PELeIx/PkdNZapx3oxpX8ywVto3Hu
 YxsFaLuUL6NQX9rtg11xuQIYJ9xVFG+aQkDOGmowzGWVwVRd+xQ44ZAMlS1F8oX5Qy5b
 FOS8l3yeAHmjFDO9/0THzDL0ywV98vvlldOnQTvfWI5BKw9mSSQMM92Lf3Yxpttlcr49
 qbXg==
X-Gm-Message-State: AOAM532I1yah/2A40V8M8mAmCA//cPyvJ0CxL6FuRvBmlltZtnKycsKw
 xbn6Ijqicd0ugK5HwghbHVsp4XRCt6dN/0Dtcgo=
X-Google-Smtp-Source: ABdhPJyE8hYkVJ8KEjyRBKU07SokYJYYeiz5JNRjbYR7YqO9BHtrDvcpCz4aeHD5OH9h5aZmplikayoAPHbgq8U/aec=
X-Received: by 2002:a05:6a00:1784:b0:3e1:388:9ff9 with SMTP id
 s4-20020a056a00178400b003e103889ff9mr26139247pfg.40.1629576897973; Sat, 21
 Aug 2021 13:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANO0tfaBiU3r+bvBp5q57EBc4FNu0+FJ78_7G=vPzdJvuTi18g@mail.gmail.com>
 <CAF6XXKUjvO2XfehGHjY2qZ_ukHuAQv4+B+1pH-WJ_tqK0n0zzQ@mail.gmail.com>
In-Reply-To: <CAF6XXKUjvO2XfehGHjY2qZ_ukHuAQv4+B+1pH-WJ_tqK0n0zzQ@mail.gmail.com>
From: Waishon <waishon009@gmail.com>
Date: Sat, 21 Aug 2021 22:14:45 +0200
Message-ID: <CANO0tfbSu+goJoGCQHygfryQjHkzDw3tte12sv1aVz=LFMKSOw@mail.gmail.com>
Subject: Re: Domain as endpoint when using wireguard with network namespaces
To: Marios Makassikis <mmakassikis@freebox.fr>
Cc: wireguard@lists.zx2c4.com
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

Yes I did,

as described this isn't the problem. How should WireGuard resolve the
domain using the DNS server set inside the container, when it doesn't
have an internet connection?

Kind regards


Am Sa., 21. Aug. 2021 um 22:05 Uhr schrieb Marios Makassikis
<mmakassikis@freebox.fr>:
>
> On Tue, Aug 17, 2021 at 11:11 PM Waishon <waishon009@gmail.com> wrote:
> >
> > Hey there,
> >
> > I'm currently trying to setup a wireguard-tunnel inside a
> > network-namespace as descriped in the documentation, which fails when
> > using a domain as endpoint:
> > https://www.wireguard.com/netns/
> >
> > First I've created the wireguard interface inside the birth-namespace
> > of the host using "ip link add wg0 type wireguard". Then I moved the
> > wg0 interface to the newly created network namespace, which doesn't
> > have any network interfaces and network connections beside the
> > loopback interface.
> >
> > Then I configured the wg0 interface inside the network namespace using
> >     wg set "INTERFACE_NAME" \
> >         private-key <SECRET \
> >         peer "PEER" \
> >         endpoint vpn.example.com:51820 \
> >         persistent-keepalive 25 \
> >         allowed-ips ::/0
> >
> > This however results in a "Temporary failure in name resolution:
> > `vpn.example.com:51820'. Trying again in 1.00 seconds..." error
> > message, which makes sense, because the wireguard-tool tries to call
> > getaddrinfo inside the network namespace. The namespace doesn't have
> > an internet connection and the lookup fails.
> > https://github.com/WireGuard/wireguard-tools/blob/96e42feb3f41e2161141d4958e2637d9dee6f90a/src/config.c#L242
> >
> > As a user I would expect that the wg-tool does the lookup in the
> > birth-namespace of the interface and not inside the newly created
> > network namespace.
> >
> > What is the recommended solution to resolve an domain endpoint when
> > using network namespaces and wireguard? Just manually lookup the
> > domain in the birth-namespace and use the ip as endpoint? The
> > implementation however would be quiete hacky to make it properly work
> > with IPv4 and IPv6.
>
> Have you configured a nameserver for your network namespace ?
>
> Normally, that would be /etc/netns/<namespace_name>/resolv.conf (you may
> need to create the subdirectory first).
