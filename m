Return-Path: <SRS0=2990=I5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E24C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 31 Mar 2021 15:43:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCFA2601FB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 31 Mar 2021 15:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCFA2601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ntrv.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3916282;
	Wed, 31 Mar 2021 15:43:15 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [161.97.176.84])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6a8eb6b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Mar 2021 11:55:17 +0000 (UTC)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
 by mail-relay.contabo.net (Proxmox) with ESMTP id 2D672100FDA
 for <wireguard@lists.zx2c4.com>; Tue, 30 Mar 2021 13:55:12 +0200 (CEST)
Received: from m14060.contabo.net (m14060.contabo.net [213.136.93.170])
 by mail-relay.contabo.net (Proxmox) with ESMTPS id 65CCF100FD1
 for <wireguard@lists.zx2c4.com>; Tue, 30 Mar 2021 13:55:08 +0200 (CEST)
Received: from mail-qk1-f176.google.com ([209.85.222.176]:36646)
 by m14060.contabo.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <ch@ntrv.dk>) id 1lRCxf-0002Ew-4W
 for wireguard@lists.zx2c4.com; Tue, 30 Mar 2021 13:55:08 +0200
Received: by mail-qk1-f176.google.com with SMTP id c4so15516616qkg.3
 for <wireguard@lists.zx2c4.com>; Tue, 30 Mar 2021 04:55:07 -0700 (PDT)
X-Gm-Message-State: AOAM533tIn5U+ZKlfJlzaza3ntXw3NUHSX6KI4Wh2s27wBvpYcWaO7Ws
 JiTQJmRwnvLUQSnDFjqBFdStB6j9wNy5WsGfpm0=
X-Google-Smtp-Source: ABdhPJxdyY4VzAun5m8Bd16O3LY2CcrRACmqr9wS44QjYUJFwHfgmwPOinVyOY0DKLWs+A+aqtmEbvjYfnF6/Rtv0us=
X-Received: by 2002:a37:596:: with SMTP id 144mr30983965qkf.387.1617105301472; 
 Tue, 30 Mar 2021 04:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <93213ae2-3ad1-7f8a-1e21-57f672738e18@babioch.de>
In-Reply-To: <93213ae2-3ad1-7f8a-1e21-57f672738e18@babioch.de>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Tue, 30 Mar 2021 13:53:34 +0200
X-Gmail-Original-Message-ID: <CA+cYV6tQA=PkSsJkAKQ199q8qv74s1y_En4gBYwZiu9bHuwu_A@mail.gmail.com>
Message-ID: <CA+cYV6tQA=PkSsJkAKQ199q8qv74s1y_En4gBYwZiu9bHuwu_A@mail.gmail.com>
Subject: Re: Best strategy for multiple point-to-point tunnels
To: Karol Babioch <karol@babioch.de>
Cc: "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - m14060.contabo.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ntrv.dk
X-Get-Message-Sender-Via: m14060.contabo.net: authenticated_id: ch@ntrv.dk
X-Authenticated-Sender: m14060.contabo.net: ch@ntrv.dk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 31 Mar 2021 15:43:14 +0000
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

On Thu, 25 Mar 2021 at 23:35, Karol Babioch <karol@babioch.de> wrote:
> What is your recommendation on handling multiple peer-to-peer tunnels?
> Should I go for multiple interfaces or for one interface with multiple
> peers?

If you plan to do L3 routing over the P2P tunnels (e.g.
OSPF/BGP/EIGRP/Babel/etc.). A dedicated wg interface per remote
endpoint is generally recommended.

-- 
Chriztoffer

