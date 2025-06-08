Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E1C5B552
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Jun 2025 21:11:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c281679;
	Sun, 8 Jun 2025 21:11:11 +0000 (UTC)
Received: from cornsilk.maple.relay.mailchannels.net
 (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e84b4295
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jun 2025 21:11:09 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id B926116217B;
 Sun,  8 Jun 2025 21:11:06 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com
 (trex-green-4.trex.outbound.svc.cluster.local [100.96.195.129])
 (Authenticated sender: instrampxe0y3a)
 by relay.mailchannels.net (Postfix) with ESMTPA id E1E72162161;
 Sun,  8 Jun 2025 21:11:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749417066; a=rsa-sha256;
 cv=none;
 b=eEWssct4zZOJKwmX+7YyxF4XgypxhcEoCXzOeMNDnhLrzFmLUnA3ZfWpmo9IC7HXClS/oa
 SyMFMxvGfOoFlst3b0AKSBUEBoB+yP/x8r/tyxlBFW5tHfi4rqg7hV4LS8Jk+wKXwClOfP
 5hm7eAjH4Ybv0UKIpvUFCiHSB3CCU3MZw/r4hCYRh01fgok2qwuhWpM/X7xtdBFh7rVVMW
 yFrwhN8f3bWVSJtcTpsDms2qFzsm7Uu3twA3hGmQRvw1TVHQnk8od3Zd3NIgcZY/ETMEMy
 nhrkcBXy78+8D19aVILQgSe8oygndhlAQsoXd1AIcy4BUJelKKxNB8u9tueMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1749417066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q10eUAChNCNDvYkROwRjo4FwL3SbAlSCudbqPJxFPEY=;
 b=QMGT0OykIS05KPvyqO6CBivhbdSbz5kR3/M6sTnQvUkEO8UO6l2N6C8e0pLnyomP2QCcJH
 JYh336BFWOWFh+njBQixncr9xJWSU3aH+YjXn1sSpQJynuxcf6A8ZLbW+XA/NU6Qju6OvH
 5ZZFbe5lbBataLX5Y7Vsy/tjojY3lTeDT6eFkaYUZ/anZGzZIn5ZAOfUDzxS5OmPCs3z+i
 Bw8vWoD9yZP8E/pfDiGUm0I83pmnZQ73N46V9tSWo+Mi+49YSndXS2LirsKyYGpQi5ym+B
 aeAI/WDNwbLq/E4NxUINdrni1hdyKyGfCLlpfpwDcY4xWmMtcTsXZHEk83qvFw==
ARC-Authentication-Results: i=1; rspamd-95f6fbf49-l5b57;
 auth=pass smtp.auth=instrampxe0y3a smtp.mailfrom=calestyo@scientia.org
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Quick-Ruddy: 407386925eef3db9_1749417066568_218664484
X-MC-Loop-Signature: 1749417066568:1507003728
X-MC-Ingress-Time: 1749417066567
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.96.195.129 (trex/7.0.3); Sun, 08 Jun 2025 21:11:06 +0000
Received: from ipbcc0feaa.dynamic.kabel-deutschland.de
 ([188.192.254.170]:63738 helo=heisenberg.fritz.box)
 by cpanel-007-fra.hostingww.com with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <calestyo@scientia.org>) id 1uONIF-00000006WQM-39jH;
 Sun, 08 Jun 2025 21:11:04 +0000
Message-ID: <27eacd15c147889708652227cedadf5f01d79d8e.camel@scientia.org>
Subject: Re: are WG clients expected to automatically handle it when the
 endpoint is within the AllowedIPs
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: Kajetan Staszkiewicz <vegeta@tuxpowered.net>, wireguard@lists.zx2c4.com
Date: Sun, 08 Jun 2025 23:11:01 +0200
In-Reply-To: <8e9f8b10-f438-40d5-a03a-85ef64632b11@tuxpowered.net>
References: <1a897464d3fb56184b83cb6ac7b4a2407047b10e.camel@scientia.org>
 <8e9f8b10-f438-40d5-a03a-85ef64632b11@tuxpowered.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org
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

Hey.


On Thu, 2025-06-05 at 12:27 +0200, Kajetan Staszkiewicz wrote:
> NetworkManager's Wireguard implemmentation already has a way of
> supporting it by using fwmarks. It's just that the fwmark operation
> is
> not automatically turned unless the tunnel is configured with
> AllowedIPs=3D::/0

AFAIU, even the AllowedIPs=3D::/0 case was only fixed[0] (in the sense
of: making it work out-of-the-box) recently, right?

But nevertheless, my main point was,... is it expected to be handled
*automatically* by WG clients?

It's clear that one can always make it somehow manually working, like
with the way from your comment or like how I did with adding a specific
route for the endpoint in [1] (though your approach is probably
cleaner).

And at least as of now, neither NM nor wg-quick seem to work out-of-
the-box with a split profile as described before.


> See my comment and a workaround which always forces the fwmark
> operation
> on
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/115=
7#note_2426757

I would rather not have that imposed on "end-users"... not ruled out
they get it wrong and perhaps even compromise security.


Cheers,
Chris.


[0] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_re=
quests/2158
[1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/1=
737
