Return-Path: <SRS0=PRBc=47=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68158C0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 18:16:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F78820751
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 18:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="WzSKmT4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F78820751
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3938f72a;
	Sat, 14 Mar 2020 18:10:21 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [2001:67c:2050::465:201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f65f47d6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 18:10:18 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 48frNT2GztzQlD6;
 Sat, 14 Mar 2020 19:16:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1584209767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fuc98eI0hbN55zNLqDwOll0XX+RRj7MdsH73NKgvDEg=;
 b=WzSKmT4rvzbGzBomjEsCF0+wxk4ka8UTjG/ulBaZe0uoK1WsqUS0j9+n0yVNBK4KTwB7Wn
 LPMhkPy2bsb+Im1PBqHLQZtz0V4dMjedReI33iPDXuLOGdERIBREO4PYjD0FZyPrUDWmEx
 ZnggjWWdgGIVTziG4zwWtvOhQJnf+/BbcGjvgJceukmZBzhluVeBnJpz2UtuMVyuP81osy
 eNrt485HVN9PamPe5cXARDdZc1aOSgYkjvSDgssWrLROv7VpqXghyoiXDdWCzfcmP6xEa5
 kNmU4Qj415Pl846DmGN0/4hTUk7BnkR2STTV/Xn5tU/v4iBcRtVqyOcA5dfZRA==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id 6FlX98PZlAfN; Sat, 14 Mar 2020 19:16:06 +0100 (CET)
Date: Sat, 14 Mar 2020 18:16:05 +0000
From: Luis Ressel <aranea@aixah.de>
To: Germano Massullo <germano.massullo@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WireGuard connecting hosts WAN->LAN
Message-ID: <20200314181605.6oh5e3inrvjeb7yl@vega>
Mail-Followup-To: Germano Massullo <germano.massullo@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <c3b5c2e5-d77b-1984-107d-6f6a56b67f84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b5c2e5-d77b-1984-107d-6f6a56b67f84@gmail.com>
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

On Sat, Mar 14, 2020 at 04:33:44PM +0100, Germano Massullo wrote:
> I want to:
> 1) connect A to C passing through B. I don't want to expose C to
> internet at all, (so no things like port forwarding)
> 2) A must have C public key (and viceversa), so in case of B being
> compromised, the A<->C VPN will not be compromised.

The answer you quoted is correct. If you don't wish to set up port
forwarding, and C is thus not accessible from the internet at all, A
can't establish a tunnel with it.

You may want to consider setting up two tunnels on A:
* wg0 with B as the peer
* wg1 with C as the peer
and then route the encrypted packets of wg1 through wg0. The
disadvantage of this is that you're encrypting every packet twice, which
hurts performance and lowers the tunnel MTU.

Cheers,
Luis
