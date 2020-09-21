Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181F0C43466
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 15:05:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528DD206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 15:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOohqp8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528DD206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08e01944;
	Mon, 21 Sep 2020 14:34:33 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8d3f05af
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 14:34:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y11so14404683lfl.5
 for <wireguard@lists.zx2c4.com>; Mon, 21 Sep 2020 08:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rfZFbnkJTildy64R3LP5tkhf0zovAwHKu7egohu/64=;
 b=bOohqp8bb+cAhindPnBlMDisnfAX9p/tsqrjVfYdW9XDlis4kbjyleTM/QZZMqIAAx
 bg1M/yIHMTLHME9CkqQchvUA7NaqXfetXhew3GoN77y9Zg1r4R2snWddrYkdZSBwiIIw
 4foFx3DusdXPGfM0oCx5ZQX5W6uKardRgnoN9pWDvC8DlliaPeMJ5qWD/oEbHOicXsBU
 pUVQnmUZ/XfedrW2Y1TpsECWdjY2VGDHdSjYJZ7gtACBJq1myVcmbcMcyxbI/ZBpNBja
 yPYcIz7rwWHra2MCYdtwJhaOUb6g9ObPGmHeOw0SwMpj1OG9RzO6ZHQVHllWjEAOrD/7
 5X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rfZFbnkJTildy64R3LP5tkhf0zovAwHKu7egohu/64=;
 b=bvFtOz5tHvCRYaMwFywcirBWFcrq8EZbZg1PWdoOmsmaKLG2vLExQ6bOzMbuuVLWY8
 m59h+aN2ymtV0LgH0+P58bAQ7xNHBLHDSvbTid3e12ma7pfnCr47w1U+Gwxn/orHHE2j
 9DqKVRxOrWBS9xYCc83bR4A3FVy+sqONO2GFow/t1ivlJcrGbsN+SPLjZnh3NR4tWq4L
 /1ENcKK7hPYU/f+4yum0MYNoLbYZrNXEROexkzyee2DVDTIMKJ0NhmZqde93ChMB9of9
 EuHU9kMfxoVtSNESnu1/HKISNRDuJixLamy8nyxMit49K83tz3a/K6sUzgAw9uefAvZo
 gM9A==
X-Gm-Message-State: AOAM530AVRz7XKqFbZutl16ILfm7eycnL7TjTjkwnXQHQZpKoZCBSYtL
 EfVwua5A7optB6ahItDq3cWVTvK3po7aNGQE+rU=
X-Google-Smtp-Source: ABdhPJxnSSKw3zFgY/uMm7JL/LChwYA+Hxg6J9JsoUNWzY1akx75SmvYM3GMcT2jxE24/PT0sZjsG6+DOMvFcPfMjlw=
X-Received: by 2002:a19:c002:: with SMTP id q2mr125695lff.372.1600700703277;
 Mon, 21 Sep 2020 08:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
 <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
In-Reply-To: <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Mon, 21 Sep 2020 11:04:26 -0400
Message-ID: <CAMaqUZ2B3H1Fa3=TFh6_PoV_Thz4javkKFHyeGPpdsma_GC0QQ@mail.gmail.com>
Subject: Re: Interest in adding multicast support to Wireguard?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Derrick Lyndon Pallas <derrick@pallas.us>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

I looked at this a while back. As far as I could tell, there's nothing
fundamental about the protocol or the security model that prevents it
from happening; conceptually, it's as simple as overlapping AllowedIP
ranges. This is easy for incoming traffic, but outgoing traffic is
more difficult; each outgoing packet would need to be duplicated and
encrypted separately for each target peer. What's more, each of these
duplicate unicast packets would have to be queued separately because
each peer may be in a different handshake state.

None of this makes multicast over WireGuard impossible, however, just
difficult to fit into the existing implementation. I've toyed with the
idea of a one-interface-per-peer setup with bridging or some fancy
netfilter stuff to handle duplication and dispatch between them, but
it seems like it would be a PITA so I've never taken it farther.

As far as "special" multicast ranges, heck no. One of the fundamental
assurances of WG is that you'll only ever receive packets from a peer
which have a source address listed in that peer's AllowedIPs. If you
want to put ff00::/8 and 224.0.0.0/4 in a peer's AllowedIPs, by all
means, but I'm strongly against WG itself having any special notion of
what a "multicast address" is or any special handling -- or sneaky
emergent properties -- for them. DHCPv6, for example, requires only
ff02::1:2; if that's what you want, I probably wouldn't whitelist a
whole /8 to get it. YMMV, of course, but that should be the user's
choice and responsibility.

Another reason not to treat certain address ranges specially is that
there's more use cases for what would effectively be a "link-layer"
multicast than there are for IP multicast. You could have something
like port mirroring going on; say you've got a gateway with ::/0 as
well as an IDS with the same range. Both could receive the same
traffic, which could be useful in some applications. Obviously, you'd
need to realize the security implications -- both client-side (sending
copies of all your traffic) and IDS-side (trusting that you'll really
be sent copies of all the traffic) -- but flexibility is good, and I
can imagine some usecases (especially embedded systems) where that
would be a desirable property. (Sure beats sending the traffic in the
clear and having the IDS -- and whoever's hacked your switch -- get it
that way.)

--Reid

On Mon, Sep 21, 2020 at 7:27 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> We've discussed this extensively and repeatedly. I made a few
> proposals a few years ago that we discussed. It doesn't fit into
> WireGuard's strong binding model.
>
> Jason
