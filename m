Return-Path: <SRS0=Sp06=U3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C55CC4321A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 20:16:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1C7208C4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jun 2019 20:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OgyvsEqV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1C7208C4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7441b3a1;
	Fri, 28 Jun 2019 20:15:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a93cbf46
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 20:15:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32f32842
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 20:15:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 305c8286
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ENsQzaYtsC04uKsaaLStsnXc88g=; b=OgyvsE
 qVlKm/B+TQCAEDm6fI3nd3YOzdDYS9HhKd3GT9afbPEXJ2L3IuyBw0tOR4s+Je0R
 7VZmUKQtAE5tSVPXWfXJx1EYwzntGQzQTbAsPiVMuoA6DMqWYC+LBZERXl0UB9Y/
 /LUL0FrM4GT3MjWAweJNGdm55TYHe47vmpJDpSGKAyNtJxkhSH0vLqt1V6Xc2cmC
 MdNTEVQG5/ezve2KvToYtmZIT56jmeLsBNcrxG3SVQlylNry76DamvBbk1aQN989
 hj1MGynorH1s/Tzvrn3akNTHrL69geGhYkH/utKj5uCH1bWXlE2lyLKgGPx26xYL
 6MrNKJEStD5qJtiA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08eccbef
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jun 2019 19:41:31 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id w196so5171669oie.7
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jun 2019 13:15:50 -0700 (PDT)
X-Gm-Message-State: APjAAAWqV1pSPfcqx7gbHljxCMMdlpuLlubBl61VzL4YcnQQQyGUNnKv
 4HwTeMBO5INmTRbJ4LF3roJjnEAQOijrA36CgFQ=
X-Google-Smtp-Source: APXvYqy+uKRmkQVFTP3eM8hqevU/VDAzAijGB7Foo81oFioTVHdtd623e7M+Dx4qf14t/HaiQy0L7NM912pL9EPxZ8Y=
X-Received: by 2002:aca:ccd2:: with SMTP id c201mr2520858oig.119.1561752950092; 
 Fri, 28 Jun 2019 13:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9o2Hixoo_XawTGjHoVmuV5h=VxdfN+3i9Lyc_eRuA_60A@mail.gmail.com>
 <b24e4e96-8449-9286-0c33-a23418c079be@trustiosity.com>
In-Reply-To: <b24e4e96-8449-9286-0c33-a23418c079be@trustiosity.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 28 Jun 2019 22:15:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9qoUtBVd2+Y_gqr63YWOA00DsPriOBh=N=c+WkeRXMqzQ@mail.gmail.com>
Message-ID: <CAHmME9qoUtBVd2+Y_gqr63YWOA00DsPriOBh=N=c+WkeRXMqzQ@mail.gmail.com>
Subject: Re: Deterministic Cryptographically Authenticated Network Signatures
 on Windows NLA
To: zrm <zrm@trustiosity.com>
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

On Fri, Jun 28, 2019 at 6:33 PM zrm <zrm@trustiosity.com> wrote:
> The drawback of this approach is that if anything in the configuration
> changes at all, it becomes a different network. In theory that's the
> idea, but in practice changes to the configuration will sometimes happen
> that shouldn't change which network it is.

No, that's the entire point. If you change your network configuration
-- which public keys (identities) are allowed to send what traffic,
then this should not map to collided network signature. You're free to
configure Windows to apply the same network profile and conditions to
a variety of network signatures, of course.

> For example, if a peer suffers a key compromise then its key will have
> to change (and so thereby will the network GUID when calculated this
> way) but all of the firewall rules and things like that should remain as
> they are.

Remap the new signature to the same network profile as before, in that
case. In fact, remove the old signature from the trusted network
profile, since now ostensibly it's compromised, given your premise.

> It may help to add a config option

We generally don't add nobs when there are sane secure solid defaults.

> to allow the GUID for an interface to
> be manually assigned a specific value. That way it's possible to
> explicitly choose whether the configuration has changed in a way that
> should cause it to be treated as a different network or not.

Sounds like a "shoot yourself in the foot" situation.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
