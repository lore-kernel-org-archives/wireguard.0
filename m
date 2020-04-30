Return-Path: <SRS0=YtMA=6O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED92C47254
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Apr 2020 23:22:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB42208CA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Apr 2020 23:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="iH1Om1lr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB42208CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1270c376;
	Thu, 30 Apr 2020 23:09:36 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9da5c941
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 23:09:33 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5a601e2
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=eu6zRC/sSQ61RszrgPpAyp4Th6Q=; b=iH1Om1
 lrKPMyOFutBvvdsFAy3ZfHE+BslRv0wNcwG7/2Q56rWRcc1mVvdoL6NyJgmSt6WR
 1PUQQOgVGxxNyoDSPsSQccYRUf9VyQEB0P6IBJKKbfS0mMA4AnNvFIktRQALpxzk
 b9Y6eIsIv5WVgO0KKnH++RU/Lzk4gNANT+SZsDd3/tfqtSMSrFeyC7UWWkO0tCB4
 sFjzOfoV9pUAaW50YqCz+QEIaY01a+b1yyYzEKGGSbOOy4lKyTzphB9nULbbfrOt
 DXSWhrsJTG9bJRec6Chw28zcM8BzPMHrwCrxePtF/uLEYvFmObdC/iXKTFkEReys
 Vasd1P4Chwpdtruw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 04d49849
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Apr 2020 23:09:33 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e9so3343269iok.9
 for <wireguard@lists.zx2c4.com>; Thu, 30 Apr 2020 16:21:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuZwpIy6TlLhYjYPO0S2VCfRJPAZkskn3aZ/L/BT59X0Z/jWYeiP
 oLWxnLxxQzzHCXY6s8CFchOHKm0AwoR2rz+IWeE=
X-Google-Smtp-Source: APiQypLUv9uCpbMui893sbcsLjXCD5kb+IEN2PBbciqZUKzPA61w06F3w7fkuD1BA542ZIU7yb1h6EPRvZllahm3OCA=
X-Received: by 2002:a5e:9401:: with SMTP id q1mr1273737ioj.80.1588288889837;
 Thu, 30 Apr 2020 16:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200430135551.9911-1-mardnh@gmx.de>
In-Reply-To: <20200430135551.9911-1-mardnh@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Apr 2020 17:21:19 -0600
X-Gmail-Original-Message-ID: <CAHmME9p0u2=i1+ApzsHicFy4VrGKOcE0sD_e5Yk5b-y9UrZBow@mail.gmail.com>
Message-ID: <CAHmME9p0u2=i1+ApzsHicFy4VrGKOcE0sD_e5Yk5b-y9UrZBow@mail.gmail.com>
Subject: Re: [PATCH] systemd: add file wireguard.target
To: Martin Hauke <mardnh@gmx.de>
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

Hey Martin,

Thanks for the patch. Note that this needs to be submitted with your
`Signed-off-by: ` line, which `git commit -s --amend` will add for
you.

On Thu, Apr 30, 2020 at 7:56 AM Martin Hauke <mardnh@gmx.de> wrote:
> +PartOf=wireguard.target

This won't reset wireguard interfaces configured by systemd-networkd,
nor interfaces configured manually, right? So maybe it's better to
call this wg-quick.target?

> +Description=Target to restart all parts of WireGuard

Is this verbage consistent with other systemd targets? Specifically,
is the "to restart" part apt? Or should this say something more
general?

Jason
