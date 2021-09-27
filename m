Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BC6C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 04:05:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A446A61151
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 04:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A446A61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2052522;
	Mon, 27 Sep 2021 04:04:18 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7189fb83
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 04:04:15 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 7D260203E9;
 Mon, 27 Sep 2021 06:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1632715454; bh=kEMZffumR/UKzVtjXBwCSICTM7/0b+HJes3twZ5hq04=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Kp/dL7Qe905F93TUGSxOnyUMxKKb8HnmZVLbLIUMgrA+mAWCW5XaDc1Gs9ARXv8kp
 jOS+nbXvWCYyfi/sThJvYju6SWpedpOtqffi9J99ZgYWuknaVyAJ8XKmEDRCL05xsM
 Se5jqfs+WXWNcptwbVWGJKBRbW5Hm9GHDxNR5og1au3iLX8uxU4NeIfZc4KSTo/hTd
 GDMT0PIPvgz0sUse+jKZWhVjcDEDvV8Fy016XJO/0nOnaeGJ9db/i21H4QBkaPn/XI
 ZJvEw10GbC3quKnl3wBsURJSFDryB6x5yUbpdGN3hD38cCIejXstOzKF54ThslmRyt
 /yTPCQdoKfEzQ==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 8466614CC28E; Mon, 27 Sep 2021 13:04:26 +0900 (KST)
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
User-agent: mu4e 1.7.0; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: el3xyz <el3xyz@protonmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Date: Mon, 27 Sep 2021 09:53:08 +0900
In-reply-to: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
Message-ID: <877df2d5px.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
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


Hey,

el3xyz <el3xyz@protonmail.com> writes:
> [...]
> To make detection more difficult two things are being done
> * handshake initiation, response and cookie messages are padded with random sized garbage
> * Up to 192 bytes of each message is encrypted with obfuscation key derived from peer public key (different keys are used in different directions).
> [...]

I did not have a look at the code itself, but travelling around the
world, I appreciate the direction a lot. While from a safety perspective
this does not anything, it can add a lot to the usability / being able
to use wireguard at all.

I'd appreciate if wireguard upstream would take this in, maybe even
supporting multiple / dynamic listen ports.

Best regards,

Nico



--
Sustainable and modern Infrastructures by ungleich.ch
