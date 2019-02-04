Return-Path: <SRS0=K46V=QL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBDEC282CC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 14:57:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DFA214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Feb 2019 14:57:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="1n7RVsQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DFA214DA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 361e1603;
	Mon, 4 Feb 2019 14:49:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3535e19a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 14:49:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 503c2f63
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 14:49:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78528382
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=AL0xFm+PYOtr/dQLp+KWMkDu1Ms=; b=1n7RVs
 Qf60PPw/a7SKErCp94BNEqbqAvukKBiDTKvcE2+HOIUuq5/NwnPDWp9U4Y7jmykF
 jTy3ypki7bMCwMBRHCQhVKeNUxn1cDoV0vrPO377Lp9HR5dtFUnxrgngVBIvG1GH
 3L5oUNPBodQcmTV1snYABOtJl+NMyEKERwitCtwsclHj/VabFEQgap2zryAFy6hY
 Ku7Xm1nYyKhjD5vNRaiumJM2tCAehHq+dMvNUFHjTPIwJKrSdutxsB4+e041VWde
 bY8WlKZ0Mfaow8ssQaUii24lu9l2pugHr6IGvbee6BMjszTX4i33RNMuJ5oujpvK
 XGHAVJu1XEN/fq3w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c7b596c8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 14:40:40 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id e12so203635otl.5
 for <wireguard@lists.zx2c4.com>; Mon, 04 Feb 2019 06:56:32 -0800 (PST)
X-Gm-Message-State: AJcUuke3Y9lwseHu4v9j/g2L5E0ly7jnhh8J8upbvaJchmAlZeP+AMxk
 kU/XAvOU4x6aAr6sTuLAna+vNdlQXyS6CvbkJjk=
X-Google-Smtp-Source: ALg8bN6H+rYB27FQLc8jHkPSuFTeEl4GJ3kdoQ2uSjyfo373thwdoaiBJT1fXOR8Zo16vDtK6SJy2ClJDe5f3gShVPI=
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr39209216otg.223.1549292191508; 
 Mon, 04 Feb 2019 06:56:31 -0800 (PST)
MIME-Version: 1.0
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
 <20180521145618.GA3199@wolff.to>
 <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
 <20180522202537.GA18356@matrix-dream.net>
In-Reply-To: <20180522202537.GA18356@matrix-dream.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Feb 2019 15:56:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9pMHC6jV6sAGvbyRpnKdYaRYUoBnfn1mOCks_uAi3coAQ@mail.gmail.com>
Message-ID: <CAHmME9pMHC6jV6sAGvbyRpnKdYaRYUoBnfn1mOCks_uAi3coAQ@mail.gmail.com>
Subject: Re: WG: Need for HW-clock independent timestamps
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Jann Horn <jannh@google.com>, neumann@cgws.de
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

An update on this old thread:

The only requirement for the "timestamp" field is that it's
monotonically increasing. I've been mulling over some improvements to
the current situation of just sticking a nanosecond resolution
timestamp in there raw, after discussing with Jann a few months ago
and then with Ivan the last two days at FOSDEM.

First, it's quite trivial to whiten that by only allowing a resolution
of 16 or so ms, which might mitigate various unrelated sidechannels
that think they have an oracle in WireGuard.

Second, both Ivan and Jann have suggested that rather than always
adding a fresh timestamp, we should instead choose a per-peer base
time for the first handshake, and then simply increment that on each
handshake (making sure that the stamp never exceeds the current time).
While we're holding off on new features and nobs and whatnot until
post kernel merge, this would then enable us to potentially add a
specialized option for manually setting the base time. It would by
default remain the time, as it is now, since that's almost always a
reasonable decision. But for devices without an RTC and whose flash
chips prohibit writing out a new timestamp once a second or minute or
whatever, this would allow, instead, to just write out a counter once
per boot, which is much more reasonable. Initiation of a wireguard
tunnel for those devices would be: read last counter to variable X,
increment last counter, store incremented counter to flash, tell
wireguard to use X as basetime. I think this dance should handle a lot
of the issues discussed in this thread.

Third, Ivan suggested that we actually add a blinding factor to the
timestamps, simply by adding HASH(label||private||public) or similar
to the stamp itself. I'll need to think carefully about the crypto
before committing to anything, but this kind of transformation does
not seem infeasible and might lessen a potential infoleak. A good
idea, in other words.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
