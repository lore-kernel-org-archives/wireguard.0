Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33C3C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 17:23:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5DC664F94
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 17:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5DC664F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vlaicu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a85f231d;
	Sun, 7 Mar 2021 17:20:54 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bb7ebbb5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Mar 2021 19:13:17 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id b5so5171924ilq.10
 for <wireguard@lists.zx2c4.com>; Sat, 06 Mar 2021 11:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vlaicu-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ccy315KIMnbM/ObWmun7C8mldbgHoRaHkMJfxSa+JiM=;
 b=kchEnJ+qqRvcJ4UL0JCf04z/YMoUhVGeCA3gaJUui61H2A7Mpv1DilAHE8J5Ecm1mi
 VXOhKoWHxOKMTKastjcJ7y8Nh/z0vsetdGW1dswgm+Gg/JYH7IaaCt1hencYnaQV78xR
 UnUh53jf+TLbqQ6oz1Lfy1eOgPGNQFKo24ervaxnQKewoYhoMV4APolehaocy6qDyPw6
 cMV35UD3Jz7eo5B/C8rRN//dIM/eMbHWQ7bZK7e0mqCMi987LV29LFAyr0cndfah6ev6
 3Mf/f6p2qx1wOswPel3v7kktBKzERifQ1y2MgUe5lJXTqqEom7/5DQTIWBWs9BLXiccy
 99RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ccy315KIMnbM/ObWmun7C8mldbgHoRaHkMJfxSa+JiM=;
 b=MCti0CwTGUkANhMqfbIxGG/HEALHmNnxd6VF6esO9cIrcxmRGr/TI72ph295oVtvaX
 0gwDpPVdT+h/PlIIJflsX5JGJx/3uG4g2mwF224MfSydd4EbZgE/gF3i8ymK4CGdssfp
 /SbuT45DUZkRSehWLZ6ccRWB42ZIZOm2O55/eKpuj5ek+gaRfUTsp9CFqqJUCgHB8QTV
 PDGDTf+yrXPP8M8+DN7gub41Dw01AkbG7OWBDeRdTrrN9ie33hm+DqSgPlse8JxwJwsq
 xUDiXvX1cNhOqMbNsHAoyMNV6s2Fl22ES4TPVsvz5IDGbXsRpe1l4d8etEI/iCS+LTkH
 05RQ==
X-Gm-Message-State: AOAM530xlNM8LJ8ZeaAdvtEmYAh8xyz+PIh9bXRGxjnhvJuwBz0hjjHQ
 gcLmTVchPOfv4YgYOr8kkVE3bG1rLlvS8OKT9UaBi6JXKbw=
X-Google-Smtp-Source: ABdhPJyzDOayxDTB9Shn8Me9XHfU2LBiM0C2ea1OWgOSkSsUL1MLdlhru7JFEN5QuxYXwSl+Pv1YdFG0UNv+/7071XM=
X-Received: by 2002:a05:6e02:2199:: with SMTP id
 j25mr14036894ila.18.1615057995759; 
 Sat, 06 Mar 2021 11:13:15 -0800 (PST)
MIME-Version: 1.0
From: Florin Vlaicu <florin@vlaicu.com>
Date: Sat, 6 Mar 2021 21:12:40 +0200
Message-ID: <CAGpywxMdXntKVgEi45zXHGGmnHXeBk4Tiy-c4CkXOF4e9_Oz1w@mail.gmail.com>
Subject: Routing issue
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 07 Mar 2021 17:20:53 +0000
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

I am running a server in a container that uses a macvlan interface to
have a static IP address in my local LAN. Then from my router I DNAT
to that IP address.
If I stop the container and then start it on another host (with the
exact same configuration) existing tunnels will fail, but new ones
will work.
If I just restart the container (or even reboot the host) the existing
tunnels will come back up.
Is there something I can change on the clients to not have to restart
the tunnel?

Thanks,
Florin
