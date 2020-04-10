Return-Path: <SRS0=O5R5=52=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D97C2BA2B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Apr 2020 07:40:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF56020787
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Apr 2020 07:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="1MsEmn6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF56020787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4dd7da2;
	Fri, 10 Apr 2020 07:30:53 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9fd98a85
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2020 07:30:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 48z9056dMBzQlCW;
 Fri, 10 Apr 2020 09:40:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1586504404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXNG+fmUhglyxTVJEXF3pb8d9H6s1vZra6TdKBFOxIM=;
 b=1MsEmn6wUfdQoZJY1Vioq68aBc5x4nyS+y3RcVyVIiqSN0WYNQKc9jKtPqR16AR4v/xe+7
 LWoK8jrmtDYiBkvg8b9KrzkOK10y9aAY3BL4juBhSlmfz2xOVY/xpPmFxsPH5qa9Eh6R6I
 /rkd/8j607J0qMAxkN70/75Ptc5NBUH/EoNTBWJf48k7F4KZDilk2tNfljehqp/5R1SqQ6
 4AYe+KxKCZ8JUtqBbgT2zK2Z0K/w7u7gQ9s8d24WqF51kIviaYiOaRsjaqGWAv35v/o5e/
 D9ynwOLs8GQoz7L01M5g5QIvuMjEjRI/P7jmeR+w3P7oOBq15nxcd4NZzNh1iw==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id CtyHrHCeH2ub; Fri, 10 Apr 2020 09:39:57 +0200 (CEST)
Date: Fri, 10 Apr 2020 07:39:55 +0000
From: Luis Ressel <aranea@aixah.de>
To: vrein@tuta.io
Cc: Wireguard <wireguard@lists.zx2c4.com>
Subject: Re: [PROPOSAL] wg-quick ip rule priority
Message-ID: <20200410073955.i3epess3yd4uximo@vega>
Mail-Followup-To: vrein@tuta.io, Wireguard <wireguard@lists.zx2c4.com>
References: <M4APSeK--3-2@tuta.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <M4APSeK--3-2@tuta.io>
X-Rspamd-Queue-Id: B37AA1742
X-Rspamd-Score: -4.70 / 15.00 / 15.00
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

On Sun, Apr 05, 2020 at 07:37:18PM +0200, vrein@tuta.io wrote:
> Hi everyone!
> I have some tiny proposal for wg-quick utility: adding priority for iproute2 routing rules
> 
> For linux.bash this should be as easy as this:
> https://gitea.tort.icu/vrein/wireguard-tools/commit/0947dc76770a5d81ba39340ebe9189b80a92584c

While I don't think it'd be a bad idea to support configurable rule
priorities if they're useful to someone, they shouldn't be neccessary
for the use case you described -- you can avoid the separate routing
rules for wg1 altogether.

All you should need to do is to add "FwMark = 51820" (or some other
arbitrary value, as long as it's identical for both wg tunnels) to the
config files of both wg interfaces. Then you end up with these ip rules
(taken from your post rather than an actual test):

0:      from all lookup local
32764:  from all lookup main suppress_prefixlength 0
32765:  not from all fwmark 0xca6c lookup 51820
32766:  from all lookup main
32767:  from all lookup default

Furthermore, wg-quick would add an "0.0.0.0/0 dev wg0" route to table
51820, and "10.5.0.0/24 dev wg1" to the main table.

This would result in encrypted traffic using the routes in the main
table, traffic to 10.5.0.0/24 the wg1 tunnel, and everything else the
wg0 tunnel, exactly as intended by you.

> PS:
> Somehow, connectivity with both A and B peers were worked in single wg0 interface some time ago,
>   but after few updates this feature stopped working.

It should indeed be possible to have both of these peers on the same wg
interface. If you're running into issues with that, please elaborate on
them here or pay us a visit on IRC (#wireguard on Freenode).


Luis
