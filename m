Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749BEC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Nov 2018 01:22:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C5F2245E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Nov 2018 01:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="oJlJtmsF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C5F2245E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec0e259b;
	Tue, 13 Nov 2018 01:17:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70fda922
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Nov 2018 01:17:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd1dbb79
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Nov 2018 01:17:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5c4dea2
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Nov 2018 01:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lkNrg7+CBLQH3dJl66gY2fqsaqM=; b=oJlJtm
 sFjn9GEgyAoHhCopmbb5hsJUeKO4NSU82xn7vXmy1a0MFhXCR+41aPm/wyu5WsGd
 36ohG+tEOw14GWZcaXHtGjQf3kjigEfeQxpZpMfWgpNz0dZ4SrN1Vdw6hgeR5Bbb
 b6X903YxFpKbn+G6qjUsd2FOwkwhzg9sMwre3vhZ91EyNiBgVQJILNM3JOM6gDto
 ETlvThKYIfTFy5jWeVEIDzNyQsuTImQLXRtp15HqoptDB/TqHHY3PQinE4f58Gm5
 8hTVgthF19R7vTgk9rpQhraBwKp2B3rrLX1jNPo52k8SnCg3JJltDyQcHmovKpe0
 lroklE/p0fxATpSA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2264959e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Nov 2018 01:17:00 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id z33so9822817otz.11
 for <wireguard@lists.zx2c4.com>; Mon, 12 Nov 2018 17:22:10 -0800 (PST)
X-Gm-Message-State: AGRZ1gI3m9f0PZ+ezP2VJtGqiFkYx9F0Mrng6dbYbgpoWdV1fuAgfDqx
 ilsnESI3WBrW2xeepF+yVcAsAUJrpMqryoMdCa0=
X-Google-Smtp-Source: AJdET5dcAZtbJuJht91t89qiCZ1u1DNPSofjJ0ma2BhQNfQVhmKe8wC4VRQRONY3LKoFSld60WgId24kQ2/VpE06DkA=
X-Received: by 2002:a9d:60cf:: with SMTP id b15mr1894238otk.144.1542072128993; 
 Mon, 12 Nov 2018 17:22:08 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
 <87zhuea9si.fsf@fifthhorseman.net>
In-Reply-To: <87zhuea9si.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Nov 2018 20:21:57 -0500
X-Gmail-Original-Message-ID: <CAHmME9ok0A5fR5ysVoR98dYy3+8UsX4vywZbw3Ce9K30mJEhqg@mail.gmail.com>
Message-ID: <CAHmME9ok0A5fR5ysVoR98dYy3+8UsX4vywZbw3Ce9K30mJEhqg@mail.gmail.com>
Subject: Re: Debian unstable Pin-Priority too high in Installation
 documentation
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Cool, thanks guys. Website updated.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
