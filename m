Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B53C33CB7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E564B206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=frign.de header.i=@frign.de header.b="IiARLdUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E564B206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frign.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80d54472;
	Thu, 30 Jan 2020 01:53:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09fe993b
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 08:55:17 +0000 (UTC)
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb55c15d
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580288116;
 s=strato-dkim-0002; d=frign.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=vEQmrmw7GTHjwSQhoJi2IWuHrcGljK9Vu3H2w6r2XwQ=;
 b=IiARLdUCE08nRsM+iUz14Idg0RqH1ugB3D672hLr9krvDTDaZSK9iyK4SJJnNQMePQ
 d0jzja8IGKf+Qi+u5gmC7VN2wgVoPoogEMxBu63HJ2hK0TmnvECvwdsDuWYX0gwpoS08
 +9P6VApsDRd7nUXdt75/XgDmhAVsKPUGiYIckF+3n5tbwVJ84WqHjuUC1CTGVG9fvfmY
 ZSh4DdinQvG+dgUoggfqz9MvEcEBa9FyOgJAwSyNI96FSkyqdpiLGAZZMSLdj0hRQBSp
 37py3OELeiUD8o+AuKA3dwP+CS+dpKtcV/OgZ+vITZ5+iCdSHxuyx/7UaonudwGE5tSo
 aPqw==
X-RZG-AUTH: ":KGkSVUa6cvg6QHOypuT/F+/ElAlFppyfIncvHffsptN49ixn09bzt6FCBhBjl7Pt"
X-RZG-CLASS-ID: mo00
Received: from localhost by smtp.strato.de (RZmta 46.1.7 AUTH)
 with ESMTPSA id I0bae5w0T8tFGd1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 09:55:15 +0100 (CET)
Date: Wed, 29 Jan 2020 09:53:59 +0100
From: Laslo Hunhold <dev@frign.de>
To: wireguard@lists.zx2c4.com
Subject: Re: Wireguard is now in Linus' tree
Message-ID: <20200129095359.2fd5da35@frign.de>
In-Reply-To: <20200129002159.GA9104@wolff.to>
References: <20200129002159.GA9104@wolff.to>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
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

On Tue, 28 Jan 2020 18:21:59 -0600
Bruno Wolff III <bruno@wolff.to> wrote:

Dear Bruno,

> Linus pulled in net-next about a half hour ago. So WireGuard is now 
> officially upstream. Yeah!

This is great news! Thanks to all contributors and supporters for the
endurance to pull this through! There is a bright future ahead of us.

With best regards

Laslo Hunhold
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
