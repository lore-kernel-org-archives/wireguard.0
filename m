Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64A7C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:21:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C4920674
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="o2C7i96v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C4920674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d55489c4;
	Wed, 28 Aug 2019 02:20:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f105f21
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 02:20:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 778def32
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 02:20:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96fe3070
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BWnYPgdo8OeqEtWiVmJPd2XXJ0k=; b=o2C7i9
 6vNRsZpTzvmyq27agHIRx3vHBqM6lngqgBHlPDr9NLyYISUZBIL4dehzu7mvomrY
 8h/rgIvby93xAXg0c+FmKKq4//wCjxJc8aVRf3t8Bt1ATowOxUI4JV99sdD0Ncz3
 4DpsTEsFsg4/LJlm2x1fbw/ZsoOWRaDIzr/c6fGKXKkuDmqfUdUitvfbJdb7a2o+
 MLUMus+3lS7S84RDpr67DTsnlNpCtinetzG5lbHBzm5UdPUMFeofAS5rSx0faDUv
 EBrbx9WteTB7CeEPTPTRQLq37apudJBn3akI1NS70aSJ15+yn1C7CT5wrLzExZGB
 125liHqJqLy0x2OA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0496a471
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:38:43 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id p23so1256436oto.0
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 19:20:50 -0700 (PDT)
X-Gm-Message-State: APjAAAWuARMEWHMGCR5grdwBgCFO/cVcqodYPFQFull8ULyzgQrpjzs9
 bsNLT6RuSiB80NDnHQ9dNPmU0gX9eZW7Lfdnkhk=
X-Google-Smtp-Source: APXvYqxW17jDg1znbBqI2pA+NBR6Ei+BXsJMo2I/meq5ZBmZwg2QtJwbufS49Lzo2/n7Sj0O4/exAqPKMvGBFcvCris=
X-Received: by 2002:a9d:73c4:: with SMTP id m4mr1435887otk.369.1566958849667; 
 Tue, 27 Aug 2019 19:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9pNVSr4vqXEvpH-K2bK-9OyOurkHrzK7kg0Mmyb0ASrUA@mail.gmail.com>
 <BWKVAQQ0RFKJ.2FBG8FY1MXOR1@rxps>
In-Reply-To: <BWKVAQQ0RFKJ.2FBG8FY1MXOR1@rxps>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Aug 2019 20:20:38 -0600
X-Gmail-Original-Message-ID: <CAHmME9q6hQfrQK_1pRB=tbtJ_Sn=-3Z=8v_ZJW7uB6UuxDx15Q@mail.gmail.com>
Message-ID: <CAHmME9q6hQfrQK_1pRB=tbtJ_Sn=-3Z=8v_ZJW7uB6UuxDx15Q@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: Don't fail systemd service when using
 systemd-resolved
To: Ronan Pigott <rpigott314@gmail.com>
Cc: Ronan Pigott <rpigott@berkeley.edu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Ronan,

On Tue, Aug 27, 2019 at 7:21 PM Ronan Pigott <rpigott314@gmail.com> wrote:
> Yeah that was my first thought, then I supposed that perhaps it was
> ordered that way intentionally to prevent a situation where the dns is
> unset and a client would make a dns lookup on the interface before it is
> deleted. It would use the sd-resolved 'global' configured dns servers in
> that case which is maybe undesired.

Right, exactly.

> I realize it's a hack. I gave the explanation somewhat in the hope
> someone had a better solution to the problem I was experiencing.

One approach to the hack would be to just take it all the way and
append `|| true`. That is, make it non-fatal. A tear down routine,
anyway, has very few choices on what to do when something goes wrong,
and sometimes continuing isn't such a bad policy.

> The real issue here is that there are there are three common
> implementations of resolvconf: debian resolvconf, openresolv, and
> sd-resolved compat interface. So wg-quick uses resolvconf, but is only
> fully compatible with openresolv. wg-quick is (accidentally) compatible
> with sd-resolved through the resolvconf compat interface, except for
> this minor hiccup. This hack allows wg-quick to work for both methods
> with no extra configuration from the user, no alternative code path
> for sd-resolved, and no change in behavior for non sd-resolved users.

"wg-quick is (accidentally) compatible with sd-resolved" That's
actually not totally true. Systemd has that resolvconf compat
interface because I annoyed Lennart about it a bunch. :-P

> There is another way that is might be more palatable: openresolv and
> sd-resolved resolvconf both support a '-f' flag for ignoring missing
> interfaces, which neatly sidesteps this error. However, I don't think
> debian's resolvconf supports this flag. Now that I look into it though,
> it seems debian's resolvconf does not support '-l' either, which wg-quick
> uses, so maybe we don't care to support this anyway. I think v2 will
> just use the flag instead, if that's alright.

Yes, that's terrific. If I recall correctly, Debian's resolvconf will
ignore arguments it doesn't understand if they're in the right
position. It seems, anyhow, that -f is exactly what we should be
using. I'll gladly merge a signed-off-by v2 that adds it.

> Users of openvpn use sd-resolved dbus interface in place of resolvconf,
> such as seen here: https://github.com/jonathanio/update-systemd-resolved
> but I believe this is overkill for wg-quick.

Ahhh yes the amazing shell-script IPv6 parser. I recall reading this
in wonder a few years ago. Indeed it's a bit "much" for wg-quick, and
I think your solution of adding -f to resolvconf is a good approach.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
