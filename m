Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6371C54FCB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 22:00:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278AB20781
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 22:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="mMOtOfjw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 278AB20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbf4b53a;
	Fri, 24 Apr 2020 21:48:25 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b90258f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 21:48:21 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1587765569; bh=NPNE+lM+kU8ZXGECGNApezEbk9uGsLUBIQ1QiLOBV30=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mMOtOfjw00o+5rGGl6uj/ToP8ngScqEwFLNTomet8dHSRuJkxa34VRPgUWo0kpWVu
 WvqAtVSvtnLO/u9ZvOsO16hz8ySJL6mW304TPcc0H9JIc3Rdhf0DgekjgGkhVvWCXp
 a7aTG3+VYQ4ybZaEJMqFtN4ghNVgQnv3WUY2jvjnlmFeITjDb11Wa27AZKBBicWzuh
 XxG09uiDHuVzje7au2FZZrS55WJTOCI1ADj2eryqQjirJotIwKq8NE7ZVrkGc3nWxn
 OVufldxfUyjT8Xt9cjJbvAwefl1bF9/EHyagy5zRfaUiDRvSEOSkirCdQxPMElr8Sb
 AR/uYLokRjIhg==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Adhipati Blambangan <adhipati@tuta.io>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Attaching XDP program into wireguard interface
In-Reply-To: <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
References: <M5WzVK5--3-2@tuta.io>
 <CAHmME9oGY8MVpMe1HbWm6AQCPxb4RcRpiAYrdDTBHAMotMyiGQ@mail.gmail.com>
 <CAHmME9oDRO6FwJdjOCm0EZNRwtweSZAfxWyyMfptMDSf_h__Bg@mail.gmail.com>
Date: Fri, 24 Apr 2020 23:59:22 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87a73035qd.fsf@toke.dk>
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Oh. Set XDP_FLAGS_SKB_MODE.

Yeah, you'd definitely need to run this in skb/generic XDP mode.

-Toke
