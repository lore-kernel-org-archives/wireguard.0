Return-Path: <SRS0=VRfM=UN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5D2C31E4B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 18:09:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72BD22064A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Jun 2019 18:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uue+c2Kb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72BD22064A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 395de26a;
	Fri, 14 Jun 2019 18:09:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b328b79
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 18:09:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d624f1c8
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 18:09:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4354f6ae
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 17:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=1xkUBuj4h9ymbwkW83lxpc7aGs0=; b=uue+c2
 Kb2ew/dttr2o9LLLU9L82ddw9jbLqp+YK+u7aaQKo8OOleZOgGJsazrEtHwazHv+
 vyFTqpSP2wQt5SiPoeO/vJ6ZqmLys3v6pgYL/RXFG1FGU3ksKbb8Hjd7/iUgNWba
 FwUQ+jIsIN2RY+InsW2afuuORwWATs23GJvfjkCbn1ySL1xIRjmCIEykryW1DvyL
 8058T4Hp8SXCYg95FH66S2Kb201vYed3sFoX/DvEajCpNHP/nyZRsHTRYsnCcFUy
 Fc8QHvlQ+Zd7NBP9poq2/T7UUZjX7L+H53gVGvnVitNEPA2OMYLo32qWpD5X1ATD
 R/CeN/Ihq4Xba3vQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fbc3f1e9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 17:37:19 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id v6so2330147vsq.4
 for <wireguard@lists.zx2c4.com>; Fri, 14 Jun 2019 11:09:50 -0700 (PDT)
X-Gm-Message-State: APjAAAUuUUhA74st5nJ9dMiM82nAP6Zoe8ylxLznPymspak4pKSy9kYV
 eB77OtXanuNrL3vBub6Pij8eFAT+2zpkomcT3Dg=
X-Google-Smtp-Source: APXvYqzYtpQegEFOdJwMMMTMgnWPhZZBzN86FFl7hTfxepAdfFmW6d3Yu3xxhyxT7oe/mQlqDEPLhHw1MrBvAs2LCIc=
X-Received: by 2002:a67:ecd0:: with SMTP id i16mr7038714vsp.110.1560535790060; 
 Fri, 14 Jun 2019 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
In-Reply-To: <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 14 Jun 2019 20:09:38 +0200
X-Gmail-Original-Message-ID: <CAHmME9qpp5pkP3RAENJfWjdaL61T7J1C5dDLCM+OM-U_DxRz_Q@mail.gmail.com>
Message-ID: <CAHmME9qpp5pkP3RAENJfWjdaL61T7J1C5dDLCM+OM-U_DxRz_Q@mail.gmail.com>
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>, Luis Ressel <aranea@aixah.de>,
 Steven Honson <steven@honson.id.au>,
 =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labo@labo.rs>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Lonnie,

If your changes are user-facing, it's probably not a good idea to
create confusion by introducing distro-specific subcommands.

I'm leaning toward Steven's suggestion of nixing addconf and making
setconf behave like syncconf. But two hurdles remain:

- walk_remove_by_peer is very inefficient. That *must* be to be
improved for this to be feasible. There's some interesting algorithms
programming in allowedips.c to be tackled for that. Maybe
node->peer_list can be used. (CC'ing Ivan in case he wants to put his
mind to work on that.)
- A decision needs to be made on consistency: do we want to read back
the end result and compare it? Or will that kind of looping logic lead
to other types of DoS or latency spikes?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
