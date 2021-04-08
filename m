Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D9DC43460
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB72A610A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB72A610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3fec6fa;
	Sat, 10 Apr 2021 14:27:33 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1af1a07
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 16:43:23 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id d12so2783016oiw.12
 for <wireguard@lists.zx2c4.com>; Thu, 08 Apr 2021 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkt7RS6FHZY5hgRWvwzG+DsijllqT2Dg1nUSccPJ05Y=;
 b=JuMgDuU+gHdWkpARF3fTUfXVSslhGgKe6qn+S/EOFOGTDE48DUSWzJ/IlbPM0rYvPI
 kErMILYxGX6MWPMbZ+cIJoXUYNkqcXePs8WfWR6sMch1/Uof8Hzdi/REc8JWv5MP0QHG
 yjl19hto/2QPCsY+08scBvxIeCi1kHBpxypDJ2Mdc5CYIG6U5V+aFT50uT0vp4gAtLZG
 qxvj53LdOn9TAKqsToeqvAJwYySDhcpZ1p1nAppoUTp9vcgnabHH/br+V7XiE4q1EaJb
 jaCvTtOPhO0rh1yuyHqd8bolH00I+2IwgswnL1gjLMz89NIHRCBJhyRakySSuq2RIIQM
 DoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkt7RS6FHZY5hgRWvwzG+DsijllqT2Dg1nUSccPJ05Y=;
 b=A1aCTq9m46LI3d4VkaO0GudDwsOBjb8ldJSroXvZnI0NnA44lEKvGaPkL7yF0sT54X
 Q4Q/AAhuYjCdEB9Afm5C09eBgdZZltlnUMazC1RCDanfnNEWR2rJ/l6RfcUJdGRv3hs/
 ndlX6YGyqHblAW8kl4Ktfe1NjgBUYgQlenxqU4IuVZEj5VXaS49ZdJMeMx0++Nvy4AMi
 /ntl7KIju7WszpV6rYchva/IdN/LXTYTdRa4ZRHdGj9Z/4LcUjbM7CGHDH4c64fz89PZ
 Csk7/kmWx4gHtudVId04FysJAcDapAaXvgd7GTRmskEX710B0dtZdX7ULTRCDyKGw6/N
 oKuw==
X-Gm-Message-State: AOAM533H6XcG8TAKcwkstSuy49e04JdDAeb0z4sI2ZToq6SISRyTIm0X
 6m8hXISzSpjIIN19JayAg21LPznn82cvsDUOK6g=
X-Google-Smtp-Source: ABdhPJyTJR0Whg3/6Hap2usRW7nTRnjEGYSK4ot+693z/oDZCfElnwdq5be12xSy7GCFIRixKdkLuNVjGp5jLcPQc6o=
X-Received: by 2002:aca:3389:: with SMTP id z131mr6986788oiz.11.1617900202240; 
 Thu, 08 Apr 2021 09:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
In-Reply-To: <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Thu, 8 Apr 2021 09:42:46 -0700
Message-ID: <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
Subject: Re: Allowing space for packet headers in Wintun Tx/Rx
To: David Woodhouse <dwmw2@infradead.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 10 Apr 2021 14:27:25 +0000
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

On Thu, Apr 8, 2021 at 7:37 AM David Woodhouse <dwmw2@infradead.org> wrote:
>  =============
>  PPP over DTLS
>  =============
>
> We just added support for the PPP-based protocols (Fortinet, F5) and
> I'm not sure we even know what the DTLS-based version looks like on the
> wire, do we? If the header is 4 bytes or fewer, the same nasty trick
> works that I suggest for Cisco DTLS above. And a PPP header even with
> accomp and pfcomp *would* fit in 4 bytes. For the TCP transports we
> have an additional framing but I'm hoping those aren't there in DTLS?
>
> If we do need a header larger than 4 bytes, then we are forced to do
> things properly by adding support in the kernel driver instead of just
> abusing the existing header while we know the kernel isn't looking at
> it.

This is probably too much "inside baseball" for the non-(OpenConnect
developers) here, but I *have* confirmed that the PPP-over-DTLS
encapsulation is identical to the PPP-over-TLS encapsulation for the 2
PPP-based protocols that we support already. Both F5 and Fortinet
essentially opted for the thinnest veneer of UDP-ization possible for
their protocols.

> So, what do we want, and what's the bare minimum we actually *need*
> from Wintun to be able to avoid those memcpys?
>
> The bare minimum is either exposing enough of the TUN_SESSION to let us
> manage the rings for ourselves, or a function which can resize the
> *last* allocated packet from the Tx ring before we call
> WintunSendPacket() on it. That's purely userspace in wintun.dll.
>
> The next request would be to expand the TUN_HEADER to include head/tail
> space, and a parameter in the TUN_REGISTER_RINGS structure which
> configures the amount of head/tail space to leave between received
> packets. That's a change in the kernel API and is more complex to
> manage, and as noted we *could* live without it for now although it's
> kind of ugly, still involves *some* copying at the tail of outbound ESP
> packets, and depends on those PPP headers not exceeding the 4 bytes
> that are currently available for us to abuse :)

The tl;dr for OpenConnect is that we really would need support for
arbitrary head/tail space in order not to have to do *any* memcpy.

Dan
