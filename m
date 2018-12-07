Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D14C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 00:59:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEF220989
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 00:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XfqcALxv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCEF220989
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2026e732;
	Fri, 7 Dec 2018 00:50:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c762e68
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 00:50:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1226387
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 00:50:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed3ea48c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=efiX7pdl89/hEoc3hXGGqTOxsvI=; b=XfqcAL
 xva0djVpd2p6681ZrSU+3Ucryti4RdFPlEu0h2+MhW4y+tUdsndSFMP+z47z2Lpu
 1SHm+wrCaRMqNl8YHvbeq/xNDPCCDqlvx8Rrppap2OwgR7oMWNpN2j1UV6uBtPHl
 d3Y5HR7Q1zIjRthPlYre/ydcplGxLHvPvIRBLxeNomgrslL2j73RMTT6er2kV2Zp
 duXg90D/7oLnF/jmw+Y+1oUEuBuk4aFn6hREZNgon4Se7uPZTvTIgkHMg493NPhM
 JnSMlhCJTFYmnY4VHO4YWf+2zI/6zR1KlvPeyqfCMXXMQx5meHGEU5AWl3n3r7ji
 ZGTB5v5NRzKrQq+A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c83e1c89
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 00:50:34 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id t204so2094934oie.7
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 16:58:47 -0800 (PST)
X-Gm-Message-State: AA+aEWbNVkr9beGHSXAzyyBaCSB+7/LRhAacTh6mH5firTsYhs34KR2H
 VeGKJKzeve8KL+RqU/hT+SuTNFwpsWSeG+E2UOI=
X-Google-Smtp-Source: AFSGD/XJecNMXGbMDRMxWX5+mi6BPht51w3AD7nmY/g2fmc4pDKgl3HWxOsH5VADwprOQL6x3XG5iYqdaLBNl34yPmI=
X-Received: by 2002:aca:2c05:: with SMTP id s5mr108133ois.190.1544144327296;
 Thu, 06 Dec 2018 16:58:47 -0800 (PST)
MIME-Version: 1.0
References: <C6A2AF48-EEDF-4257-BF1F-3E28A6A4FB74@icloud.com>
In-Reply-To: <C6A2AF48-EEDF-4257-BF1F-3E28A6A4FB74@icloud.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Dec 2018 01:58:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9qwTYV15cKOZ2MQbTM83j5R-tKYkVdn5MM4v_s2sZqYuQ@mail.gmail.com>
Message-ID: <CAHmME9qwTYV15cKOZ2MQbTM83j5R-tKYkVdn5MM4v_s2sZqYuQ@mail.gmail.com>
Subject: Re: 'Forgotten' interface names
To: rainmakerraw@icloud.com
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

Hi Lee,

Are you sure the interface _ever_ shows azirevpn-uk1 on mac? AFAIK,
utun devices must always be named utun[0-9]+ as enforced by XNU.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
