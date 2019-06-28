Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8629BC4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 16:26:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30BB20828
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 16:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=trustiosity.com header.i=@trustiosity.com header.b="c3Fu82jW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30BB20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trustiosity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3bec049;
	Fri, 28 Jun 2019 16:25:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95e2f225
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 16:25:57 +0000 (UTC)
Received: from mx.trustiosity.com (mx.trustiosity.com [54.186.28.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87eb142d
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 16:25:56 +0000 (UTC)
Received: from [192.168.212.105] (csm.ldm [192.168.212.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: zrm@trustiosity.com)
 by mx.trustiosity.com (Postfix) with ESMTPSA id 3E814422EC9
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 12:25:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
 s=mx; t=1561739155; bh=Y0SRqXY6+N2ooYiHoGS4qaVuc6zkVG5eA8PMzFes/ks=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=c3Fu82jWVCR5RIjegzjCaWY2Yo9j6uIYz97ExeryRo/bRiiZXIj372PtUzu34ISSm
 P5cT0yw1x3/KG5qs8d892SUZ9CxkKY91erlAwOqr0pl0Q+7lQLW2rDkquU5KEJPYwl
 6ytfLe0IR4eQbKX/YOGLm4wscm81M3kTsY4cLx3Q=
Subject: Re: Deterministic Cryptographically Authenticated Network Signatures
 on Windows NLA
To: wireguard@lists.zx2c4.com
References: <CAHmME9o2Hixoo_XawTGjHoVmuV5h=VxdfN+3i9Lyc_eRuA_60A@mail.gmail.com>
From: zrm <zrm@trustiosity.com>
Message-ID: <b24e4e96-8449-9286-0c33-a23418c079be@trustiosity.com>
Date: Fri, 28 Jun 2019 12:25:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9o2Hixoo_XawTGjHoVmuV5h=VxdfN+3i9Lyc_eRuA_60A@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 6/27/19 10:26, Jason A. Donenfeld wrote:
> So, now that we can control the GUID and hence the NetworkSignature,
> we have to decide what determines a network. It turns out that in
> WireGuard, we can do this with much higher cryptographic assurance
> than any of the crazy "authenticated dhcp" proposals of Microsoft.
> Specifically, we know our own interface public key, the public keys of
> everyone we're willing to talk to, and which IP addresses we'll accept
> from those peers. If that doesn't perfectly define a network, I don't
> know what else does.

The drawback of this approach is that if anything in the configuration 
changes at all, it becomes a different network. In theory that's the 
idea, but in practice changes to the configuration will sometimes happen 
that shouldn't change which network it is.

For example, if a peer suffers a key compromise then its key will have 
to change (and so thereby will the network GUID when calculated this 
way) but all of the firewall rules and things like that should remain as 
they are.

It may help to add a config option to allow the GUID for an interface to 
be manually assigned a specific value. That way it's possible to 
explicitly choose whether the configuration has changed in a way that 
should cause it to be treated as a different network or not.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
