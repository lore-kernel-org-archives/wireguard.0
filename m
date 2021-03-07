Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8E2C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 21:50:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B8264FBA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 21:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B8264FBA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 572d5ad7;
	Sun, 7 Mar 2021 21:50:00 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d425c5ed
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 21:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615153795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RUVCoOWCZgwYe0ildtedhPApp+y7b5Piejnp/H1K+cY=;
 b=DTdXgcK4DariqMvnym9sG1u7NHE6Gzrnn5KzEo8sefXyKH0YMyqkmwLNplArVCh/txXeEu
 kWQGCpXBCHFWRBKj68FACOet+24cno8+fQ7nke9lAE5rz93twxSZYnzGiZ7VWnL3YdqWn5
 ML4nI2+rU1hIRf8ViORfiQPd6It7GtU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bad5da22
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 21:49:55 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id h82so8111159ybc.13
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 13:49:55 -0800 (PST)
X-Gm-Message-State: AOAM532gf5j/qk1IFXwEvZpytPaUb82YXanD1Jcnr3AdNhpr0Ieb2o3t
 575yexhu3qi/h9PZiQVxffoe7l7tcYw8D8zm3xM=
X-Google-Smtp-Source: ABdhPJy7mvJ0VD3nNKLyI81nc+txqkVyTDiapeHN0ZoxsxFksc1hv6STbLAtNih32M/g6LLphFUqgV47sytRwUNHSMw=
X-Received: by 2002:a25:5289:: with SMTP id
 g131mr29648018ybb.178.1615153794700; 
 Sun, 07 Mar 2021 13:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20210109210056.160597-1-linus@lotz.li>
In-Reply-To: <20210109210056.160597-1-linus@lotz.li>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Mar 2021 14:49:43 -0700
X-Gmail-Original-Message-ID: <CAHmME9osYO9O6dikmwR+i44hB_4YqKyc2P3Sre_g9ReHkMJDpQ@mail.gmail.com>
Message-ID: <CAHmME9osYO9O6dikmwR+i44hB_4YqKyc2P3Sre_g9ReHkMJDpQ@mail.gmail.com>
Subject: Re: [PATCH] wireguard: netlink: add multicast notification for peer
 changes
To: Linus Lotz <linus@lotz.li>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

Hey Linus,

Thanks for the patch and sorry for the delay in reviewing it. Seeing
the basic scaffolding for getting netlink notifiers working with
WireGuard is enlightening; it looks surprisingly straightforward.

There are three classes of things that are interesting to receive
notifications for:

1) Things that the admin changes locally. This is akin to the `ip
monitor`, in which you can see various things that other programs (or
the kernel) modify. This seems straightforward and uncontroversial.

2) Authenticated events from peers. This basically amounts to new
sessions being created following a successful handshake. This seems
mostly okay because authenticated actions already have various DoS
protections in place.

3) Unauthenticated events. This would be things like (a) your patch --
a peer's endpoint changes -- or, more interestingly, (b) public keys
of unknown peers trying to handshake.

(b) is interesting because it allows doing database lookups in
userspace, adding the looked up entry, adding it to the interface, and
initiating a handshake in the reverse direction using the endpoint
information. It's partially DoS-protected due to the on-demand cookie
mac2 field.

(a) is also interesting for the use cases you outlined, but much more
perilous, as these are highspeed packets where the outer IP header is
totally unauthenticated. What prevents a man in the middle from doing
something nasty there, causing userspace to be inundated with
expensive calls and filling up netlink socket buffers and so forth?

I wonder if this would be something better belonging to (2) -- getting
an event on an authenticated peer handshake -- and combining that with
the ability to disable roaming (something discussed a few times on
wgml). Alternatively, maybe you have a different idea in mind about
this?

I also don't (yet) know much about the efficiency of multicast netlink
events and what the overhead is if nobody is listening, and questions
like that. So I'd be curious to hear your thoughts on the matter.

Regards,
Jason
