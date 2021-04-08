Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943D4C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9AE6115B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA9AE6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e974362;
	Sat, 10 Apr 2021 14:27:34 +0000 (UTC)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ac234ab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Apr 2021 17:38:16 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso695371ooq.6
 for <wireguard@lists.zx2c4.com>; Thu, 08 Apr 2021 10:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N784ODN9QEIjfrbfh+0ROuoQPbiX/v8ML/TY5fecPoo=;
 b=f/4r3iR5wYzCqlK8HGM2LpzNRZfPBShy5q3woKcW0RloPHCwgDrECDNNYMl9s7vchO
 On8ZVHXo8Txhgm2ejn7e2ONd6K38D6cRO8dKgiKCcc9ZldF1bSq/xihwbF5I1R8dQiP5
 0NNSEl8FHduCXfGwJ2DsEBlhrW2JxkaA+y5A1YfufVSNxT40tbgxXXnAmf+wZazW84Pk
 R5YYp7cSJ9r5tHkl/ccLSj16sK9yE47n0WglsGpBgsMSkT504UmWacsEwFglRMYlQrkd
 /ZsRtrdtJPFHLtGUO/zSQyUZj9UYGZxDwiYddiaC+WwtDAYrxl3JiLcVVvrwQmp/2w5v
 LJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N784ODN9QEIjfrbfh+0ROuoQPbiX/v8ML/TY5fecPoo=;
 b=SttRgaM67KKgZ9Q1ujqu3zIBY83l5QORZ2+kOBI8LqVOVZCVKvGMSK9Ek9GWBc/9Xg
 8bcbsXji1s3PSi1hmp/rJiTc2k8r1FBGa++Z0kudUPLpMjOnqrr3nGPmcOx1HoQTCwVu
 XXeF/cocUM4wB5EP92PdL15kuy8Ugirhp2FlNkgg5bQj3Ii8LDUEnXkzauJeg1nc+dYv
 6Ce1CgJ+Zxbu7Od5xf/lJCRwfMJxHcDZeQoW3P7mNW7WfKmHMRY7t+Op8z0kzVO11N0N
 E6BcbSMRAyCnm0fgJA1Z/JomzYoZj7gqM8vw+wg5TT2m+0ID2hu+fO5FXgiFb31CaF01
 d8WA==
X-Gm-Message-State: AOAM533kqhR0/LqNuVw8v0/fAjvTkHhp0REM4wehfnybZGOMGT+1MebI
 Ci0SqN59Xo3i0FKPIOvHucVcSDIMR3E1Izk3oyE=
X-Google-Smtp-Source: ABdhPJwdPcU0h24VO3Vtzr/yrX1V3e4d5WZcY5LthjRh95JuRsye6B5+3UU4Es6hH+1WD6dIb09t92L2a2fsGsuHrrA=
X-Received: by 2002:a4a:b787:: with SMTP id a7mr8467332oop.18.1617903494628;
 Thu, 08 Apr 2021 10:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
 <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
 <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
In-Reply-To: <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Thu, 8 Apr 2021 10:37:38 -0700
Message-ID: <CAOw_LSHKf6wfPNFh=T0x5nz0PnBpd9kWYWvirvPnP+go2qayXQ@mail.gmail.com>
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

On Thu, Apr 8, 2021 at 10:10 AM David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2021-04-08 at 09:42 -0700, Daniel Lenski wrote:
> > On Thu, Apr 8, 2021 at 7:37 AM David Woodhouse <dwmw2@infradead.org> wrote:
> > > If we do need a header larger than 4 bytes, then we are forced to do
> > > things properly by adding support in the kernel driver instead of just
> > > abusing the existing header while we know the kernel isn't looking at
> > > it.
> >
> > This is probably too much "inside baseball" for the non-(OpenConnect
> > developers) here, but I *have* confirmed that the PPP-over-DTLS
> > encapsulation is identical to the PPP-over-TLS encapsulation for the 2
> > PPP-based protocols that we support already. Both F5 and Fortinet
> > essentially opted for the thinnest veneer of UDP-ization possible for
> > their protocols.
>
> Ok, so that's the PPP header plus either 6 bytes for Fortinet or 4
> bytes for F5? The important part for the purpose of this conversation
> is "more than four".

Correct. We need >4 bytes to support PPP-over-DTLS headers without copying.

And we will undoubtedly find more examples in the ongoing quest to
make OpenConnect serve as The One Client For Your Crappy Proprietary
Corporate VPN to Rule Them All.
