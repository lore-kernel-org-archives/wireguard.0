Return-Path: <SRS0=wF/V=IM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3441FC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 19:35:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE9464EB6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Mar 2021 19:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE9464EB6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ntrv.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddf5067f;
	Sun, 14 Mar 2021 19:35:26 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [161.97.176.84])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 92a90b50
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Mar 2021 19:35:24 +0000 (UTC)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
 by mail-relay.contabo.net (Proxmox) with ESMTP id 067E7100FB0
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 20:35:14 +0100 (CET)
Received: from m14060.contabo.net (m14060.contabo.net [213.136.93.170])
 by mail-relay.contabo.net (Proxmox) with ESMTPS id 8CA9A100FA6
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 20:34:50 +0100 (CET)
Received: from mail-qk1-f174.google.com ([209.85.222.174]:43345)
 by m14060.contabo.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <ch@ntrv.dk>) id 1lLWVg-00057U-0t
 for wireguard@lists.zx2c4.com; Sun, 14 Mar 2021 20:34:50 +0100
Received: by mail-qk1-f174.google.com with SMTP id b130so29721382qkc.10
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 12:34:43 -0700 (PDT)
X-Gm-Message-State: AOAM532X8FN+nvYD1bxTtuRcCRxdQNcMexJ6QyobHUji8Mo+aEw2/Z2z
 XbxjfDJxduykAmQXkJqSsmYdXKf/tOFFLLssQXs=
X-Google-Smtp-Source: ABdhPJzaLPQgub/ZI2pul4IT2Ei6Ycs8rA00C+XNal6dy0MuIO8sjzPjfxS7BpOksSManaOHer3wsjR7pbksUGyV29I=
X-Received: by 2002:a37:596:: with SMTP id 144mr23003465qkf.387.1615750483305; 
 Sun, 14 Mar 2021 12:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <8036163fba8a8c7cdea2af0fcac4eb07@kapsi.fi>
 <4cb69d55-c577-10d4-2692-f6ebaaba5f1d@kapsi.fi>
In-Reply-To: <4cb69d55-c577-10d4-2692-f6ebaaba5f1d@kapsi.fi>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Sun, 14 Mar 2021 20:33:22 +0100
X-Gmail-Original-Message-ID: <CA+cYV6us6diKx8Zg-g5xJnjn3KvvRRRPcOxx0LMV5Wwrhm_wEA@mail.gmail.com>
Message-ID: <CA+cYV6us6diKx8Zg-g5xJnjn3KvvRRRPcOxx0LMV5Wwrhm_wEA@mail.gmail.com>
Subject: Re: Wireguard on EdgeRouter and using specified VRF and/or routing
 table
To: =?UTF-8?Q?Skyler_M=C3=A4ntysaari?= <samip537@kapsi.fi>
Cc: "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Wireguard only creates the interface, as far as I know.

you will need to control the VRF the WG interface belongs to with
external tooling not directly related being e.g. wg-quick. (e.g.
systemd or similar)

On Sun, 14 Mar 2021 at 20:01, Skyler M=C3=A4ntysaari <samip537@kapsi.fi> wr=
ote:
> Could somone help me with this? Last I sent this, I got no replies.
>
> On 27/01/2021 9.45, Skyler M=C3=A4ntysaari wrote:
> > I have a use case where I'm running Bird (BGP daemon) on a EdgeRouter,
> > and then having PTP links via Wireguard for the BGP sessions but I
> > need some help on how to set the wireguard interface to use specified
> > routing table and/or vrf?
> >
> > I want it to use kernel routing table 1 aswell as specific VRF, and I
> > have set the "route-allowed-ips" to false, as I don't want it to
> > generate it's own routing table.
> >
> > For reference: Kernel version is 4.9.79.

--=20
Chriztoffer

