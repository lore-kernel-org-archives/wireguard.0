Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3845C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:28:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2116207E8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2ovTghrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2116207E8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e9a1873;
	Thu, 18 Jun 2020 19:09:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7122e971
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:09:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8df04b9c
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=fCIZKw+8ZaxOoYzH3Xjt0JMKFxs=; b=2ovTgh
 rpTXwnwNk+ruw97o4Yyp8ObkVdBZVdcnosWsAbF5jbzBd75J/jozrKsHfbPIgCzf
 jlLNU7S5RtLgIOC3jskCljoSxQ6Zv4KmMlgLDFhstRwKZr3ULNa4hNf40SP7Kwgy
 55tycUuPJ425l04u1PgKDcp5333FfckQ6rswrCDG1Gn1IxxcHAZJUoFe5G/iWeSy
 /bXDsTSBaeBekAmtSGB/ujCyA8eRfVzdAYMLKNhWIRS8vG9IsdKpVz8HITtUu2+U
 p2Np4FBSb0jTL0lkBLr/NtcwTYVG5JEMTO79XXB9PicUStDl79/CoT67U70f7Khx
 Mm4+IVZaOY23sz8Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 293b4abb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:09:31 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id p5so7013758ile.6
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 12:27:46 -0700 (PDT)
X-Gm-Message-State: AOAM533LrPeoIi0PL9p97snquMpBafzpjk55ioSsQXJ57f+7PjdqTwMD
 pbm8iWV11v75QxToZ9tsCZ1cxSYnLJB/LH3Qyhk=
X-Google-Smtp-Source: ABdhPJzFncgvBJIsga10br4y6TCmfE8tEOYr9dIQB4UJ9kqupK+NJgidKCYW/JbvJ/BiFU8VX9UREX4ATdY7msDNQU8=
X-Received: by 2002:a92:2515:: with SMTP id l21mr61048ill.64.1592508465877;
 Thu, 18 Jun 2020 12:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
In-Reply-To: <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jun 2020 13:27:35 -0600
X-Gmail-Original-Message-ID: <CAHmME9rkZL=7vgLOcwQC8YKUSAYYfh8i=+A+6tR=v1YvEDtp_Q@mail.gmail.com>
Message-ID: <CAHmME9rkZL=7vgLOcwQC8YKUSAYYfh8i=+A+6tR=v1YvEDtp_Q@mail.gmail.com>
Subject: Re: Kernel Panic after updating Kernel
To: Jean-Denis Girard <jd.girard@sysnux.pf>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Jun 18, 2020 at 10:48 AM Jean-Denis Girard <jd.girard@sysnux.pf> wrote:
> [   17.886512] wireguard: WireGuard 1.0.20200520 loaded. See
> www.wireguard.com for information.

20200520 is old. Have you tried the newer version yet?
