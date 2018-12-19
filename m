Return-Path: <SRS0=G6+c=O4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50262C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Dec 2018 12:29:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971AB204FD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Dec 2018 12:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="zjXVXL/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971AB204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46c30536;
	Wed, 19 Dec 2018 12:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff3a35dc
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Dec 2018 12:28:36 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05cfb2d3
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Dec 2018 12:28:35 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id u18so1427611oie.10
 for <wireguard@lists.zx2c4.com>; Wed, 19 Dec 2018 04:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=VP/GG9hRdRLPAGSypKj7d+oC9I7n7qD3IseqGV1PLlk=;
 b=zjXVXL/L4mqpI3LW71Lzz/isAF85lJfmYdROJebbS1jEgMI6MYK/TWzotbXPwQZmYG
 iFCoRVynwZDpHS54Nq6lgduLn93AG62m0Sekw+7nbmvcGiHEOPsoMXtmvOWO/8tVPFkN
 +aspj105Nexrk6Fz0REvjvddXYlGEiOtBqwbkUoOUF9GV7DSif7fn6DK+SGyqKA2yeG5
 4s9bUbHPqmBx6AX4ltSc3meRzYSHyxHvi3RMf3FWLttUjQwQ6XJay1zsmx7EFs5B14g0
 DIbx8MZWGIkNJE4M7JZS7ilVcFSQQ7DmpYEUjSOM7WZ+Z7RmpTnq7qVImpEwcpkmWFii
 1Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VP/GG9hRdRLPAGSypKj7d+oC9I7n7qD3IseqGV1PLlk=;
 b=fPFnn147zPzdSBlXfHyS7HcZpH0WJFxXdL1WxeQ74tPdFSe0wPrya+FOsQT1KAVk8Z
 Jac4jbQevCYwFE3xXqN3DALpGk2BKcuTOUzOejZYUVfihnyaKkOTjdjScDz1hUvZkkpL
 VdKMeBxlrhUtQcxlgevrJIpdaAUMXDOAThDNp46SCAkBc0wQ201J8+afc35bT1r085pY
 PDHA9tq0qMEstgYikXkF/OKGZJLv0UW4UOftHsp209TvS4dV3c998dCmDNke3FxTMSWK
 DlCn+VMgQhfKzGGJhY6pJAoK1cugGnr7bhyNOAGnPNOtvDKsJ/o7oxqNOfQMVTUqtKy0
 kYMA==
X-Gm-Message-State: AA+aEWZ7RLi+0Fvx2mW2s3d85am33AuJiZnyYwgzVS+HIpK/F7e+zqys
 RoCAYPWRoihueXl++DPaNnkLouL1E8fwf6zMAcRvCKoDjMnwcQ==
X-Google-Smtp-Source: AFSGD/VhGLijlZ3ViRtPPkjubAlg/zW0DYNLaAFg39726N9f7VShEqO48/XQBKpcbLwkbbwJazf2YJgSJx93HQQuss0=
X-Received: by 2002:aca:c413:: with SMTP id u19mr926248oif.209.1545222549671; 
 Wed, 19 Dec 2018 04:29:09 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Wed, 19 Dec 2018 07:28:59 -0500
Message-ID: <CAO_nJAZ_qg30m8bEKwXjrrjKh1Y+zVuB3+5+_PgwZdD6DgAQ5A@mail.gmail.com>
Subject: iOS app available in Test Flight is still 0.0.20181104-6
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I see that 0.0.20181104-7 was tagged a few days ago, but the only
0.0.20181104-6 is offered by Test Flight.  Is there something that
needs to be done or is this expected?  Thanks!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
