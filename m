Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BC6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Nov 2021 11:19:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cddc97bd;
	Wed, 24 Nov 2021 11:19:30 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [161.97.176.84])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5f697fda
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Nov 2021 11:19:28 +0000 (UTC)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
 by mail-relay.contabo.net (Proxmox) with ESMTP id E3F00102418
 for <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 12:19:27 +0100 (CET)
Received: from m14060.contaboserver.net (m14060.contabo.net [213.136.93.170])
 by mail-relay.contabo.net (Proxmox) with ESMTPS id 4652B10230C
 for <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 12:19:27 +0100 (CET)
Received: from mail-qv1-f53.google.com ([209.85.219.53]:35626)
 by m14060.contaboserver.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <ch@ntrv.dk>) id 1mpqJD-0003cx-E8
 for wireguard@lists.zx2c4.com; Wed, 24 Nov 2021 12:19:27 +0100
Received: by mail-qv1-f53.google.com with SMTP id g1so1506652qvd.2
 for <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 03:19:25 -0800 (PST)
X-Gm-Message-State: AOAM531a98aztxCde1zYnMnXdYLNrbIFe2RPQAtGOAYvtd66aEVq7iLz
 YIxzhcgMV5XSUV+nNA488zO5O/V7U8uNgHGuOS8=
X-Google-Smtp-Source: ABdhPJxnfPn9N+nF80P7Izb9tgO0HrfT7anmLIy7K2skhSyvoaUYG6PWBiavJAjRZBaebu4c/u8Ktn178ZkS5m/dwbY=
X-Received: by 2002:ad4:5bc6:: with SMTP id t6mr6332190qvt.15.1637752765112;
 Wed, 24 Nov 2021 03:19:25 -0800 (PST)
MIME-Version: 1.0
References: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
In-Reply-To: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Wed, 24 Nov 2021 12:18:46 +0100
X-Gmail-Original-Message-ID: <CA+cYV6s2jMh4z5eUz-AAY5MO9CBpszWZtiUbkWY8XeFw7pLaFg@mail.gmail.com>
Message-ID: <CA+cYV6s2jMh4z5eUz-AAY5MO9CBpszWZtiUbkWY8XeFw7pLaFg@mail.gmail.com>
Subject: Re: Dynamic routes
To: Robert.Dahlem@gmx.net
Cc: "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - m14060.contaboserver.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ntrv.dk
X-Get-Message-Sender-Via: m14060.contaboserver.net: authenticated_id:
 ch@ntrv.dk
X-Authenticated-Sender: m14060.contaboserver.net: ch@ntrv.dk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

On Mon, 22 Nov 2021 at 18:20, Robert Dahlem <Robert.Dahlem@gmx.net> wrote:
> I could always install Quagga or Bird and use OSPF. But that might be a
> bit of an overkill for a simple active/passive failover.

RIP, OSPF, BGP, EIGRP. Either can work. And would IMO be sufficiently
simple to set up and maintain. Either way, you will need a daemon to
maintain monitoring of the packets being able to flow over the tunnel.
If you select a routing demon or another daemon. ... take a pick.

