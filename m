Return-Path: <SRS0=LOpl=7P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE89C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jun 2020 13:09:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62E0D206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Jun 2020 13:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62E0D206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71ec8853;
	Tue, 2 Jun 2020 12:53:19 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f571208
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jun 2020 12:53:16 +0000 (UTC)
Received: from wireguard.i.bitbit.net ([2a02:c0:2:6:18:59ff:fe38:da0c]:50314
 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1jg6fT-00024O-94; Tue, 02 Jun 2020 15:09:23 +0200
Message-ID: <ebcb261864a63500a357dafc93d39d98b001d132.camel@fud.no>
Subject: Re: [PATCH] wg-quick: add 'reload' command (wrapper for 'wg syncconf')
From: Tore Anderson <tore@fud.no>
To: wireguard@lists.zx2c4.com
Date: Tue, 02 Jun 2020 15:09:22 +0200
In-Reply-To: <20200330084157.51834-1-tore@fud.no>
References: <20200330084157.51834-1-tore@fud.no>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

* Tore Anderson

> Also add an ExecReload statement that uses this in the systemd template unit.

Hello maintainers,

I hate to nag, but considering this patch was posted over two months
ago now and has yet to receive any feedback from any maintainer - good
or bad - I am starting to suspect it has been forgotten about. Has it?

If there are outstanding issues with the patch that needs to be
resolved before it can be merged, please let me know what those are and
I will try to post a PATCH v2.

Tore

