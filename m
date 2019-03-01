Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFBCC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:18:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E372E2083D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJMN7Jdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E372E2083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea94b50e;
	Fri, 1 Mar 2019 10:09:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f16cd08f
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 10:09:04 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 360f0aa1
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 10:09:04 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d15so11300308plr.1
 for <wireguard@lists.zx2c4.com>; Fri, 01 Mar 2019 02:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVFsx1fZY6c0ZH2iN+yyApkpkp5GiFUnz0/zEKWtPpA=;
 b=GJMN7JdiHNCTtk29CTajoOOAcEbn2IAPld0xQIxrE+Tt6XwKVS3o0IwwvnKpDtv4jD
 /xERefIdHd/OLXKyJhRO0j+nDke0CZvpJji6vpPYpiax7IUzPB/pa4m292l8oT+eMsAf
 zLNEGnEN1RYz74fp3bDJxAACy8PwOIJQnlc3Ck4WqZwK90sd1qRKwMuO1dtG06aM36pI
 7qmmU0toABLIZdIWtifAST0JRZnROLLFm9FGVhYGPFeRjbG5ik3J+DeigxTwyOaPsaLE
 y6ZonUZCIztJe/0Q650ivce9y3ijqrA7UVUNgeuiiduKGb7lqpqlxAemQmUsqAxseU/p
 fTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVFsx1fZY6c0ZH2iN+yyApkpkp5GiFUnz0/zEKWtPpA=;
 b=tw72yGoLCCdotVIpZi45yfWqBuUnwgQDVVHt+D3JwqkaOEeqcMxZpuTc5ZWi2pHw1h
 Zkfzx1HhIgvgd8878H0jMhx6awHirJctqODPZ7t8iwhEwAJrItUFDyynQZgWN/glSW51
 iebMZffNlsfBI6saFj7+7aZgVxeS1O8B9/v305gfSRJJ9qJPYIFJZUskxqirzJHy9sA4
 w7nz05OnYkkGB3LaDPiKB3irsJO8t29Eey2HFabCUgUoTHoyVlADTcTAvtXZv87NckCX
 3NyNWztaBk/rTNJkGOSvWOOc4RQZBUMoFw4IeYIeF8shyJ36UHsorMESgPIpxY3r8vJy
 WE/g==
X-Gm-Message-State: APjAAAWbISLO0xN3aahxTojXdd/NN1XjA08M5Torh8ab1OcE8IOvnVDI
 p4XST210idd7LSbGMHBq+WZwgjU6KGdWGs/7/2s=
X-Google-Smtp-Source: APXvYqyENXIkAv/ZIG0A3QLWjJSJUjS06wfYInBBz+95j0J5TFtRLrAicCzYY4tOA1LG/6oQJTwkY6aGQG0pIdf7Lgo=
X-Received: by 2002:a17:902:9683:: with SMTP id
 n3mr4718238plp.333.1551435532160; 
 Fri, 01 Mar 2019 02:18:52 -0800 (PST)
MIME-Version: 1.0
References: <CAJwvAosHFogtuPL09C9ek4bz6A7vW76mzKymL11iWs+9F7Ep_Q@mail.gmail.com>
In-Reply-To: <CAJwvAosHFogtuPL09C9ek4bz6A7vW76mzKymL11iWs+9F7Ep_Q@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 1 Mar 2019 11:18:41 +0100
Message-ID: <CAKXLc7cerFqi1dACAfL3gRx53E9u0n709rd=Wu-0uCbFtJOiRA@mail.gmail.com>
Subject: Re: performance query
To: Scott Lipcon <slipcon@gmail.com>
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

On Fri, Mar 1, 2019 at 11:11 AM Scott Lipcon <slipcon@gmail.com> wrote:
>
> I've been experimenting a bit with Wireguard on several ubuntu systems, and am not seeing the performance I'd expect based on the numbers at https://www.wireguard.com/performance/
>
> I'm wondering if there is a configuration setting i'm missing or any better way to debug this.
>
> Testing between two locations - both have nominally 1Gbit internet connections from the same provider.
>
> At location A:
> 1) Ubuntu 18.04 "server" - i7-4790K CPU @ 4.00GHz
> 2) Ubuntu 16.04 client - i5-3470 CPU @ 3.20GHz
>
> At location B:
> 3) Ubuntu 18.04 client - Celeron N2808  @ 1.58GHz
> 4) Ubuntu 18.04 client - Virtual Machine - Xeon(R) Gold 6126 CPU @ 2.60GHz
>
>
> Using iperf3 for all tests, with 8 threads, but that doesn't seem to matter significantly.
>
> Between 1 & 2, via gigabit LAN - 940 Mbit/sec.
> Between 1 & 2, via WireGuard - 585 Mbit/sec
> - I might have expected a bit higher, but this is certainly acceptable.
>
> Between 3 and 1, direct iperf3 - 580 Mbit/sec
> Between 3 and 1, WireGuard - 73 Mbit/sec
>
> At this point I was guessing WireGuard was CPU limited on this little Celeron, so I set up the Xeon VM (#4):
>
> Between 4 and 1, direct iperf3 - ~600 Mbit/sec
> Between 4 and 1, WireGuard - 80 Mbit/sec
>
> In other words, the much faster VM is only a tiny bit faster that the celeron.
>
> Any suggestions?

A lot can go wrong speed-wise "on the Internet"...

What sits in between those hosts that you have control of (routers,
switches, firewalls...)?
IPv6 involved at all?
ISP having throttling policy for "UDP we don't understand"?
Play with the MTU, you might be hitting some fragmentation issues that
a weak router is not handling fast enough.
Play with Wireshark (new 3.0 even has support for wireguard
protocol!), capture some traffic, look for any transmission errors.

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
