Return-Path: <SRS0=6kAx=MR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DDEC00449
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 16:34:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B04320834
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 16:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="YZMZgFO1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B04320834
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7eccb330;
	Fri, 5 Oct 2018 16:33:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3df3841
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 16:33:33 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82378693
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6XLaDvBAZQSb4yWPIZlhzF3HmsYyLnipRU02t5NjBn0=; b=YZMZgFO1ala/SA8B26E4EOmNJ8
 DARvC1uN4Q/T1kKZkZkPpVpUX0+y5+3OzHQoFRZktsKuZIQ/6CueIkA2b6h6wDDHn91Tl2WxXFqh2
 y9CpuGSI00hgnoJnC4p0qAAn3jHtElFYRWYvnEPFIROVFvsMs8LRmTaestswRO5HK5uLtREmE4t+q
 X9ZahNOH4hPOjOo0IqRuHf5He2BNbgWMGDVZ/pPOfnyNIG55RCsCw0oiiQhvSNsJAcJ+6WjhfNtp+
 7KxWAUZp+zAIry1iAGLqlyFNJ0ki+8nCo0YuS/mLLygOrW6mdiZ7JFMlAj3YFZ/y36wZMXvjU7YgZ
 fx9eb0RqwTv7lW5VzWsQ2BG4gxOBI4L4x4MWHH6TgyHoRre7HHs4FI2Bd+p3enweUYBd41HECqRpJ
 MPmL1mp2o3MghaUkQ6aQ//3HOxy6ojdYvMf4L6WkAUZzgTXSkrCVxvHuaW7B6RCp1kXegm3b237VG
 onbWRafaC/cSiAxuUQLfCEKG9CKg5Xa08WHk12JrrcQzvhLrC5LWx4XVfwiqeFLZ9mWSzgbhOo5q/
 Q6j4Kjlg2IwayemMie3HVIHm66yffYmp9bS3Dzz2/yrftldSr3odsLpUEh1VsTl+qL902uJCG/kFI
 WZa78qcXp4c3JJBQzag/IGf7j6zdRTGP4x9se8E0M=;
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1g8T1x-000HSA-Hs
 for wireguard@lists.zx2c4.com; Fri, 05 Oct 2018 18:32:45 +0200
Subject: Re: Sending just ssh traffic via wg
To: wireguard@lists.zx2c4.com
References: <20181004155359.GA5957@puremoods>
 <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
 <874le0d82v.fsf@toke.dk> <20181005155328.GB22501@puremoods>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: id=AFD79782F3BAEC020B28A19F72CF8E5E25B4C293
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <81a33d58-8810-7f56-6193-ed6543a62915@urlichs.de>
Date: Fri, 5 Oct 2018 18:32:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181005155328.GB22501@puremoods>
Content-Language: de-DE
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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

On 05.10.18 17:53, Konstantin Ryabitsev wrote:
> But should the admin need to bring up the OpenVPN link

This may be a stupid question, but why do you need OpenVPN any more, if
you have Wireguard?

I'd set up a simple server-side login page that allows people to use
their user+pass+TOTP to enable non-SSH traffic on "their" link for the
next N minutes, with an easily-clickable Refresh button (and a
browser-based notification that the timeout is imminent), plus a small
(= easily-verified-to-be-correct) backend that enables/disables your
link's iptables rules. Problem solved.

-- 
-- Matthias Urlichs

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
