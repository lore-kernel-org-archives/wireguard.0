Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8EAC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 18:32:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E052961056
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 18:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E052961056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 153668df;
	Sat, 10 Apr 2021 18:32:43 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 36af0591
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Apr 2021 18:32:41 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id x2so9317595oiv.2
 for <wireguard@lists.zx2c4.com>; Sat, 10 Apr 2021 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K/UuR9fklDPlpKMVidWddU3rDAvpigUsp3oW1nPCNvE=;
 b=QaxDpZsLJ3ZS9413wig2sRrewiOi93WSjZGJ3wxoUaLy9ZcdiKSChrUA8EQnSLRfuF
 DD+w3sxdO4JtRIvU8avXI7c7r8U+3YGUD6Nv/cUQqUXx6PrlGnF9D77+dOFCPS5Uh3oN
 scT/udNWN1xxyW1pGc/sylqDtLMQEHEYeSoA85zB74svSEcjyjvxYYVFBjMa80hVHnaK
 /OkVRBcoYqye970pYMnFBkZKCthgOk9F4waUEJ755VjNB1EjSMo9bN7V9bculRctdSYi
 0dB9XHuHCVJFF+VK5ezP4lNSGlhcvMUGUv/1t7sYJxdiOWhINq7kVo2s7yHFKi0itRdR
 4wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K/UuR9fklDPlpKMVidWddU3rDAvpigUsp3oW1nPCNvE=;
 b=T0QbxC08xqoPdFfRu5QV3C4Yb4ClJRL4WFmXGytS52LtgEAFBU4C3YVGvSaRqg0dx3
 szxIhRUYEJdN9mUNBmzmxLNqaOT78AUvZ4+zBDc/bpwx5HI/++zRjgh/aF84x20r/878
 HK4bCHld0Nv/GDTijoOCLU4tnVED6Ytv9yzsDQxfa/VYRWkl3D6mWN11jIK3kcQ1BhT3
 djeBkcL4FklQMRTfNSWeAGm3D4Gfzo5fPOH22/G4BcaHVTc/1rvn7y/xAUluF0GLXTip
 81upR5BqnsNOI4sCd6+eK5mupkUjEB0GH+LyG+FvL4HLkFkwaO//Nop/VF622k6thRzw
 Wkrw==
X-Gm-Message-State: AOAM532b1+kykqL3sdyVzAyqHbear/xWdd3d8GYQWuN6d35MGROeHHAn
 G+JAVeg4UL9XoVYYQhcySCqEcQ/E0FP9XVCWzj0=
X-Google-Smtp-Source: ABdhPJyWCi5dmjyrZQv9yvzgpf1oWJmo8Q3Ci2ljFNQluVDbFaZf0atdkBTt4URa2uVrtyP39M6N/bIE0wbQ8s/qkZQ=
X-Received: by 2002:a05:6808:148b:: with SMTP id
 e11mr4718397oiw.108.1618079559841; 
 Sat, 10 Apr 2021 11:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
 <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
 <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
 <a1bee48639cb40299118c53d4fa8fe7a@rozman.si>
 <fb3e80d74068cd8464c44f1cb435b71d1170c659.camel@infradead.org>
In-Reply-To: <fb3e80d74068cd8464c44f1cb435b71d1170c659.camel@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Sat, 10 Apr 2021 11:32:03 -0700
Message-ID: <CAOw_LSGV8V9aLg-UdN4SE5s5o7NFfeyH+Q+mWMrvrBYp06aT=w@mail.gmail.com>
Subject: Re: Allowing space for packet headers in Wintun Tx/Rx
To: David Woodhouse <dwmw2@infradead.org>
Cc: Simon Rozman <simon@rozman.si>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Apr 10, 2021 at 7:35 AM David Woodhouse <dwmw2@infradead.org> wrote=
:
> On Sat, 2021-04-10 at 13:38 +0000, Simon Rozman wrote:
> > Hi David,This is my proposal:
> > https://git.zx2c4.com/wintun/commit/?id=3Deebd6aea4f75551f6e847a1d4fff8=
57450bac6e9
> > Awaiting review and zx2c4 approval.
> > Regards, Simon
>
>
> Looks good to me; thanks. Just need to work out how to cross-build it
> (I can muster up a Windows VM for testing, but *building* on it is
> beyond my tolerance of Windows for now).

+1 to all that.

> We'll also need to be able to WintunAllocateSendPacket() of the full
> possible MTU, then receive and decrypt into that, and send only the
> actual size of the packet we received.
>
> A per-packet tail would have let us do that, but I agree that we don't
> want to expand the TUN_PACKET header if we can avoid doing so.
>
> Perhaps a WintunShrinkAndSendPacket() =E2=80=94 which can only *shrink*, =
of
> course, and which can only be used on the *last* packet allocated,
> checking that its tail *is* the Session->Receive.Tail before adjusting
> the latter accordingly.

In addition to the use case for chopping ESP trailers and
less-than-full-size packets, OpenConnect has the case of "PPP packets
in HDLC-like framing" which need to be "un-HDLC-ed" in a way that can
only cause them to shrink.
(https://gitlab.com/openconnect/openconnect/blob/master/ppp.c#L102-158)

There are two cases worth considering where the packet size could
actually *expand*:

1) Some VPN protocols support compression of the tunneled packets. It
would be bad behavior to use this to stuff a packet of >(advertised
MTU) bytes in <(advertised MTU) bytes, but it wouldn't surprise me if
it exists in the wild. We now deal with receipt of
larger-than-expected-MTU packets in OpenConnect in a relatively
uniform way: allocate MAX(mtu, 16384) bytes for packets coming from
the VPN (if using TLS transport) or MAX(mtu, 2048) if using DTLS.
2) Some VPN protocols concatenate multiple packets into a single
aggregate on the wire. On Linux we can decrypt, truncate, and send to
the tunnel interface without further copying.

Case (1) can be handled with overallocate-and-shrink. Case (2) is
pretty rare among the protocols that OpenConnect supports, so fallback
to memcpy seems fine.

Dan
